# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DICT_F="${P}.dict"
INS_AS="moegirl.dict"

SLOT=0
DESCRIPTION="Fcitx 5 dictionary generated from moegirl.org.cn"
HOMEPAGE="https://github.com/outloudvi/mw2fcitx"
LICENSE="Unlicense"
SRC_URI="https://github.com/outloudvi/mw2fcitx/releases/download/${PV}/${INS_AS} -> ${DICT_F}"
S="${WORKDIR}"

DEPEND="app-i18n/fcitx5"
RDEPEND="${DEPEND}"

KEYWORDS="~amd64"

src_unpack() {
	cp "${DISTDIR}/${DICT_F}" "${S}" || die
}

src_prepare() {
	mv "${DICT_F}" "${INS_AS}" || die
	eapply_user
}

src_install() {
	insinto /usr/share/fcitx5/pinyin/dictionaries/
	doins "${INS_AS}"
}
