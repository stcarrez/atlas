NAME=atlas
GPRPATH=${NAME}.gpr

-include Makefile.conf

include Makefile.defaults

PLUGINS=

LIBNAME=lib${NAME}

DYNAMO_ARGS=db uml/atlas.zargo

ROOTDIR=.

$(foreach PLUGIN,$(PLUGINS),$(eval include plugins/$(PLUGIN)/Makefile))

build::
	$(GNATMAKE) -m -p -P "$(GPRPATH)" $(MAKE_ARGS)

generate::
	mkdir -p db
	$(DYNAMO) generate $(DYNAMO_ARGS)
