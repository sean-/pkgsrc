# $NetBSD: Makefile,v 1.41 2017/02/12 06:26:02 ryoon Exp $

PKGREVISION= 3
.include "../../meta-pkgs/xfce4/Makefile.common"

VERSION=	1.0.99
DISTNAME=	xfce4-battery-plugin-${VERSION}
CATEGORIES=	sysutils
MASTER_SITES=	http://archive.xfce.org/src/panel-plugins/xfce4-battery-plugin/1.0/

HOMEPAGE=	http://goodies.xfce.org/projects/panel-plugins/xfce4-battery-plugin
COMMENT=	Xfce battery monitor plugin

# On NetBSD/sparc64, apmvar.h is not exist in /usr/include/machine.
# Reported in PR port-sparc64/36735.
.if ${OPSYS} == "NetBSD" &&			\
    (!exists(/usr/include/machine/apmvar.h) &&	\
     !exists(/usr/include/dev/apm/apmio.h) && \
     !exists(/usr/include/sparc/apmio.h))
PKG_FAIL_REASON+=	"APM is not available on ${MACHINE_PLATFORM}."
.endif

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
