CC = gcc
CFLAGS = -Wall -fPIC
LDFLAGS = -L. -lm
LIBS = -lfoo -lbar -linter

OBJS = main.o fred.o bill.o john.o sam.o

SHARED_LIB = libinter.so

all: main

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

fred.o: fred.c
	$(CC) $(CFLAGS) -c fred.c

bill.o: bill.c
	$(CC) $(CFLAGS) -c bill.c

john.o: john.c
	$(CC) $(CFLAGS) -c john.c

sam.o: sam.c
	$(CC) $(CFLAGS) -c sam.c

libfoo.a: fred.o john.o
	ar crv libfoo.a fred.o john.o

libbar.so: bill.o sam.o
	$(CC) -shared -o libbar.so bill.o sam.o

libinter.so: inter_2.o
	$(CC) -shared -o libinter.so inter_2.o

inter_2.o: inter_2.c
	$(CC) $(CFLAGS) -c inter_2.c

main: $(OBJS) libfoo.a libbar.so libinter.so
	$(CC) -o main $(OBJS) -L. $(LIBS)

clean:
	rm -f *.o *.a *.so main
