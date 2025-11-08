CC=gcc
CFLAGS=-std=c11 -Wall -Wextra -O2
BIN_DIR=bin

# Create bin directory if it doesn't exist
$(shell mkdir -p $(BIN_DIR))

# Find all .c files recursively in subdirectories
SRCS := $(shell find . -name "*.c")
# Generate binary names by replacing .c with nothing and adding bin/ prefix
BINS := $(patsubst ./%.c,$(BIN_DIR)/%,$(SRCS))

all: $(BINS)

# Rule to build each binary
$(BIN_DIR)/%: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -rf $(BIN_DIR)

.PHONY: all clean