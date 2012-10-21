# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_P="fxlinuxprint-src-1.0.1"

DESCRIPTION="PPD files of Fuji Xerox printers (ApeosPort II / III/ IV) for CUPS printing system"
HOMEPAGE="http://www.fujixerox.co.jp/download/apeosport/download/c4300series/linux/"
SRC_URI="http://download.fujixerox.co.jp/pub/exe/apeosport/c4300series/${MY_P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="net-print/cups"

S="${WORKDIR}/${MY_P}"

# Suppressing warnings from the incorrect upstream tarball

src_unpack() {
	unpack ${A} 2> /dev/null
}

src_install() {
	#emake install DESTDIR=${D}

	insinto /usr/share/cups/model
	doins fxlinuxprint.ppd || die "missing ppd files"
	fperms 755 /usr/share/cups/model/fxlinuxprint.ppd

	insinto /usr/libexec/cups/filter
	doins pdftopdffx pdftopjlfx pstopdffx || die "missing filter files"
	fperms 755 /usr/libexec/cups/filter/{pdftopdffx,pdftopjlfx,pstopdffx}

	insinto /usr/share/cups/mime
	doins mimefx.{convs,types} || die "missing mime files"
	fperms 755 /usr/share/cups/mime/mimefx.*
}
