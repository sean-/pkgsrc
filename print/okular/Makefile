# $NetBSD: Makefile,v 1.62 2017/05/02 13:37:32 wiz Exp $

DISTNAME=	okular-16.08.0
PKGREVISION=	4
CATEGORIES=	print
COMMENT=	KDE universal document viewer
MASTER_SITES=	${MASTER_SITE_KDE:=applications/16.08.0/src/}

CFLAGS.SunOS+=	-D__EXTENSIONS__

.include "../../meta-pkgs/kde4/Makefile.kde4"

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../devel/chmlib/buildlink3.mk"
.include "../../graphics/djvulibre-lib/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/libkexiv2/buildlink3.mk"
.include "../../graphics/qimageblitz/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../print/libspectre/buildlink3.mk"
.include "../../print/poppler-qt4/buildlink3.mk"
.include "../../security/qca2/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/ebook-tools/buildlink3.mk"
.include "../../x11/libkactivities4/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../graphics/kdegraphics-mobipocket/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
