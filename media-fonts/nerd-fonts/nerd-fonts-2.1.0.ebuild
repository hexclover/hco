# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit font

# TODO: add USEs
DESCRIPTION="A collection of patched popular programming fonts with additional glyphs (huge package!)"
HOMEPAGE="https://github.com/ryanoasis/nerd-fonts"
SRC_URI="
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/3270.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Agave.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/AnonymousPro.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Arimo.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/AurulentSansMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/BigBlueTerminal.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/BitstreamVeraSansMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CascadiaCode.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/CodeNewRoman.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Cousine.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DaddyTimeMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DejaVuSansMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/DroidSansMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FantasqueSansMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FiraCode.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/FiraMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Go-Mono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Gohu.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hack.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hasklig.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/HeavyData.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Hermit.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/iA-Writer.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/IBMPlexMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Inconsolata.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/InconsolataGo.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/InconsolataLGC.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Iosevka.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/JetBrainsMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Lekton.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/LiberationMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Meslo.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Monofur.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Monoid.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Mononoki.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/MPlus.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Noto.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/OpenDyslexic.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Overpass.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ProFont.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ProggyClean.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/RobotoMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/ShareTechMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/SourceCodePro.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/SpaceMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Terminus.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Tinos.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/Ubuntu.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/UbuntuMono.zip
    https://github.com/ryanoasis/nerd-fonts/releases/download/v${PV}/VictorMono.zip
"

IUSE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-arch/unzip"

RESTRICT="binchecks mirror strip"

S=${WORKDIR}
FONT_S=${S}
FONT_SUFFIX="otf ttf"
