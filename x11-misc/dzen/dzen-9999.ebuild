# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs multilib git-2

SLOT="2"
MY_P="${PN}${SLOT}-${PV}"

DESCRIPTION="a general purpose messaging, notification and menuing program for
X11."
HOMEPAGE="https://github.com/robm/dzen"
EGIT_REPO_URI="https://github.com/robm/dzen.git"

LICENSE="MIT"
KEYWORDS="amd64 x86"
IUSE="minimal xinerama xpm xft"

RDEPEND="x11-libs/libX11
	xinerama? ( x11-libs/libXinerama )
	xpm? ( x11-libs/libXpm )"
DEPEND="${RDEPEND}
	xinerama? ( x11-proto/xineramaproto )
	xft? ( x11-libs/libXft )"

S=${WORKDIR}/${MY_P}

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	sed -i \
		-e 's:../dzen2:dzen2:' \
		gadgets/kittscanner.sh || die

	sed -e "s:/usr/local:/usr:g" \
		-e 's:-Os::g' \
		-e "s:CFLAGS =:CFLAGS +=:g" \
		-e '/^CC.*/d' \
		-e 's:^LDFLAGS =:LDFLAGS +=:' \
		-e "s:/usr/lib :/usr/$(get_libdir):" \
		-i config.mk gadgets/config.mk || die "sed failed"
	sed -i -e "/strip/d" Makefile gadgets/Makefile || die "sed failed"
	if use xinerama ; then
		sed -e "/^LIBS/s/$/\ -lXinerama/" \
			-e "/^CFLAGS/s/$/\ -DDZEN_XINERAMA/" \
			-i config.mk || die "sed failed"
	fi
	if use xpm ; then
		sed -e "/^LIBS/s/$/\ -lXpm/" \
			-e "/^CFLAGS/s/$/\ -DDZEN_XPM/" \
			-i config.mk || die "sed failed"
	fi
	if ! use xft; then
		sed -e "/^LIBS/s/\ \`pkg-config --libs xft\`//" \
			-e "/^CFLAGS/s/\ -DDZEN_XFT \`pkg-config --cflags xft\`//" \
			-i config.mk || die "sed failed"
	fi
}

src_compile() {
	tc-export CC
	emake || die "emake failed"

	if ! use minimal ; then
		cd "${S}"/gadgets
		emake || die "emake gadgets failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README || die

	if ! use minimal ; then
		cd "${S}"/gadgets
		emake DESTDIR="${D}" install || die "emake gadgets install failed"
		dobin *.sh || die
		dodoc README* || die
	fi
}
