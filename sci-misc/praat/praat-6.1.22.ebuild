# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils desktop

DESCRIPTION="Speech analyzer and synthesizer"
HOMEPAGE="https://www.fon.hum.uva.nl/praat/"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

SRC_URI="https://github.com/praat/praat/archive/v${PV}.tar.gz -> ${P}.tar.gz"

IUSE="pulseaudio"

BDEPEND=""
DEPEND="
	x11-libs/gtk+:2
	x11-libs/pango
	media-libs/alsa-lib
	pulseaudio? ( media-sound/pulseaudio )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cp ./makefiles/makefile.defs.linux."$(usex pulseaudio pulse alsa)" ./makefile.defs || die
	sed -i s/-static-libgcc// ./makefile.defs || die
	sed -i s/-static-libstdc++// ./makefile.defs || die
	# fix typo
	sed -i s/-Werror=implicits/-Werror=implicit/ ./makefile.defs

	eapply_user
}

src_install() {
	dobin praat
	doicon -s scalable "${FILESDIR}"/${PN}.svg
	make_desktop_entry "${PN}" Praat "${PN}" Science
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
