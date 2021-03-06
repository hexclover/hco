# Copyright 2010-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=(python{3_8,3_9})

inherit elisp-common multiprocessing python-any-r1 toolchain-funcs git-r3

EGIT_REPO_URI="https://github.com/fcitx/mozc"
EGIT_SUBMODULES=(src/third_party/japanese_usage_dictionary)

if [ "$(ver_cut 1)" == "9999" ]; then
	UT_V="$(ver_cut 2-)"
	EGIT_COMMIT=""
	KEYWORDS=""
else
	UT_V="$(ver_cut 5-)"
	EGIT_COMMIT="76b760ee9fa50f1ce0acf1dead0d26a0cb549258"
	KEYWORDS="~amd64"
fi
UT_PF="mozcdic-ut-${UT_V}"

MY_PN="mozc"
DESCRIPTION="Mozc + UT Dictionary"
HOMEPAGE="https://github.com/fcitx/mozc http://linuxplayers.g1.xrea.com/mozc-ut.html https://github.com/google/mozc"

# From mozc::gentoo
# Mozc: BSD
# src/data/dictionary_oss: ipadic, public-domain
# src/data/unicode: unicode
# japanese-usage-dictionary: BSD-2
LICENSE="BSD BSD-2 ipadic public-domain unicode"
# From http://linuxplayers.g1.xrea.com/mozc-ut.html
LICENSE+=" CC-BY-SA-3.0 Apache-2.0 public-domain"
SLOT="0"
IUSE="debug emacs fcitx5 +gui ibus renderer test"
REQUIRED_USE="|| ( emacs fcitx5 ibus )"
RESTRICT="!test? ( test )"

SRC_URI="https://osdn.net/users/utuhiro/pf/utuhiro/dl/${UT_PF}.tar.bz2"

BDEPEND="${PYTHON_DEPS}
	$(python_gen_any_dep 'dev-python/six[${PYTHON_USEDEP}]')
	>=dev-libs/protobuf-3.0.0
	dev-util/gyp
	dev-util/ninja
	virtual/pkgconfig
	emacs? ( app-editors/emacs:* )
	fcitx5? ( sys-devel/gettext )"
RDEPEND="!app-i18n/mozc
	>=dev-cpp/abseil-cpp-20200923.2[cxx17]
	>=dev-libs/protobuf-3.0.0:=
	emacs? ( app-editors/emacs:* )
	fcitx5? (
		app-i18n/fcitx5
		virtual/libintl
	)
	gui? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
	)
	ibus? (
		>=app-i18n/ibus-1.4.1
		dev-libs/glib:2
		x11-libs/libxcb
	)
	renderer? (
		dev-libs/glib:2
		x11-libs/cairo
		x11-libs/gtk+:2
		x11-libs/pango
	)
	"
DEPEND="${RDEPEND}
	test? (
		>=dev-cpp/gtest-1.8.0
		dev-libs/jsoncpp
	)"

S="${WORKDIR}/${P}/src"
UT_S="${WORKDIR}/${UT_PF}"

SITEFILE="50${MY_PN}-gentoo.el"

execute() {
	einfo "$@"
	"$@"
}

python_check_deps() {
	has_version -b "dev-python/six[${PYTHON_USEDEP}]"
}

src_unpack() {
	git-r3_src_unpack
	unpack ${A}
}

src_prepare() {
	eapply -p2 "${FILESDIR}/mozc-2.26.4289.100-system_libraries.patch"
	eapply -p2 "${FILESDIR}/mozc-2.25.4150.102-server_path_check.patch"
	eapply -p2 "${FILESDIR}/mozc-2.25.4150.102-tests_skipping.patch"

	rm -r unix/fcitx || die

	eapply_user

	sed \
		-e "s/def GypMain(options, unused_args):/def GypMain(options, gyp_args):/" \
		-e "s/RunOrDie(gyp_command + gyp_options)/RunOrDie(gyp_command + gyp_options + gyp_args)/" \
		-e "s/RunOrDie(\[ninja/&, '-j$(makeopts_jobs)', '-l$(makeopts_loadavg "${MAKEOPTS}" 0)', '-v'/" \
		-i build_mozc.py || die

	local ar=($(tc-getAR))
	local cc=($(tc-getCC))
	local cxx=($(tc-getCXX))
	local ld=($(tc-getLD))
	local nm=($(tc-getNM))
	local readelf=($(tc-getREADELF))

	# Use absolute paths. Non-absolute paths are mishandled by GYP.
	ar[0]=$(type -P ${ar[0]})
	cc[0]=$(type -P ${cc[0]})
	cxx[0]=$(type -P ${cxx[0]})
	ld[0]=$(type -P ${ld[0]})
	nm[0]=$(type -P ${nm[0]})
	readelf[0]=$(type -P ${readelf[0]})

	sed \
		-e "s:<!(which ar):${ar[@]}:" \
		-e "s:<!(which clang):${cc[@]}:" \
		-e "s:<!(which clang++):${cxx[@]}:" \
		-e "s:<!(which ld):${ld[@]}:" \
		-e "s:<!(which nm):${nm[@]}:" \
		-e "s:<!(which readelf):${readelf[@]}:" \
		-i gyp/common.gypi || die

	einfo "Adding mozc-ut dictionaries..."
	local f
	for f in "${UT_S}"/mozcdic-*-${UT_V}.txt; do
		einfo "Appending $f"
		cat "$f" >> ./data/dictionary_oss/dictionary00.txt || die
	done

	# https://github.com/google/mozc/issues/489
	sed \
		-e "/'-lc++'/d" \
		-e "/'-stdlib=libc++'/d" \
		-i gyp/common.gypi || die
}

src_configure() {
	if use debug; then
		BUILD_TYPE="Debug"
	else
		BUILD_TYPE="Release"
	fi

	local gyp_arguments=()

	if tc-is-gcc; then
		gyp_arguments+=(-D compiler_host=gcc -D compiler_target=gcc)
	elif tc-is-clang; then
		gyp_arguments+=(-D compiler_host=clang -D compiler_target=clang)
	else
		gyp_arguments+=(-D compiler_host=unknown -D compiler_target=unknown)
	fi

	gyp_arguments+=(-D debug_extra_cflags=)
	gyp_arguments+=(-D release_extra_cflags=)

	gyp_arguments+=(-D use_fcitx=NO)
	gyp_arguments+=(-D use_fcitx5=$(usex fcitx5 YES NO))
	gyp_arguments+=(-D use_libibus=$(usex ibus 1 0))
	gyp_arguments+=(-D use_libabseilcpp=1)
	gyp_arguments+=(-D use_libgtest=$(usex test 1 0))
	gyp_arguments+=(-D use_libjsoncpp=$(usex test 1 0))
	gyp_arguments+=(-D use_libprotobuf=1)
	gyp_arguments+=(-D enable_gtk_renderer=$(usex renderer 1 0))

	gyp_arguments+=(-D server_dir="${EPREFIX}/usr/libexec/mozc")
	gyp_arguments+=(-D document_dir="${EPREFIX}/usr/libexec/mozc/documents")

	if use ibus; then
		gyp_arguments+=(-D ibus_mozc_path="${EPREFIX}/usr/libexec/ibus-engine-mozc")
		gyp_arguments+=(-D ibus_mozc_icon_path="${EPREFIX}/usr/share/ibus-mozc/product_icon.png")
	fi

	unset AR CC CXX LD NM READELF

	execute "${PYTHON}" build_mozc.py gyp \
		--gypdir="${EPREFIX}/usr/bin" \
		--server_dir="${EPREFIX}/usr/libexec/mozc" \
		--verbose \
		$(usex gui "" --noqt) \
		-- "${gyp_arguments[@]}" || die "Configuration failed"
}

src_compile() {
	local targets=(server/server.gyp:mozc_server)
	if use emacs; then
		targets+=(unix/emacs/emacs.gyp:mozc_emacs_helper)
	fi
	if use fcitx5; then
		targets+=(unix/fcitx5/fcitx5.gyp:fcitx5-mozc)
	fi
	if use gui; then
		targets+=(gui/gui.gyp:mozc_tool)
	fi
	if use ibus; then
		targets+=(unix/ibus/ibus.gyp:ibus_mozc)
	fi
	if use renderer; then
		targets+=(renderer/renderer.gyp:mozc_renderer)
	fi
	if use test; then
		targets+=(gyp/tests.gyp:unittests)
	fi

	execute "${PYTHON}" build_mozc.py build -c ${BUILD_TYPE} -v "${targets[@]}" || die "Building failed"

	if use emacs; then
		elisp-compile unix/emacs/*.el
	fi
}

src_test() {
	execute "${PYTHON}" build_mozc.py runtests -c ${BUILD_TYPE} --test_jobs 1 || die "Testing failed"
}

src_install() {
	exeinto /usr/libexec/mozc
	doexe out_linux/${BUILD_TYPE}/mozc_server

	if use gui; then
		doexe out_linux/${BUILD_TYPE}/mozc_tool
	fi

	if use renderer; then
		doexe out_linux/${BUILD_TYPE}/mozc_renderer
	fi

	insinto /usr/libexec/mozc/documents
	doins data/installer/credits_en.html

	if use emacs; then
		dobin out_linux/${BUILD_TYPE}/mozc_emacs_helper
		elisp-install mozc unix/emacs/*.{el,elc}
		elisp-site-file-install "${FILESDIR}/${SITEFILE}" mozc
	fi

	if use fcitx5; then
		local po_dir="unix/fcitx5/po"
		local pofile
		local mofile
		for pofile in "${po_dir}"/*.po; do
			local locale
			locale="${pofile##*/}"
			locale="${locale%.po}"
			mofile="${po_dir}/${locale}.mo"
			msgfmt "${pofile}" -o "${mofile}"
		done
		MOPREFIX="fcitx5-mozc" domo "${po_dir}"/*.mo

		exeinto /usr/$(get_libdir)/fcitx5
		doexe out_linux/${BUILD_TYPE}/fcitx5-mozc.so

		insinto /usr/share/fcitx5/addon
		newins unix/fcitx5/mozc-addon.conf mozc.conf

		sed -i "s|PREFIX|/usr|g" unix/fcitx5/mozc.conf
		insinto /usr/share/fcitx5/inputmethod
		doins unix/fcitx5/mozc.conf

		insinto /usr/share/fcitx5/mozc/icon
		newins data/images/product_icon_32bpp-128.png mozc.png
		doins data/images/unix/ui-alpha_full.png
		doins data/images/unix/ui-alpha_half.png
		doins data/images/unix/ui-direct.png
		doins data/images/unix/ui-hiragana.png
		doins data/images/unix/ui-katakana_full.png
		doins data/images/unix/ui-katakana_half.png
		doins data/images/unix/ui-dictionary.png
		doins data/images/unix/ui-properties.png
		doins data/images/unix/ui-tool.png
	fi

	if use ibus; then
		exeinto /usr/libexec
		newexe out_linux/${BUILD_TYPE}/ibus_mozc ibus-engine-mozc

		insinto /usr/share/ibus/component
		doins out_linux/${BUILD_TYPE}/gen/unix/ibus/mozc.xml

		insinto /usr/share/ibus-mozc
		newins data/images/unix/ime_product_icon_opensource-32.png product_icon.png
		local image
		for image in data/images/unix/ui-*.png; do
			newins "${image}" "${image#data/images/unix/ui-}"
		done
	fi
}

pkg_postinst() {
	elog
	elog "ENVIRONMENTAL VARIABLES"
	elog
	elog "MOZC_SERVER_DIRECTORY"
	elog "  Mozc server directory"
	elog "  Value used by default: \"${EPREFIX}/usr/libexec/mozc\""
	elog "MOZC_DOCUMENTS_DIRECTORY"
	elog "  Mozc documents directory"
	elog "  Value used by default: \"${EPREFIX}/usr/libexec/mozc/documents\""
	elog "MOZC_CONFIGURATION_DIRECTORY"
	elog "  Mozc configuration directory"
	elog "  Value used by default: \"~/.mozc\""
	elog
	if use emacs; then
		elog
		elog "USAGE IN EMACS"
		elog
		elog "mozc-mode is minor mode to input Japanese text using Mozc server."
		elog "mozc-mode can be used via LEIM (Library of Emacs Input Method)."
		elog
		elog "In order to use mozc-mode by default, the following settings should be added to"
		elog "Emacs init file (~/.emacs.d/init.el or ~/.emacs):"
		elog
		elog "  (require 'mozc)"
		elog "  (set-language-environment \"Japanese\")"
		elog "  (setq default-input-method \"japanese-mozc\")"
		elog
		elog "With the above settings, typing C-\\ (which is bound to \"toggle-input-method\""
		elog "by default) will enable mozc-mode."
		elog
		elog "Alternatively, at run time, after loading mozc.el, mozc-mode can be activated by"
		elog "calling \"set-input-method\" and entering \"japanese-mozc\"."
		elog

		elisp-site-regen
	fi
}

pkg_postrm() {
	if use emacs; then
		elisp-site-regen
	fi
}
