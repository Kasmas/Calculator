CFLAGS = -Wall -Werror -MP -MMD
SOURCES = src/Source.c src/Calc.h
.PHONY: clean all PROtez test

all :
	make bin/main

bin/main : build/main.o
	gcc build/main.o -o bin/main $(CFLAGS)

build/main.o : src/main.c src/calc.h
	gcc -c src/main.c -o build/main.o $(CFLAGS)

test:
	make bin/calc-test
	bin/calc-test

bin/calc-test : build/test/mein.o build/test/calc-test.o
	gcc build/test/mein.o build/test/calc-test.o build/test/main.o -o bin/Calc-test $(CFLAGS)

build/test/mein.o : src/calc.h test/mein.c
	gcc -I thirdparty -c test/mein.c -o build/test/mein.o $(CFLAGS)
	gcc -c src/main.c -o build/test/main.o $(CFLAGS) 

build/test/calc-test.o : src/calc.h test/calc-test.c thirdparty/ctest.h
	gcc -c -I thirdparty test/calc-test.c -o build/test/calc-test.o $(CFLAGS)

build/test/main.o : src/calc.h src/main.c
	gcc -c src/main.c -o build/test/main.o $(CFLAGS)

clean :
	@rm -rf build/*.d build/test/*.d 
	@rm -rf build/*.o build/test/*.o
	@rm bin/calc bin/calc-test
	@echo "All files have been cleaned."
