CC:=g++
FLAG:= -pthread

all: main.o
	$(CC) $(FLAG) -o main main.o
dep: main.cpp
	$(CC) $(FLAG) -Wall -c main.cpp
clean:
	-rm main.o
