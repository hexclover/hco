# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="37.0_13.0_0_2"

DESCRIPTION="Emoji annotation files in CLDR"
HOMEPAGE="https://github.com/fujiwarat/cldr-emoji-annotation"
SRC_URI="https://github.com/fujiwarat/${PN}/releases/download/${MY_PV}/${PN}-${MY_PV}.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="Unicode_License"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="
	${DEPEND}
	!app-i18n/unicode-cldr
"
BDEPEND=""
