$NetBSD$

Fix build for GCC 4.9.

--- src/3rdparty/poly2tri/sweep/sweep_context.h.orig	2015-10-13 04:37:04.000000000 +0000
+++ src/3rdparty/poly2tri/sweep/sweep_context.h
@@ -34,7 +34,7 @@
 
 #include <list>
 #include <vector>
-#include <cstddef>
+#include <stddef.h>
 
 namespace p2t {
 
