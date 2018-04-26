all:

test:
	make -C $@

clean:
	make -C test $@

.PHONY: all clean test
