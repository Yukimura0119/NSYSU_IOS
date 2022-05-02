#include <stdio.h>
#include <stdlib.h>

#include "mm.h"

int main() {
    int* a = mymalloc(24 * sizeof(int));
    int* b = mymalloc(20 * sizeof(int));
    myfree(a);
    myfree(b);
    scan();

    int* c = mymalloc(12 * sizeof(int));
    scan();
    int* d = mymalloc(16 * sizeof(int));
    scan();

    c[0] = 123;
    c[1] = 236;
    c[11] = 222;
    printf("%d %d %d\n", c[0], c[1], c[11]);

    scan();
    c = myrealloc(c, 20 * sizeof(int));
    printf("%d %d %d\n", c[0], c[1], c[11]);
    myfree(c);
    myfree(d);
    scan();

    int* e = mycalloc(30, sizeof(int));
    myfree(e);
    scan();
    return 0;
}