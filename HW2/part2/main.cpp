#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#include <iostream>
#include <random>
#define N 5
#define THINKING 0
#define HUNGRY 1
#define EATING 2
using namespace std;

sem_t mutex;
sem_t s[N];
int state[N];
int num[N] = {0, 1, 2, 3, 4};
mt19937_64 mt_rd;

inline int left(int n) { return (n + 4) % N; }
inline int right(int n) { return (n + 1) % N; }
inline void eat() { sleep(mt_rd() % 10 + 2); }
inline void think() { sleep(mt_rd() % 10 + 2); }

void test(int i) {
    if (state[i] == HUNGRY && state[left(i)] != EATING &&
        state[right(i)] != EATING) {
        state[i] = EATING;
        sem_post(&s[i]);
    }
}

void take_fork(int i) {
    sem_wait(&mutex);
    printf("Philosophers #%d is hungry!\n", i);
    state[i] = HUNGRY;
    test(i);
    sem_post(&mutex);
    sem_wait(&s[i]);
}

void put_fork(int i) {
    sem_wait(&mutex);
    printf("Philosophers #%d put down the forks!\n", i);
    state[i] = THINKING;
    test(left(i));
    test(right(i));
    sem_post(&mutex);
}

void* phil(void* i) {
    while (true) {
        int* n = (int*)i;
        printf("Philosophers #%d is thinking!\n", *n);
        think();
        take_fork(*n);
        printf("Philosophers #%d is eating!\n", *n);
        eat();
        put_fork(*n);
    }
}

void set_rand_device() {
    random_device rd;
    mt19937_64 mt(rd());
    mt_rd = mt;
}

void init() {
    sem_init(&mutex, 0, 1);
    for (int i = 0; i < N; i++) {
        sem_init(&s[i], 0, 0);
    }
}

int main() {
    pthread_t thread[5];
    init();
    set_rand_device();
    for (int i = 0; i < N; i++) {
        pthread_create(&thread[i], NULL, phil, &num[i]);
        printf("Philosophers #%d is created!\n", i);
    }
    for (int i = 0; i < N; i++) pthread_join(thread[i], NULL);
    return 0;
}