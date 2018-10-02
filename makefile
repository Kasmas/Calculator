CFLAGS = -Wall -Werror -MP -MMD
SOURCES = src/Source.c src/Calc.h
.PHONY: clean all PROtez test

all :
	make bin/main1

bin/main1 : build/main1.o
	gcc build/main1.o -o bin/main1 $(CFLAGS)

build/main1.o : src/main1.c src/calc.h
	gcc -c src/main1.c -o build/main1.o $(CFLAGS)

test:
	make bin/calc-test
	bin/calc-test

bin/calc-test : build/test/main.o build/test/calc-test.o
	gcc build/test/main.o build/test/calc-test.o build/test/main.o -o bin/calc-test $(CFLAGS)

build/test/main.o : src/calc.h test/main.c
	gcc -I thirdparty -c test/main.c -o build/test/main.o $(CFLAGS)
	gcc -c src/main1.c -o build/test/main1.o $(CFLAGS) 

build/test/calc-test.o : src/calc.h test/calc-test.c thirdparty/ctest.h
	gcc -c -I thirdparty test/calc-test.c -o build/test/calc-test.o $(CFLAGS)

build/test/main1.o : src/calc.h src/main1.c
	gcc -c src/main1.c -o build/test/main1.o $(CFLAGS)

clean :
	@rm -rf build/*.d build/test/*.d 
	@rm -rf build/*.o build/test/*.o
	@rm bin/calc bin/calc-test
	@echo "All files have been cleaned."
