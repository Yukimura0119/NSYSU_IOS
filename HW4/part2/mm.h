#ifndef __MM_H__
#define __MM_H__

#include <stddef.h>

void* mymalloc(size_t size);
void myfree(void* ptr);
void* myrealloc(void* ptr, size_t size);
void* mycalloc(size_t nmemb, size_t size);
void scan();

#endif