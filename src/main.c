#include <stdio.h>
#include "mystrfunctions.h"

int main() {
    char s1[100] = "Hello";
    char s2[] = " World";

    printf("Length of s1: %d\n", mystrlen(s1));

    mystrcpy(s1, "Test");
    printf("After strcpy: %s\n", s1);

    mystrncpy(s1, "LongerString", 4);
    s1[4] = '\0';
    printf("After strncpy (4 chars): %s\n", s1);

    mystrcat(s1, " Appended");
    printf("After strcat: %s\n", s1);

    return 0;
}
