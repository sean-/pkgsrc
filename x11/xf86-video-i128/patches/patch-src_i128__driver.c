$NetBSD: patch-src_i128__driver.c,v 1.1 2015/04/02 22:16:46 tnn Exp $

From c87753733a6e1f85d1d037dced0b47ce0cf41658 Mon Sep 17 00:00:00 2001
From: Adam Jackson <ajax@redhat.com>
Date: Tue, 25 Sep 2012 08:54:40 -0400
Subject: Remove mibstore.h

Signed-off-by: Adam Jackson <ajax@redhat.com>

diff --git a/src/i128_driver.c b/src/i128_driver.c
index a0f08c0..51a4135 100644
--- src/i128_driver.c
+++ src/i128_driver.c
@@ -50,8 +50,6 @@
 /* All drivers initialising the SW cursor need this */
 #include "mipointer.h"
 
-/* All drivers implementing backing store need this */
-#include "mibstore.h"
 #include "micmap.h"
 
 #include "xf86DDC.h"
@@ -1556,7 +1554,6 @@ I128ScreenInit(SCREEN_INIT_ARGS_DECL)
         return FALSE;
     }
     
-    miInitializeBackingStore(pScreen);
     xf86SetBackingStore(pScreen);
     xf86SetSilkenMouse(pScreen);
