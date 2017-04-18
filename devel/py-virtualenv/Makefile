# $NetBSD: Makefile,v 1.35 2016/11/28 15:15:40 wiz Exp $

DISTNAME=	virtualenv-15.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=v/virtualenv/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://pypi.python.org/pypi/virtualenv
COMMENT=	Virtual Python Environment builder
LICENSE=	mit

REPLACE_PYTHON=	virtualenv.py

.include "../../mk/bsd.prefs.mk"

SUBST_CLASSES+=		arch
SUBST_STAGE.arch=	pre-configure
SUBST_FILES.arch=	virtualenv.py
.if !empty(MULTIARCH:M[Yy][Ee][Ss])
SUBST_SED.arch=		-e 's|@BINARCHSUFFIX32@|${BINARCHSUFFIX.32:S/\///}|'
SUBST_SED.arch+=	-e 's|@BINARCHSUFFIX64@|${BINARCHSUFFIX.64:S/\///}|'
.else
SUBST_SED.arch=		-e 's|@BINARCHSUFFIX32@||'
SUBST_SED.arch+=	-e 's|@BINARCHSUFFIX64@||'
.endif

post-install:
	if ${TEST} -f ${DESTDIR}${PREFIX}/bin/virtualenv; then		\
		${MV} ${DESTDIR}${PREFIX}/bin/virtualenv		\
		${DESTDIR}${PREFIX}/bin/virtualenv-${PYVERSSUFFIX}; 	\
	fi

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
