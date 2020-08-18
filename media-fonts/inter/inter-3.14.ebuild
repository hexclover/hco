# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="UI-optimized sans-serif with high legibility at small sizes"
HOMEPAGE="https://rsms.me/inter/"
SRC_URI="https://github.com/rsms/inter/releases/download/v${PV}/Inter-${PV}.zip"

IUSE=""
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

RESTRICT="binchecks mirror strip"

S=${WORKDIR}
FONT_S=( "${S}/Inter Desktop" )
FONT_SUFFIX="otf"
