# TrottingGiraffes
We are working on creating our own testing framework for the
[OWASP Java HTML Sanitizer](https://www.owasp.org/index.php/OWASP_Java_HTML_Sanitizer_Project).
The open source project is described as
"an efficient HtmlSanitizer configurable via a flexible HtmlPolicyBuilder".
The program takes an HTML stream, and dispatches events to a policy object
which will decide which elements and attributes to allow.  
A user would be able to define their own policy for their own
customizable white-list.
All components of this project were built and compiled using Linux
distributions, specifically RHEL and Ubuntu.
All code is written in Java.

Please read our [PDF report](https://github.com/CSCI-362-03-2015/TrottingGiraffes/blob/master/TrottingGiraffes_finalReport.pdf) for information on installation.