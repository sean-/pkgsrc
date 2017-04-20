# $NetBSD: Makefile,v 1.30 2017/01/01 16:06:18 adam Exp $

PKGREVISION= 2
.include "../../graphics/exiv2/Makefile.common"

PKGNAME=	${DISTNAME:S/exiv2/exiv2-organize/}

USE_TOOLS+=		pkg-config
BUILD_DIRS=		contrib/organize
INSTALLATION_DIRS=	bin

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/contrib/organize/organize \
		${DESTDIR}${PREFIX}/bin/exiv2-organize

CXX_REQD+=	c++0x

.include "../../graphics/exiv2/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
