TOOL_NAME=isa-extractor
REPOS_NAME=isaextractor
TOOLS_XML=$(wildcard isa2*.xml)

all:

test:
	make -C $@

planemo-venv/bin/planemo: planemo-venv
	. planemo-venv/bin/activate && pip install --upgrade pip setuptools
	. planemo-venv/bin/activate && pip install planemo

planemo-venv:
	virtualenv -p python2.7 $@

plint: planemo-venv/bin/planemo
	. planemo-venv/bin/activate && planemo lint $(TOOLS_XML)

clean:
	$(RM) -r $(HOME)/.planemo
	$(RM) -r planemo-venv
	make -C test $@
	$(RM) -r dist

.PHONY: all clean test
