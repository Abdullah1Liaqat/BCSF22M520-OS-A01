# Compiler
CC = gcc

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
INC_DIR = include

# Files
SOURCES = $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES))
TARGET = $(BIN_DIR)/client

# Default rule
all: $(TARGET)

# Link all object files into final executable
$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^

# Compile each .c file into .o file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) -I$(INC_DIR) -c $< -o $@

# Clean up build
clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)
