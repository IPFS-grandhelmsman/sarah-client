# sarah hashfunc ext auto make file
# @Author grandhelmsman<desupport@grandhelmsman.com>

#complie
CC = gcc
#include directory
INCLUDE = .
#complie flags for devolep
CFLAGS = -O2 -Wall -fPIC -I../../include/
#complile flags for products
FFLAGS = -O2 -Wall -fPIC -shared -I../../include/
#FFLAGS = -g -Wall -fPIC
EXT_MODULE_DIR = /usr/local/lib/april

OBJECT = lua_hashfunc.o
SOURCE = lua_hashfunc.c
TARGET = hashfunc.so

$(TARGET): $(OBJECT)
	$(CC) $(FFLAGS) $(OBJECT) -lsarah -o $(TARGET)

lua_hashfunc.o: lua_hashfunc.c

install: $(TARGET)
	sudo mkdir -p $(EXT_MODULE_DIR)
	sudo cp $(TARGET) $(EXT_MODULE_DIR)
	sudo chmod 755 $(EXT_MODULE_DIR)/$(TARGET)

# clean all the object files.
.PHONY: clean
clean:
	find . -name \*.so | xargs rm -f
	find . -name \*.o  | xargs rm -f
	find . -name \*.a  | xargs rm -f
