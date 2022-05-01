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

int num[N] = {0, 1, 2, 3, 4};
mt19937_64 mt_rd;

inline int left(int n) { return (n + 4) % N; }
inline int right(int n) { return (n + 1) % N; }
inline void eat() { sleep(mt_rd() % 4 + 1); }
inline void think() { sleep(mt_rd() % 5 + 1); }

class Monitor {
    int state[N];
    pthread_mutex_t mtx;
    pthread_cond_t cond[N];

   public:
    void test(int i) {
        if (state[i] == HUNGRY && state[left(i)] != EATING &&
            state[right(i)] != EATING) {
            state[i] = EATING;
            pthread_cond_signal(&cond[i]);
        }
    }

    void take_chops(int i) {
        state[i] = HUNGRY;
        test(i);
        while (state[i] != EATING) pthread_cond_wait(&cond[i], &mtx);
        printf("Philo #%d take the chopsticks!\n", i);
    }

    void put_chops(int i) {
        printf("Philo #%d put down the chopsticks!\n", i);
        state[i] = THINKING;
        test(left(i));
        test(right(i));
    }

    Monitor() {
        pthread_mutex_init(&mtx, 0);
        for (int i = 0; i < N; i++) {
            pthread_cond_init(&cond[i], 0);
            state[i] = THINKING;
        }
    }
};
Monitor m;

void* phil(void* i) {
    while (true) {
        int* n = (int*)i;
        think();
        m.take_chops(*n);
        eat();
        m.put_chops(*n);
    }
}

void set_rand_device() {}

int main() {
    pthread_t thread[5];
    set_rand_device();
    for (int i = 0; i < N; i++) {
        pthread_create(&thread[i], NULL, phil, &num[i]);
        printf("Philo #%d is created!\n", i);
    }
    for (int i = 0; i < N; i++) pthread_join(thread[i], NULL);

    return 0;
}