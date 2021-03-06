# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils

DESCRIPTION="A zoomable user interface (ZUI)"
HOMEPAGE="http://eaglemode.sourceforge.net"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SRC_URI="mirror://sourceforge/${PN}/${PN}-${PV}/${PN}-${PV}.tar.bz2"

IUSE="doc examples freetype jpeg pdf png +postscript svg tiff vlc xine"

BDEPEND="
	>=dev-lang/perl-5.8
"
DEPEND="
	x11-libs/libX11
	freetype? ( media-libs/freetype )
	jpeg? ( media-libs/libjpeg-turbo )
	pdf? (
		app-text/poppler
		x11-libs/gtk+:2
	)
	png? ( media-libs/libpng )
	postscript? ( app-text/ghostscript-gpl )
	svg? ( gnome-base/librsvg )
	vlc? ( media-video/vlc )
	tiff? ( media-libs/tiff )
	xine? ( media-libs/xine-lib )
"
RDEPEND="
	${BDEPEND}
	${DEPEND}
"

use_em() {
	default
	if [ "$#" == "1" ]; then
		local mkn="em$(echo $1 | cut -c 1 | tr '[:lower:]' '[:upper:]')$(echo $1 | cut -c 2-)"
	elif [ "$#" == "2" ]; then
		local mkn="$2"
	else
		die "$0 takes 1 or 2 arguments"
	fi
	if use "!$1"; then
		local fn="makers/${mkn}.maker.pm"
		rm "${fn}" || die "Could not remove ${fn} despite -$1 set"
	fi
}

src_prepare() {
	local u
	for u in jpeg pdf png svg tiff; do
		use_em $u
	done
	use_em freetype font2em
	use_em postscript emPs
}

src_compile() {
	pm="perl make.pl build continue=yes"
	${pm} emAv= || die
	if use vlc; then
		${pm} emAv=vlc || die
	fi
	if use xine; then
		${pm} emAv=xine || die
	fi
}

src_install() {
	local em_dir="/usr/lib/${PN}"
	perl make.pl install dir="${em_dir}" root="${ED}" menu=yes bin=no || die

	cd "${ED}/${em_dir}"

	if use examples; then
		dodoc -r ./doc/examples
		docompress -x /usr/share/doc/${PF}/examples
	fi
	if use doc; then
		dodoc -r ./doc/html
		dodoc -r ./doc/ps
		docompress -x /usr/share/doc/${PF}/ps
	fi
	rm -r ./doc || die
	dosym "${EPREFIX}/usr/share/doc/${PF}" "${em_dir}"/doc

	for siz in 32 48 96; do
		doicon ./res/icons/"${PN}${siz}".png -s ${siz}
	done
	mv res "${ED}"/usr/share/eaglemode || die
	dosym "${EPREFIX}"/usr/share/eaglemode "${em_dir}"/res

	mkdir -p "${ED}"/etc || die
	mv etc "${ED}"/etc/eaglemode || die
	dosym "${EPREFIX}"/etc/eaglemode "${em_dir}"/etc

	ln -rs ./lib/*.so "${ED}"/usr/lib || die

	mkdir -p "${ED}"/usr/include || die
	ln -rs ./include/* "${ED}"/usr/include || die

	dosym "${em_dir}"/eaglemode.sh /usr/bin/eaglemode
	if use freetype; then
		dosym "${em_dir}"/bin/font2em /usr/bin/font2em
	fi
}

pkg_postinst() {
	elog "To work with certain file formats, some additional packages may need to be installed."
	elog "See http://eaglemode.sourceforge.net/SystemRequirements.html for a list."
	elog "This file is also installed as /usr/share/doc/${PF}/html/SystemRequirements.html if you have USE doc enabled."
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
