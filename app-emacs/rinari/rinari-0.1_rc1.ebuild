# Copyright 1999-2012 Ojima Hikaru
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit elisp
inherit git-2

DESCRIPTION="Rinari Is Not A Ruby IDE."
HOMEPAGE="https://github.com/eschulte/rinari"
SRC_URI="https://github.com/eschulte/rinari.git"
BYTECOMPFLAGS="-L ${WORKDIR}/${PF} -L ${WORKDIR}/${PF}/util -L ${WORKDIR}/${PF}/util/inf-ruby -L ${WORKDIR}/${PF}/util/jump"
EGIT_REPO_URI="${SRC_URI}"
EGIT_HAS_SUBMODULES=true

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

SITEFILE="50${PN}-gentoo.el"

#elisp_src_compile() {
#	for el in `find . -name "*.el"`; do
#		(cd `dirname ${el}` && elisp-compile `basename ${el}` || die)
#	done
#}

elisp_src_install() {
	insopts -D
	for d in `find . -name ".git*" -prune -o -type d | grep -v "\.git.*"`; do
		(cd ${d} && (for f in `find . -maxdepth 1 -type f`;do elisp-install ${PN}/${d} \
		${f}; done) || die)
	done
	if [[ -n ${SITEFILE} ]]; then
		elisp-site-file-install "${FILESDIR}/${SITEFILE}" || die
	fi
}

