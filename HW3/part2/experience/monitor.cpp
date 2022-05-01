#include "monitor.h"

#include <pthread.h>

#include <iostream>

void Monitor::lock(int i) { pthread_cond_wait(&cond[i], &mtx); }

void Monitor::unlock(int i) { pthread_cond_signal(&cond[i]); }