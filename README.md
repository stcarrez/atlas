# Atlas the AWA demonstrator

[![Build Status](https://img.shields.io/jenkins/s/http/jenkins.vacs.fr/Atlas.svg)](http://jenkins.vacs.fr/job/Atlas/)
[![License](http://img.shields.io/badge/license-APACHE2-blue.svg)](LICENSE)
![Commits](https://img.shields.io/github/commits-since/stcarrez/atlas/v1.0.0.svg)

Atlas is an online application that provides a blogging system, a question & answer area
and a document storage space.  It shows the different plugins and features provided by
the Ada Web Application framework.  The goal of Atlas is to show you some interesting features
provided by Ada Web Application so that you can try them, look at their implementation
and learn how you may use and extend Ada Web Application for your own needs.

To build Atlas you will need the following projects:

* AWA           (https://github.com/stcarrez/ada-awa)
* ASF           (https://github.com/stcarrez/ada-asf)
* ADO           (https://github.com/stcarrez/ada-ado)
* Ada Util      (https://github.com/stcarrez/ada-util)
* Ada Wiki      (https://github.com/stcarrez/ada-wiki)
* Ada EL        (https://github.com/stcarrez/ada-el)
* Ada Security  (https://github.com/stcarrez/ada-security)
* Dynamo        (https://github.com/stcarrez/dynamo)

Atlas relies on the following external projects:

* AWS      (http://libre.adacore.com/libre/tools/aws/)
* XMLAda   (http://libre.adacore.com/libre/tools/xmlada/)

Before building and configuring Atlas, you should have configured, built and installed
all of the above projects.

To configure Atlas, use the following command:
```
   ./configure
```
Then, build the application:
```
   make
```


