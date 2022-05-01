#ifndef __MONITOR_H__
#define __MONITOR_H__
#include <pthread.h>

#include <iostream>

class Monitor {
    pthread_mutex_t mtx;
    pthread_cond_t cond[5];

   public:
    Monitor() {
        pthread_mutex_init(&mtx, 0);
        for (int i = 0; i < 5; i++) pthread_cond_init(&cond[i], 0);
    }
    ~Monitor() {
        pthread_mutex_destroy(&mtx);
        for (int i = 0; i < 5; i++) pthread_cond_destroy(&cond[i]);
    }
    void lock(int i);
    void unlock(int i);
};

#endif
