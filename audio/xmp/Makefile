# $NetBSD: Makefile,v 1.49 2017/01/21 20:06:48 ryoon Exp $

DISTNAME=	xmp-4.0.10
PKGREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=xmp/}

MAINTAINER=	rxg@NetBSD.org
HOMEPAGE=	http://xmp.sourceforge.net/
COMMENT=	Player for many different Amiga and PC module formats
LICENSE=	gnu-gpl-v2

USE_TOOLS+=	gmake pkg-config
GNU_CONFIGURE=	yes

EGDIR=		${PREFIX}/share/examples/xmp
CONF_FILES=	${EGDIR}/modules.conf ${PKG_SYSCONFDIR}/xmp/modules.conf
CONF_FILES+=	${EGDIR}/xmp.conf ${PKG_SYSCONFDIR}/xmp/xmp.conf

INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 ${EGDIR}
INSTALL_MAKE_FLAGS+=	INSTALL=${INSTALL:Q}

.include "options.mk"

.include "../../audio/libxmp/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
