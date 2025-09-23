#include <stdio.h>
#include "include/mystringfunctions.h"

int main() {
    char str1[100] = "Hello";
    char str2[100] = " World";

    printf("Length of str1: %d\n", mystrlen(str1));

    mystrcat(str1, str2);
    printf("After strcat: %s\n", str1);

    char copy[100];
    mystrcpy(copy, str1);
    printf("Copy: %s\n", copy);

    char limited[10];
    mystrncpy(limited, str1, 5);
    printf("First 5 chars: %s\n", limited);

    return 0;
}
