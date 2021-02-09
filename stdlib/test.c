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


static async(char name[]) {
    Computer pc;
    name = "intel";

    if(pc.cpu == name) {
            return true;
        } else {
            return false;
        }
    return 0;
}

int main() {
    Computer pc;
    strcpy(pc.cpu, "intel");
    printf("CPU is -> %c", async("intel"));
    return 0;
}
