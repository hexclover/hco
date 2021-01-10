# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

MY_PN="Libertinus"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Fork of Linux Libertine fonts with many improvements"
HOMEPAGE="https://github.com/alerque/libertinus/"
SRC_URI="https://github.com/alerque/libertinus/releases/download/v${PV}/${MY_P}.tar.xz -> ${P}.tar.xz"

IUSE="doc"
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DOCS="AUTHORS.txt CONTRIBUTORS.txt FONTLOG.txt OFL.txt"

DEPEND=""

RESTRICT="binchecks mirror strip"

S="${WORKDIR}/${MY_P}"
FONT_S="${S}"
FONT_SUFFIX="otf"

src_unpack() {
	unpack ${A}

	mv "${S}"/static/OTF/* "${FONT_S}" || die
}

src_install() {
	font_src_install
	use doc && dodoc -r "${S}"/documentation/*.pdf
}
