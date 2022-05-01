#ifndef __PHILO_H__
#define __PHILO_H__
#include <iostream>
#include <random>

#include "monitor.h"

class Philo {
    std::mt19937_64 mt_rd;
    Monitor* mon;
    int id;
    void eat();
    void think();
    void put();
    void take();

   public:
    Philo(int n, Monitor* m) : id(n), mon(m) {
        std::random_device rd;
        std::mt19937_64 mt(rd());
        mt_rd = mt;
    }
    static void task();
};
#endif
