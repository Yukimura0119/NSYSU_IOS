CC:=g++
FLAG:= -Wall -pthread

all: main.o philo.o monitor.o
	$(CC) -o main main.o philo.o monitor.o -pthread
dep: main.cpp philo.cpp monitor.cpp
	$(CC) $(FLAG) main.cpp
	$(CC) $(FLAG) -c philo.cpp
	$(CC) $(FLAG) -c monitor.cpp
clean:
	-rm *.o