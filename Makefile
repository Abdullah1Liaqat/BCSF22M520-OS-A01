# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib
INCLUDE_DIR = include

# Source files
SRC = $(SRC_DIR)/main.c $(SRC_DIR)/mystrfunctions.c $(SRC_DIR)/myfilefunctions.c $(SRC_DIR)/mystringfunctions.c

# Object files
OBJ = $(OBJ_DIR)/main.o $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o $(OBJ_DIR)/mystringfunctions.o

# Static library
STATIC_LIB = $(LIB_DIR)/libmyutils.a

# Dynamic library
DYNAMIC_LIB = $(LIB_DIR)/libmyutils.so

# Default target
all: static client_static dynamic client_dynamic

# Create object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(OBJ_DIR)
	gcc -I$(INCLUDE_DIR) -fPIC -c $< -o $@

# Create static library
$(STATIC_LIB): $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o $(OBJ_DIR)/mystringfunctions.o
	mkdir -p $(LIB_DIR)
	ar rcs $@ $^

# Build static client
client_static: $(OBJ_DIR)/main.o $(STATIC_LIB)
	mkdir -p $(BIN_DIR)
	gcc -o $(BIN_DIR)/client_static $(OBJ_DIR)/main.o -L$(LIB_DIR) -lmyutils

# Create dynamic library
$(DYNAMIC_LIB): $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o $(OBJ_DIR)/mystringfunctions.o
	mkdir -p $(LIB_DIR)
	gcc -shared -o $@ $^

# Build dynamic client
client_dynamic: $(OBJ_DIR)/main.o $(DYNAMIC_LIB)
	mkdir -p $(BIN_DIR)
	gcc -o $(BIN_DIR)/client_dynamic $(OBJ_DIR)/main.o -L$(LIB_DIR) -lmyutils -Wl,-rpath=./lib

# Clean all build files
clean:
	rm -rf $(OBJ_DIR)/* $(BIN_DIR)/* $(LIB_DIR)/*
