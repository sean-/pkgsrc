# $NetBSD: deinstall.mk,v 1.2 2013/05/09 23:37:26 riastradh Exp $

# _pkgformat-deinstall:
#	Removes a package from the system.
#
# See also:
#	deinstall
#
_pkgformat-deinstall: .PHONY
	${RUN}${PKG_UNINSTALL} ${PKGBASE}@${PKGVERSION}
