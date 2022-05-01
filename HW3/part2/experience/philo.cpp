#include "philo.h"

#include <unistd.h>

#include <iostream>

#include "monitor.h"

void Philo::eat() { sleep(mt_rd() % 10 + 2); }

void Philo::think() { sleep(mt_rd() % 10 + 2); }

void Philo::take() {
    mon->lock(id);
    mon->lock((id + 1) % 5);
}
void Philo::put() {
    mon->unlock(id);
    mon->unlock((id + 1) % 5);
}

void Philo::task() {
    while (true) {
        printf("Philosophers #%d is thinking!\n", id);
        think();
        take();
        printf("Philosophers #%d is eating!\n", id);
        eat();
        printf("Philosophers #%d put the forks\n", id);
        put();
    }
}