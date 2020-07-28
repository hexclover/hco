# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils desktop

MY_P="anki-${PV}-linux-amd64"

DESCRIPTION="A spaced-repetition memory training program (flash cards)"
HOMEPAGE="https://apps.ankiweb.net"
SRC_URI="https://github.com/ankitects/anki/releases/download/${PV}/${MY_P}.tar.bz2"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="latex +recording +sound"
RESTRICT=""
REQUIRED_USE=""

RDEPEND="recording? ( media-sound/lame )
	sound? ( media-video/mpv )
	latex? (
		app-text/texlive
		app-text/dvipng
	)
	!app-misc/anki
"
DEPEND="${RDEPEND}"

src_compile() {
	:;
}

src_install() {
	dir="${ED}"/opt/${PN}
	mkdir -p "${dir}"
	doicon anki.xpm
	doicon anki.png
	domenu anki.desktop
	doman anki.1
	insinto /usr/share/mime/packages
	doins anki.xml
	rm anki.{xpm,png,desktop,1} || die
	cp -a * "${dir}"
	dosym "${dir}/bin/anki" /usr/bin/anki
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
