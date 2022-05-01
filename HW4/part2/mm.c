#include "mm.h"

#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

typedef struct block_node {
    size_t size;
    struct block_node* next;
    int free;
} block_node;

static block_node head = {0, NULL};

static const size_t unit_size = 16;
static const size_t header_size = sizeof(block_node);
static inline size_t align(size_t size) {
    // return ((size - 1) / _align + 1) * _align;
    return (size + (unit_size - 1)) & ~(unit_size - 1);
}

void* mymalloc(size_t size) {
    if (size <= 0) return NULL;
    size = align(size);

    for (block_node *nowBlock = head.next, *prev = &head; nowBlock != NULL;
         nowBlock = nowBlock->next, prev = prev->next) {
        if (nowBlock->size >= size) {
            prev->next = nowBlock->next;
            nowBlock->free = 0;
            return ((void*)nowBlock + header_size);
        }
    }
    block_node* newBlock = (block_node*)sbrk(size + header_size);
    newBlock->size = size;
    newBlock->free = 0;
    return ((void*)newBlock + header_size);
}

void myfree(void* ptr) {
    block_node* block = (block_node*)(ptr - header_size);
    assert(block->free == 0);
    printf("free: %p\n", (void*)block);
    block->next = head.next;
    head.next = block;
    block->free = 1;
}

void* myrealloc(void* ptr, size_t size) {
    if (!ptr) return mymalloc(size);
    block_node* block = (block_node*)(ptr - header_size);

    if (block->size >= align(size)) return ptr;

    void* newBlock = mymalloc(size);
    if (newBlock) {
        memset(newBlock, 0, align(size));
        memcpy(newBlock, ptr, block->size);
        myfree(ptr);
    }
    return ((void*)newBlock);
}

void* mycalloc(size_t nmemb, size_t size) { return mymalloc(nmemb * size); }

void scan() {
    printf("\nFree blocks:\n");
    for (block_node* nowBlock = head.next; nowBlock != NULL;
         nowBlock = nowBlock->next) {
        printf("%p size:%ld\n", (void*)nowBlock, nowBlock->size);
    }
    printf("\n");
}