# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emacs/markdown-mode/markdown-mode-1.8.1.ebuild,v 1.5 2011/12/26 14:17:33 ulm Exp $

EAPI=4

inherit elisp
inherit git-2

DESCRIPTION="Function for rdefs"
HOMEPAGE="http://github.com/ojima-h/"
SRC_URI="https://github.com/ojima-h/rdefs-el.git"
EGIT_REPO_URI="${SRC_URI}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
