$NetBSD: patch-setup.py,v 1.11 2017/04/16 08:11:17 adam Exp $

* Prevent to detect optional tkinter.
* Disable demo programs.

--- setup.py.orig	2017-04-04 18:14:25.000000000 +0000
+++ setup.py
@@ -95,11 +95,7 @@ def _read(file):
         return fp.read()
 
 
-try:
-    import _tkinter
-except (ImportError, OSError):
-    # pypy emits an oserror
-    _tkinter = None
+_tkinter = None
 
 NAME = 'Pillow'
 PILLOW_VERSION = '4.1.0'
@@ -736,7 +732,6 @@ try:
           ext_modules=[Extension("PIL._imaging", ["_imaging.c"])],
           include_package_data=True,
           packages=find_packages(),
-          scripts=glob.glob("Scripts/*.py"),
           install_requires=['olefile'],
           test_suite='nose.collector',
           keywords=["Imaging", ],
