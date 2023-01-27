.PHONY: all

CFLAGS=-g -pedantic -Werror -std=c99
CC=gcc

EXE = compress decompress huffmanTest

all: $(EXE)

huffmanTest: heap.o huffmanTest.o huffman.o
	$(CC) $(CFLAGS) -o $@ $^

compress: heap.o file.o huffman.o compression.o compress.o
	$(CC)  $(CFLAGS)  -o $@ $^

decompress: heap.o file.o huffman.o compression.o decompress.o
	$(CC)  $(CFLAGS) -o $@ $^

%.o : %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -rf *.o compress decompress huffmanTest

