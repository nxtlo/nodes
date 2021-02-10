#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
#include "wrapper.h"

char func(char type[5]) {
    Computer pc;
    type = "Intel";

    if(pc.cpu == type) {
        return false;
    } else { 
        return true; 
    }
    return 0;
}

static int getfunky(int head) {
    for(auto int i = 15; i >= head; i++) {
        if(sizeof(i) == sizeof(head)) {
            return true;
        }
        else {
            printf("Matrixes on stacks -> ");
        }
    }
    return 0;
}

int main() {
    do {
        Computer pc;
        char cputype[10] = "Intel";
        if(pc.cpu == cputype) {
            printf("CPU type returned Garbage, goto -> %c", func("AMD"));
            continue;
        } else {
            printf("Passthorugh -> %i\n", getfunky(15));
            break;
        }
    }
    while(true);
    return 0;
}
