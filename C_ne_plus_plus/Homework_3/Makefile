CC = gcc
CFLAGS = -Wall -fPIC
LDFLAGS = -shared

TARGET = my_prog
LIBNAME = libcomplex.so

all: $(LIBNAME) $(TARGET)

$(LIBNAME): Complex.o
	$(CC) -shared -o $(LIBNAME) Complex.o

Complex.o: Complex.c Complex.h
	$(CC) $(CFLAGS) -c Complex.c -o Complex.o

$(TARGET): main.o $(LIBNAME)
	$(CC) -o $(TARGET) main.o -L. -lcomplex

main.o: main.c Complex.h
	$(CC) $(CFLAGS) -c main.c -o main.o

clean:
	rm -f $(TARGET) $(LIBNAME) *.o
