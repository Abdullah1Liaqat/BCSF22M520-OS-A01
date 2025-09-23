# Object files
OBJ = obj/main.o obj/mystrfunctions.o obj/myfilefunctions.o obj/mystringfunctions.o

# Static library
STATIC_LIB = lib/libmyutils.a
STATIC_OBJ = obj/mystrfunctions.o obj/myfilefunctions.o 

# Dynamic library
DYN_LIB = lib/libmyutils.so

# Default target builds both
all: bin/client_static bin/client_dynamic

# Build static library
$(STATIC_LIB): $(STATIC_OBJ)
	ar rcs $@ $^

# Build static client
bin/client_static: obj/main.o $(STATIC_LIB)
	gcc -o $@ obj/main.o -Llib -lmyutils

# Build dynamic library
$(DYN_LIB): $(STATIC_OBJ)
	gcc -shared -fPIC -o $@ $^

# Build dynamic client
bin/client_dynamic: obj/main.o $(DYN_LIB)
	gcc -o $@ obj/main.o -Llib -lmyutils -Wl,-rpath,./lib

# Compile object files
obj/%.o: src/%.c
	gcc -Iinclude -c $< -o $@

# Clean
clean:
	rm -f obj/*.o bin/* lib/*.a lib/*.so

