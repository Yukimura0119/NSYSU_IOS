#include <pthread.h>

#include <iostream>
#include <thread>
#include <vector>

#include "monitor.h"
#include "philo.h"

int num[5] = {0, 1, 2, 3, 4};
std::vector<Philo> philos;

void* jump(void* i) {
    int* n = (int*)i;
    philos[*n].task();
}

int main() {
    Monitor m;
    std::vector<Philo> philos;
    pthread_t thread[5];
    for (int i = 0; i < 5; i++) {
        philos.emplace_back(Philo(i, &m));
    }
    for (int i = 0; i < 5; i++) {
        pthread_create(&thread[i], NULL, jump, &num[i]);
        printf("Philosophers #%d is created!\n", i);
    }
    for (int i = 0; i < 5; i++) pthread_join(thread[i], NULL);
    return 0;
}