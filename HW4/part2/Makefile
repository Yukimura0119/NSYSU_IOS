CC = gcc
FLAG = -Wall -O

all: dep
	$(CC) $(FLAG) *.o -o main

dep: 
	$(CC) $(FLAG) -c mm.c
	$(CC) $(FLAG) -c main.c

clean:
	rm -f $(OUT) *.o