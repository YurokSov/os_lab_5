CC=gcc
CFLAGS=-pedantic -Wall -Werror -g3
LFLAGS=-L ./lib -llab_first
LDFLAGS=-Wl,-rpath,./lib

.PHONY all: liblab_first liblab_second prog1 prog2

liblab_first:
	$(CC) $(CFLAGS) -shared -fPIC ./lib/src/liblab_first.c -o ./lib/liblab_first.so -lm

liblab_second:
	$(CC) $(CFLAGS) -shared -fPIC ./lib/src/liblab_second.c -o ./lib/liblab_second.so -lm

prog1:
	$(CC) $(CFLAGS) ./src/prog1.c -o ./bin/prog1.out $(LFLAGS) $(LDFLAGS)

prog2:
	$(CC) $(CFLAGS) ./src/prog2.c -o ./bin/prog2.out -ldl $(LDFLAGS)

.PHONY clean:
	rm ./obj/*.o ./bin/*.out