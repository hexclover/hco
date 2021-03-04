# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="CJK programming font based on Iosevka and Source Han Sans"
HOMEPAGE="https://github.com/be5invis/Sarasa-Gothic/"
SRC_URI="${HOMEPAGE}/releases/download/v${PV}/${PN}-ttc-${PV}.7z"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/p7zip"

RESTRICT="binchecks mirror strip"

S=${WORKDIR}
FONT_S=${S}
FONT_SUFFIX="ttc"
