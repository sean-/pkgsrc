$NetBSD$

Fix build for GCC 4.9.

--- src/3rdparty/poly2tri/common/shapes.h.orig	2015-10-13 04:37:04.000000000 +0000
+++ src/3rdparty/poly2tri/common/shapes.h
@@ -34,7 +34,7 @@
 #define SHAPES_H
 
 #include <vector>
-#include <cstddef>
+#include <stddef.h>
 #include <assert.h>
 #include <cmath>
 
