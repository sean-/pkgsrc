$NetBSD$

Fix build for GCC 4.9.

--- src/corelib/global/qglobal.h.orig	2015-10-13 04:35:31.000000000 +0000
+++ src/corelib/global/qglobal.h
@@ -35,10 +35,6 @@
 #ifndef QGLOBAL_H
 #define QGLOBAL_H
 
-#ifdef __cplusplus
-#  include <cstddef>
-#endif
-
 #include <stddef.h>
 
 #define QT_VERSION_STR   "5.5.1"
