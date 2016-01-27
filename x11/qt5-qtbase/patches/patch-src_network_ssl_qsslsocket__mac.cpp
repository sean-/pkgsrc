$NetBSD$

Fix build for GCC 4.9.

--- src/network/ssl/qsslsocket_mac.cpp.orig	2015-10-13 04:35:28.000000000 +0000
+++ src/network/ssl/qsslsocket_mac.cpp
@@ -49,7 +49,7 @@
 #include <QtCore/qdebug.h>
 
 #include <algorithm>
-#include <cstddef>
+#include <stddef.h>
 
 QT_BEGIN_NAMESPACE
 
