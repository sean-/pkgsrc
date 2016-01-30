$NetBSD$

Skip bad section for SunOS, at least newer releases.

--- Source/WTF/wtf/MathExtras.h.orig	2015-10-13 04:37:09.000000000 +0000
+++ Source/WTF/wtf/MathExtras.h
@@ -88,7 +88,7 @@ inline double wtf_ceil(double x) { retur
 
 #endif
 
-#if OS(SOLARIS)
+#if OS(notSOLARIS)
 
 namespace std {
 
