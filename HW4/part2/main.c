#include <stdio.h>
#include <stdlib.h>

#include "mm.h"

int main() {
    int* a = mymalloc(4 * sizeof(int));
    int* b = mymalloc(8 * sizeof(int));
    int* c = mymalloc(12 * sizeof(int));
    int* d = mycalloc(16, sizeof(int));
    c[0] = 123;
    c[1] = 236;
    c[11] = 222;
    printf("%d %d %d\n", c[0], c[1], c[11]);

    myfree(a);
    myfree(b);
    scan();

    c = myrealloc(c, 20 * sizeof(int));
    printf("%d %d %d\n", c[0], c[1], c[11]);
    myfree(c);
    myfree(d);
    scan();
    return 0;
}