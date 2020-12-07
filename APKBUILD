# Contributor: Francesco Colista <francesco.colista@gmail.com>
# Maintainer: Francesco Colista <francesco.colista@gmail.com>
pkgname=figlet
pkgver=2.2.5
pkgrel=1
pkgdesc="Program for making large letters out of ordinary text"
url="http://www.figlet.org/"
arch="all"
license="BSD-3-Clause"
subpackages="$pkgname-doc"
source="ftp://ftp.figlet.org/pub/figlet/program/unix/figlet-$pkgver.tar.gz
        musl-fix-cplusplus-decls.patch
	chunky-font-default.patch
        "

build() {
        make DEFAULTFONTDIR=/usr/share/figlet/fonts all
}

#check() {
	# make check
#}

package() {
        make DESTDIR="$pkgdir" BINDIR=/usr/bin MANDIR=/usr/share/man \
        DEFAULTFONTDIR=/usr/share/figlet/fonts install
}


sha512sums="bb9610fd89a51dd3e65c485653fe1292f47dbca7cb9a05af4ce317f5d776bb346ae455aec07fc37c290f6658639920fd7c431c1135a0f4d456a21c0bd25f99fb  figlet-2.2.5.tar.gz
4ac1788686ff89c27747fe10b43de90f43c2aaa40476610cf5af52ff43c00e180b91acc1646658330fd534d223cef4643ab3c7f7bf0f6c9b5861601b1d8a05fe  musl-fix-cplusplus-decls.patch
7244f55dd90af80bc295c4411f5d63bcb9b0555b26da7f336bdfbfc7a2a80b55cdee36bd4fe618b7e0e344bc26a876fd316974dd7ce3d3be65613048ace4376b  chunky-font-default.patch"
