# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
VALA_USE_DEPEND="vapigen"

inherit gnome2-utils meson vala xdg-utils

DESCRIPTION="Unicode character map viewer and library"
HOMEPAGE="https://wiki.gnome.org/Apps/Gucharmap"
SRC_URI="https://gitlab.gnome.org/GNOME/gucharmap/-/archive/${PV}/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

IUSE="debug gtk-doc +introspection test vala"
RESTRICT="!test? ( test )"
REQUIRED_USE="vala? ( introspection )"

UNICODE_VERSION="13.0"

COMMON_DEPEND="
	=app-i18n/unicode-data-${UNICODE_VERSION}*
	>=dev-libs/glib-2.32:2
	>=x11-libs/pango-1.2.1[introspection?]
	>=x11-libs/gtk+-3.16:3[introspection?]
	media-libs/freetype:2
	introspection? ( >=dev-libs/gobject-introspection-0.9.0:= )
"
RDEPEND="${COMMON_DEPEND}"
DEPEND="${RDEPEND}
	vala? ( $(vala_depend) )
"
BDEPEND="
	dev-util/desktop-file-utils
	dev-util/glib-utils
	gtk-doc? ( dev-util/gtk-doc )
	>=dev-util/meson-0.50.0
	>=dev-util/intltool-0.40
	dev-util/itstool
	sys-devel/gettext
	virtual/pkgconfig
	test? (	app-text/docbook-xml-dtd:4.1.2 )
"

src_prepare() {
	eapply_user

	use vala && vala_src_prepare
}

src_configure() {
	local emesonargs=(
		$(meson_use debug dbg)
		$(meson_use introspection gir)
		$(meson_use vala vapi)
		$(meson_use gtk-doc docs)
		-Ducd_path=/usr/share/unicode-data
	)
	meson_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_schemas_update
}
