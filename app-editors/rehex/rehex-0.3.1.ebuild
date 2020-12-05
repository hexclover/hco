# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0"

inherit desktop wxwidgets xdg-utils

DESCRIPTION="Reverse engineers' hex editor"
HOMEPAGE="https://github.com/solemnwarning/rehex"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
SRC_URI="https://github.com/solemnwarning/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

COMMON_DEPS="
	dev-libs/capstone
	dev-libs/jansson
	x11-libs/wxGTK:${WX_GTK_VER}[X]
"
DEPEND="${COMMON_DEPS}"
RDEPEND="${COMMON_DEPS}"

pkg_setup() {
	setup-wxwidgets
}

src_install() {
	emake prefix=/usr DESTDIR="${ED}" install
	dodoc README.md CHANGES.txt
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
