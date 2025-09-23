SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c,obj/%.o,$(SRC))
LIBOBJ = obj/mystrfunctions.o obj/myfilefunctions.o
LIB = lib/libmyutils.a
TARGET = bin/client_static

CC = gcc
CFLAGS = -Iinclude

all: $(TARGET)

$(TARGET): obj/main.o $(LIB)
	$(CC) $(CFLAGS) -o $(TARGET) obj/main.o -Llib -lmyutils

$(LIB): $(LIBOBJ)
	ar rcs $(LIB) $(LIBOBJ)

obj/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o $(TARGET) $(LIB)
