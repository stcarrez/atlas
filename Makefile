NAME=atlas
GPRPATH=${NAME}.gpr

-include Makefile.conf

include Makefile.defaults

PLUGINS=

LIBNAME=lib${NAME}

DYNAMO_ARGS=db uml/atlas.zargo

ROOTDIR=.

build::
	$(BUILD_COMMAND)

generate::
	mkdir -p db
	$(DYNAMO) generate $(DYNAMO_ARGS)
