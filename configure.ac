dnl Autoconf configure script for atlas
dnl Process this file with autoconf to produce a configure script.

AC_INIT(src/atlas.ads)

AC_CANONICAL_SYSTEM
dnl AM_MAINTAINER_MODE

# Current release settings
ATLAS_MAJOR_VERSION=1
ATLAS_MINOR_VERSION=0
ATLAS_MICRO_VERSION=0
ATLAS_VERSION=$ATLAS_MAJOR_VERSION.$ATLAS_MINOR_VERSION.$ATLAS_MICRO_VERSION

AM_GNAT_CHECK_GPRBUILD
AM_GNAT_CHECK_INSTALL

# checking for local tools
AC_PROG_CC
AC_PROG_MAKE_SET
AC_PROG_INSTALL
AC_PROG_LN_S

# Set the version number of Atlas
AC_SUBST(ATLAS_VERSION)
AC_SUBST(ATLAS_MAJOR_VERSION)
AC_SUBST(ATLAS_MINOR_VERSION)
AC_SUBST(ATLAS_MICRO_VERSION)

AC_MSG_CHECKING([number of processors])
NR_CPUS=`getconf _NPROCESSORS_CONF 2>/dev/null || getconf NPROCESSORS_CONF 2>/dev/null || echo 1`
AC_MSG_RESULT($NR_CPUS)
AC_SUBST(NR_CPUS)

EXEC_PREFIX="$prefix"
AC_SUBST(EXEC_PREFIX)

##########################################
# Check to enable/disable shared library
##########################################
AM_SHARED_LIBRARY_SUPPORT

##########################################
# Ada Util library
##########################################
AM_GNAT_FIND_PROJECT([ada-util],[Ada Utility Library],[util],
  [git@github.com:stcarrez/ada-util.git],
  [Building Atlas requires the Ada Utility Library.],
  [
    UTIL_DIR=${gnat_project_dir_util}
  ])
AC_SUBST(UTIL_DIR)

##########################################
# Ada Expression Language library
##########################################
AM_GNAT_FIND_PROJECT([ada-el],[Ada Expression Language Library],[el],
  [git@github.com:stcarrez/ada-el.git],
  [Building Atlas requires the Ada EL Library.],
  [
    EL_DIR=${gnat_project_dir_el}
  ])
AC_SUBST(EL_DIR)

##########################################
# Ada Wiki library
##########################################
AM_GNAT_FIND_PROJECT([ada-wiki],[Ada Wiki Library],[wiki],
  [git@github.com:stcarrez/ada-wiki.git],
  [Building Atlas requires the Ada Wiki Library.],
  [
    WIKI_DIR=${gnat_project_dir_wiki}
  ])
AC_SUBST(WIKI_DIR)

##########################################
# Ada Security library
##########################################
AM_GNAT_FIND_PROJECT([ada-security],[Ada Security Library],[security],
  [git@github.com:stcarrez/ada-security.git],
  [Building Atlas requires the Ada Security Library.],
  [
    SECURITY_DIR=${gnat_project_dir_security}
  ])
AC_SUBST(SECURITY_DIR)

##########################################
# Ada Server Faces library
##########################################
AM_GNAT_FIND_PROJECT([ada-asf],[Ada Server Faces Library],[asf],
  [git@github.com:stcarrez/ada-asf.git],
  [Building Atlas requires the Ada Server Faces Library.],
  [
    ASF_DIR=${gnat_project_dir_asf}
  ])
AC_SUBST(ASF_DIR)

##########################################
# Ada Database Objects library
##########################################
AM_GNAT_FIND_PROJECT([ada-ado],[Ada Database Objects],[ado],
  [git@github.com:stcarrez/ada-ado.git],
  [Building Atlas requires the Ada Database Objects Library.],
  [
    ADO_DIR=${gnat_project_dir_ado}
  ])
AC_SUBST(ADO_DIR)

##########################################
# AWA libraries
##########################################
AM_GNAT_FIND_PROJECT([ada-awa],[Ada Web Application],[awa],
  [git@github.com:stcarrez/ada-awa.git],
  [Building Atlas requires the Ada Web Application Library.],
  [
    AWA_DIR=${gnat_project_dir_awa}
  ])
AC_SUBST(AWA_DIR)

ATLAS_LIBDIR="lib"
AC_SUBST(ATLAS_LIBDIR)

AC_OUTPUT(
Makefile atlas.gpr rules.mk
)
