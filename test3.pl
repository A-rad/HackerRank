##!/usr/bin/perl -w
# howdy--the easiest of CGI programs
use CGI;
print "\n", <<ENDPRINT;
Content-type: text/html

<HTML>
	<HEAD>
	<TITLE>Hello World</TITLE>
	</HEAD>	
	<BODY>
	<H1>Greetings, Terrans!</H1>
	</BODY>
	</HTML>
ENDPRINT
