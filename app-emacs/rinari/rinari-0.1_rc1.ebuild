# Copyright 1999-2012 Ojima Hikaru
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp
inherit git-2

DESCRIPTION="Rinari Is Not A Ruby IDE."
HOMEPAGE="https://github.com/eschulte/rinari"
SRC_URI="https://github.com/eschulte/rinari.git"
EGIT_REPO_URI="${SRC_URI}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"
