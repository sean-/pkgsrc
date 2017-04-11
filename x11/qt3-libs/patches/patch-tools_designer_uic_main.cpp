$NetBSD$

For some reason EOF isn't being detected properly since 2017Q1.  Need to
fix this properly at some point but for now just ignore it and continue.

--- tools/designer/uic/main.cpp.orig	2007-02-02 14:01:39.000000000 +0000
+++ tools/designer/uic/main.cpp
@@ -285,7 +285,6 @@ int main( int argc, char * argv[] )
     int errLine;
     if ( !doc.setContent( &file, &errMsg, &errLine ) ) {
 	qWarning( QString("uic: Failed to parse %s: ") + errMsg + QString (" in line %d"), fileName, errLine );
-	return 1;
     }
 
     QDomElement e = doc.firstChild().toElement();
