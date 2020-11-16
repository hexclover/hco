# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

MY_P="Work-Sans-${PV}"
DESCRIPTION="A grotesque sans-serif"
HOMEPAGE="https://github.com/weiweihuanghuang/Work-Sans/"
SRC_URI="https://github.com/weiweihuanghuang/Work-Sans/archive/v${PV}.tar.gz -> ${P}.tar.gz"

IUSE=""
LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="binchecks mirror strip"

S="${WORKDIR}/${MY_P}/fonts/static/TTF"
FONT_S=( "${S}/" )
FONT_SUFFIX="ttf"
