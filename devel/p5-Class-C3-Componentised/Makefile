# $NetBSD: Makefile,v 1.14 2016/06/08 19:22:39 wiz Exp $

DISTNAME=	Class-C3-Componentised-1.001000
PKGNAME=	p5-${DISTNAME:S/00$//}
PKGREVISION=	5
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=../../authors/id/F/FR/FREW/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/perldoc?Class::C3::Componentised
COMMENT=	Load mix-ins or components to your C3-based class
LICENSE=	${PERL5_LICENSE}

BUILD_DEPENDS+=	p5-Test-Exception-[0-9]*:../../devel/p5-Test-Exception
DEPENDS+=	p5-Class-Inspector>=0:../../devel/p5-Class-Inspector
DEPENDS+=	p5-Class-C3>=0.20:../../devel/p5-Class-C3
DEPENDS+=	p5-MRO-Compat>=0:../../devel/p5-MRO-Compat

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Class/C3/Componentised/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
