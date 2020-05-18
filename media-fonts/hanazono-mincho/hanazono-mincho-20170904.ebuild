# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="Free CJK kanji font based on glyphs from GlyphWiki"
HOMEPAGE="https://fonts.jp/hanazono/"
SRC_URI="https://osdn.net/projects/hanazono-font/downloads/68253/hanazono-${PV}.zip"

LICENSE="|| ( OFL-1.1 hanazono-font )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

RESTRICT="binchecks mirror strip"

S=${WORKDIR}
FONT_S=${S}
FONT_SUFFIX="ttf"

DOCS="LICENSE.txt THANKS.txt README.txt"

