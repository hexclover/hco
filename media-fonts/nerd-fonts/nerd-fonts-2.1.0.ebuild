# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

DESCRIPTION="Patched programming fonts with additional glyphs (huge package)"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/3270.zip -> ${P}-3270.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Agave.zip -> ${P}-Agave.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/AnonymousPro.zip -> ${P}-AnonymousPro.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Arimo.zip -> ${P}-Arimo.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/AurulentSansMono.zip -> ${P}-AurulentSansMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/BigBlueTerminal.zip -> ${P}-BigBlueTerminal.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/BitstreamVeraSansMono.zip -> ${P}-BitstreamVeraSansMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CascadiaCode.zip -> ${P}-CascadiaCode.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CodeNewRoman.zip -> ${P}-CodeNewRoman.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Cousine.zip -> ${P}-Cousine.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DaddyTimeMono.zip -> ${P}-DaddyTimeMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DejaVuSansMono.zip -> ${P}-DejaVuSansMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DroidSansMono.zip -> ${P}-DroidSansMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FantasqueSansMono.zip -> ${P}-FantasqueSansMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FiraCode.zip -> ${P}-FiraCode.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FiraMono.zip -> ${P}-FiraMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Go-Mono.zip -> ${P}-Go-Mono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Gohu.zip -> ${P}-Gohu.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hack.zip -> ${P}-Hack.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hasklig.zip -> ${P}-Hasklig.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/HeavyData.zip -> ${P}-HeavyData.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hermit.zip -> ${P}-Hermit.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/iA-Writer.zip -> ${P}-iA-Writer.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/IBMPlexMono.zip -> ${P}-IBMPlexMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Inconsolata.zip -> ${P}-Inconsolata.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/InconsolataGo.zip -> ${P}-InconsolataGo.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/InconsolataLGC.zip -> ${P}-InconsolataLGC.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Iosevka.zip -> ${P}-Iosevka.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/JetBrainsMono.zip -> ${P}-JetBrainsMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Lekton.zip -> ${P}-Lekton.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/LiberationMono.zip -> ${P}-LiberationMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Meslo.zip -> ${P}-Meslo.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Monofur.zip -> ${P}-Monofur.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Monoid.zip -> ${P}-Monoid.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Mononoki.zip -> ${P}-Mononoki.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/MPlus.zip -> ${P}-MPlus.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Noto.zip -> ${P}-Noto.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/OpenDyslexic.zip -> ${P}-OpenDyslexic.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Overpass.zip -> ${P}-Overpass.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ProFont.zip -> ${P}-ProFont.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ProggyClean.zip -> ${P}-ProggyClean.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/RobotoMono.zip -> ${P}-RobotoMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ShareTechMono.zip -> ${P}-ShareTechMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/SourceCodePro.zip -> ${P}-SourceCodePro.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/SpaceMono.zip -> ${P}-SpaceMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Terminus.zip -> ${P}-Terminus.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Tinos.zip -> ${P}-Tinos.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Ubuntu.zip -> ${P}-Ubuntu.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/UbuntuMono.zip -> ${P}-UbuntuMono.zip
	https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/VictorMono.zip -> ${P}-VictorMono.zip
"

IUSE="+otf +ttf"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

RESTRICT="binchecks mirror strip"

S=${WORKDIR}
FONT_S=${S}
FONT_SUFFIX=""

src_prepare() {
	find . -name "*Windows Compatible*" -exec rm -f {} + || die
	eapply_user
}

src_install() {
	use otf && FONT_SUFFIX="otf" font_src_install
	use ttf && FONT_SUFFIX="ttf" font_src_install
}
