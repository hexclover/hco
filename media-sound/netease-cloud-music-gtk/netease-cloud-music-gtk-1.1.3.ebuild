# Copyright 2017-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.3.1

EAPI=7

CRATES="
aho-corasick-0.7.13
ansi_term-0.12.1
anyhow-1.0.34
arrayref-0.3.6
arrayvec-0.5.1
async-channel-1.4.1
async-executor-0.1.2
async-io-0.1.11
async-mutex-1.1.5
async-std-1.6.3
async-task-3.0.0
atk-0.9.0
atk-sys-0.10.0
atomic-waker-1.0.0
atty-0.2.14
autocfg-1.0.1
base64-0.12.3
bincode-1.3.1
bitflags-1.2.1
blake2b_simd-0.5.10
blocking-0.5.2
bumpalo-3.4.0
byteorder-1.3.4
bytes-0.5.6
cache-padded-1.1.1
cairo-rs-0.9.1
cairo-sys-rs-0.10.0
cc-1.0.59
cfg-if-0.1.10
cfg-if-1.0.0
chrono-0.4.15
concurrent-queue-1.2.2
constant_time_eq-0.1.5
crossbeam-channel-0.4.3
crossbeam-utils-0.7.2
curl-0.4.33
curl-sys-0.4.36+curl-7.71.1
custom_error-1.7.1
dbus-0.6.5
dirs-3.0.1
dirs-sys-0.3.5
either-1.6.1
encoding_rs-0.8.24
event-listener-2.4.0
fastrand-1.3.4
fnv-1.0.7
foreign-types-0.3.2
foreign-types-shared-0.1.1
fragile-1.0.0
futures-0.3.5
futures-channel-0.3.5
futures-core-0.3.5
futures-executor-0.3.5
futures-io-0.3.5
futures-lite-0.1.11
futures-macro-0.3.5
futures-sink-0.3.5
futures-task-0.3.5
futures-util-0.3.5
gdk-0.13.2
gdk-pixbuf-0.9.0
gdk-pixbuf-sys-0.10.0
gdk-sys-0.10.0
getrandom-0.1.14
gio-0.9.1
gio-sys-0.10.1
glib-0.10.3
glib-macros-0.10.1
glib-sys-0.10.1
gobject-sys-0.10.0
gstreamer-0.16.4
gstreamer-base-0.16.3
gstreamer-base-sys-0.9.1
gstreamer-player-0.16.3
gstreamer-player-sys-0.9.1
gstreamer-sys-0.9.1
gstreamer-video-0.16.4
gstreamer-video-sys-0.9.1
gtk-0.9.2
gtk-sys-0.10.0
heck-0.3.1
hermit-abi-0.1.15
hex-0.4.2
http-0.2.1
isahc-0.9.8
itertools-0.9.0
itoa-0.4.6
js-sys-0.3.44
kv-log-macro-1.0.7
lazy_static-1.4.0
libc-0.2.76
libdbus-sys-0.2.1
libnghttp2-sys-0.1.4+1.41.0
libz-sys-1.1.0
log-0.4.11
loggerv-0.7.2
memchr-2.3.3
mime-0.3.16
mpris-player-0.6.0
muldiv-0.2.1
multitask-0.2.0
num-0.3.0
num-bigint-0.3.0
num-complex-0.3.0
num-integer-0.1.43
num-iter-0.1.41
num-rational-0.3.0
num-traits-0.2.12
num_cpus-1.13.0
once_cell-1.4.1
openssl-0.10.30
openssl-probe-0.1.2
openssl-sys-0.9.58
pango-0.9.1
pango-sys-0.10.0
parking-1.0.6
parking-2.0.0
paste-1.0.2
pin-project-0.4.23
pin-project-internal-0.4.23
pin-project-lite-0.1.7
pin-utils-0.1.0
pkg-config-0.3.18
polling-0.1.5
ppv-lite86-0.2.9
pretty-hex-0.2.1
proc-macro-crate-0.1.5
proc-macro-error-1.0.4
proc-macro-error-attr-1.0.4
proc-macro-hack-0.5.18
proc-macro-nested-0.1.6
proc-macro2-1.0.24
quote-1.0.7
rand-0.7.3
rand_chacha-0.2.2
rand_core-0.5.1
rand_hc-0.2.0
redox_syscall-0.1.57
redox_users-0.3.5
regex-1.3.9
regex-syntax-0.6.18
rust-argon2-0.8.2
ryu-1.0.5
schannel-0.1.19
scoped-tls-1.0.0
serde-1.0.115
serde_derive-1.0.115
serde_json-1.0.57
slab-0.4.2
sluice-0.5.2
socket2-0.3.12
strum-0.18.0
strum_macros-0.18.0
syn-1.0.48
system-deps-1.3.2
thiserror-1.0.22
thiserror-impl-1.0.22
thread_local-1.0.1
time-0.1.44
toml-0.5.7
tracing-0.1.19
tracing-attributes-0.1.11
tracing-core-0.1.15
tracing-futures-0.2.4
unicode-segmentation-1.6.0
unicode-xid-0.2.1
urlqstring-0.3.5
vcpkg-0.2.10
vec-arena-0.5.2
version-compare-0.0.10
version_check-0.9.2
waker-fn-1.1.0
wasi-0.10.0+wasi-snapshot-preview1
wasi-0.9.0+wasi-snapshot-preview1
wasm-bindgen-0.2.67
wasm-bindgen-backend-0.2.67
wasm-bindgen-futures-0.4.17
wasm-bindgen-macro-0.2.67
wasm-bindgen-macro-support-0.2.67
wasm-bindgen-shared-0.2.67
web-sys-0.3.44
wepoll-sys-stjepang-1.0.6
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
xdg-2.2.0
"

inherit cargo desktop xdg-utils

DESCRIPTION="A player for NetEase Cloud Music based on Rust + GTK"
HOMEPAGE="https://github.com/gmg137/netease-cloud-music-gtk"
SRC_URI="
	https://github.com/gmg137/netease-cloud-music-gtk/archive/${PV}.tar.gz -> ${PN}-${PV}.tar.gz
	$(cargo_crate_uris ${CRATES})
"
LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 GPL-3+ GPL-3 MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
IUSE="libressl"
KEYWORDS="~amd64"

COMMON_DEPS="
	app-crypt/argon2
	dev-libs/libgcrypt
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
	media-libs/gstreamer
	media-libs/harfbuzz
	net-misc/curl
	x11-libs/gtk+:3
"
DEPEND="${COMMON_DEPS}"
RDEPEND="${COMMON_DEPS}"

src_install() {
	cargo_src_install

	domenu ${PN}.desktop
	doicon -s scalable icons/${PN}.svg
}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
	elog "For desktop lyrics support, install media-plugins/osdlyrics (available from the gentoo-zh overlay)."
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}