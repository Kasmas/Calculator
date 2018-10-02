CFLAGS = -Wall -Werror -MP -MMD
SOURCES = src/prog.c src/calc.h
.PHONY: clean all Calculator test

all :
	make bin/calc

bin/calc : build/prog.o
	gcc build/prog.o -o bin/calc $(CFLAGS)

build/prog.o : src/prog.c src/calc.h
	gcc -c src/prog.c -o build/prog.o $(CFLAGS)

test:
	make bin/calc-test
	bin/calc-test

bin/calc-test : build/test/main.o build/test/calc-test.o
	gcc build/test/main.o build/test/calc-test.o build/test/prog.o -o bin/calc-test $(CFLAGS)

build/test/main.o : src/calc.h test/main.c
	gcc -I thirdparty -c test/main.c -o build/test/main.o $(CFLAGS)
	gcc -c src/prog.c -o build/test/prog.o $(CFLAGS) 

build/test/calc-test.o : src/calc.h test/calc-test.c thirdparty/ctest.h
	gcc -c -I thirdparty test/calc-test.c -o build/test/calc-test.o $(CFLAGS)

build/test/prog.o : src/calc.h src/prog.c
	gcc -c src/prog.c -o build/test/prog.o $(CFLAGS)

clean :
	@rm -rf build/*.d build/test/*.d 
	@rm -rf build/*.o build/test/*.o
	@rm bin/calc bin/calc-test
	@echo "All files have been cleaned."
