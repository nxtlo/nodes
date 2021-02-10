#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>

typedef struct Computer {
    char cpu[10];
    char motherboard[10];
    unsigned short int ram;
    char gpu[50];
} Computer;

typedef struct Program {
   int input;
   bool compute;
   int output;
} Program;

enum lru {
    maxsize = 128,
    location = 20,
    iscached = true,
};

int matrix(int troop);
