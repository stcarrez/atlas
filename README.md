# Atlas the AWA demonstrator

[![Build Status](https://img.shields.io/jenkins/s/https/jenkins.vacs.fr/Atlas.svg)](http://jenkins.vacs.fr/job/Atlas/)
[![License](https://img.shields.io/badge/license-APACHE2-blue.svg)](LICENSE)
![Commits](https://img.shields.io/github/commits-since/stcarrez/atlas/1.1.0.svg)

Atlas is an online application that provides a blogging system,
a question & answer area, a wiki space and a document storage space.
It shows the different plugins and features provided by
the [Ada Web Application](https://github.com/stcarrez/ada-awa) framework.
The goal of Atlas is to show you some interesting features
provided by Ada Web Application so that you can try them,
look at their implementation and learn how you may use and extend
[Ada Web Application](https://github.com/stcarrez/ada-awa) for your own needs.

To Atlas uses the following projects:

* AWA           (https://github.com/stcarrez/ada-awa)
* ASF           (https://github.com/stcarrez/ada-asf)
* Ada Servlet   (https://github.com/stcarrez/ada-servlet)
* ADO           (https://github.com/stcarrez/ada-ado)
* Ada Util      (https://github.com/stcarrez/ada-util)
* Ada Wiki      (https://github.com/stcarrez/ada-wiki)
* Ada EL        (https://github.com/stcarrez/ada-el)
* Ada Security  (https://github.com/stcarrez/ada-security)
* Ada Keystore  (https://github.com/stcarrez/ada-keystore)
* Dynamo        (https://github.com/stcarrez/dynamo)
* XMLAda        (https://libre.adacore.com/libre/tools/xmlada/)

And for the Web server you can choose between:

* AWS           (https://github.com/AdaCore/aws)
* EWS           (https://github.com/simonjwright/ews)

# Building Atlas

Building with [Alire](https://github.com/alire-project/alire) is done by several
steps with the `alr` command.  Alire will handle the dependencies and preparation
steps to build all the requires libraries.  You have the choice between two Alire crates:

* `atlas` crate is using the Ada Web Server,
* `atlas_ews` crate is using the Embedded Web Server

First, run the following `alr` commands:

```
alr get atlas
cd atlas_<version>_<commit>
alr update
alr build
```

Then, you must setup the environment by running the following `alr` command:

```
alr exec dynamo generate db uml/atlas.zargo
```

*FreeBSD*: if you build on FreeBSD, you may have to use the following
command if some libraries are not found:

```
alr build -- -largs -L/usr/local/lib/mariadb
```


# Running Atlas

You will then start the application as follows:
```
   bin/atlas-server -v setup --upload=upload atlas
```

and point your browser to http://localhost:8080/atlas/index.html
On your browser, you will first enter in the setup phase to configure
the database and the application.

*Note:* you can also run the application by using `alr run`.

# Docker

A docker container is available for those who want to try Atlas without installing
and building all required packages.  To use the Atlas docker container you can
run the following commands:

```
   sudo docker pull ciceron/atlas
   sudo docker run --name atlas -p 8080:8080 ciceron/atlas
```

and then point your browser to http://localhost:8080/atlas/index.html

To stop the running application you will use:
```
   sudo docker stop atlas
   sudo docker rm atlas
```

## Tutorial

You may read the following tutorials to lean more about the technical details about
setting up and building an Ada Web Application:

  * Step 1: [Ada Web Application: Setting up the project](https://blog.vacs.fr/vacs/blogs/post.html?post=2014/05/08/Ada-Web-Application-Setting-up-the-project)
  * Step 2: [Ada Web Application: Building the UML model](https://blog.vacs.fr/vacs/blogs/post.html?post=2014/05/18/Ada-Web-Application--Building-the-UML-model)
  * Step 3: [Review Web Application: Creating a review](https://blog.vacs.fr/vacs/blogs/post.html?post=2014/06/14/Review-Web-Application-Creating-a-review)
  * Step 4: [Review Web Application: Listing the reviews](https://blog.vacs.fr/vacs/blogs/post.html?post=2014/07/19/Review-Web-Application-Listing-the-reviews)
      
