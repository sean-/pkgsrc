# $NetBSD: package.mk,v 1.15 2016/05/09 00:07:23 joerg Exp $

#FILEBASE?=		${PKGBASE}
#PKGFILE?=		${PKGREPOSITORY}/${FILEBASE}-${PKGVERSION}${PKG_SUFX}
#STAGE_PKGFILE?=		${WRKDIR}/.packages/${FILEBASE}-${PKGVERSION}${PKG_SUFX}
#PKGREPOSITORY?=		${PACKAGES}/${PKGREPOSITORYSUBDIR}
#PKGREPOSITORYSUBDIR?=	All
P5M=				${WRKDIR}/${PKGBASE}.p5m
STAGE_PACKAGES?=		${WRKDIR}/.packages
PACKAGES_REPOFILE?=		${PACKAGES}/pkg5.repository
STAGE_PACKAGES_REPOFILE?=	${STAGE_PACKAGES}/pkg5.repository
PKG_FMRI?=			pkg://pkgsrc/${PKGPATH:C/\/.*//}/${PKGBASE}@${PKGVERSION},5.11-${PKGREVISION:U0}

.PHONY: ${P5M}
${P5M}:
	@${PKGSEND} generate ${DESTDIR} >${P5M}.1
	@${ECHO} "set name=pkg.fmri value=${PKG_FMRI}" >${P5M}.2
	@${ECHO} "set name=pkg.summary value=\"${COMMENT}\"" >>${P5M}.2
	@${ECHO} "<transform dir path=${PREFIX:C/^\///}$$ -> drop>" >${P5M}.mog
	@${ECHO} "<transform dir path=${PREFIX:C/^\///}/bin$$ -> drop>" >>${P5M}.mog
	@${PKGMOG} ${P5M}.1 ${P5M}.2 ${PKGSRCDIR}/mk/pkgformat/ips/mogrify ${P5M}.mog | ${PKGFMT} -u >${P5M}

${PACKAGES_REPOFILE}:
	@${RUN}${RM} -rf ${PACKAGES}
	@${PKGREPO} create ${PACKAGES}
	@${PKGREPO} add-publisher -s ${PACKAGES} pkgsrc

${STAGE_PACKAGES_REPOFILE}:
	@${RUN}${RM} -rf ${STAGE_PACKAGES}
	@${PKGREPO} create ${STAGE_PACKAGES}
	@${PKGREPO} add-publisher -s ${STAGE_PACKAGES} pkgsrc

######################################################################
### package-create (PRIVATE, pkgsrc/mk/package/package.mk)
######################################################################
### package-create creates the binary package.
###
.PHONY: package-create
package-create: ${P5M} ${PACKAGES_REPOFILE}
	@${PKGSEND} publish -s ${PACKAGES} -d ${DESTDIR} ${P5M} >/dev/null

######################################################################
### stage-package-create (PRIVATE, pkgsrc/mk/package/package.mk)
######################################################################
### stage-package-create creates the binary package for stage install.
###
.PHONY: stage-package-create
stage-package-create: stage-install ${P5M} ${STAGE_PACKAGES_REPOFILE}
	@${PKGSEND} publish -s ${STAGE_PACKAGES} -d ${DESTDIR} ${P5M} >/dev/null

######################################################################
### package-remove (PRIVATE)
######################################################################
### package-remove removes the binary package from the package
### repository.
###
.PHONY: package-remove
package-remove:
	@${PKGREPO} remove -s ${PACKAGES} ${PKG_FMRI}

######################################################################
### stage-package-remove (PRIVATE)
######################################################################
### stage-package-remove removes the binary package for stage install
###
.PHONY: stage-package-remove
stage-package-remove:
	@${PKGREPO} remove -s ${STAGE_PACKAGES} ${PKG_FMRI}

######################################################################
### package-install (PUBLIC)
######################################################################
### When DESTDIR support is active, package-install uses package to
### create a binary package and installs it.
### Otherwise it is identical to calling package.
###

.PHONY: package-install real-package-install su-real-package-install
.if defined(_PKGSRC_BARRIER)
package-install: package real-package-install
.else
package-install: barrier
.endif

.PHONY: stage-package-install
.if defined(_PKGSRC_BARRIER)
stage-package-install: stage-package-create real-package-install
.else
stage-package-install: barrier
.endif

.if !empty(USE_CROSS_COMPILE:M[yY][eE][sS])
real-package-install: su-real-package-install
.else
real-package-install: su-target
.endif

su-real-package-install:
	@${PHASE_MSG} "Installing binary package of "${PKGNAME:Q}
	${RUN}${PKG_INSTALL} -g ${STAGE_PACKAGES} ${PKG_FMRI}
