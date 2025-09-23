#include "../include/mystrfunctions.h"
#include <string.h>
#include <stdio.h>

int mystrlen(const char* s) { return strlen(s); }
int mystrcpy(char* dest, const char* src) { strcpy(dest, src); return 0; }
int mystrncpy(char* dest, const char* src, int n) { strncpy(dest, src, n); return 0; }
int mystrcat(char* dest, const char* src) { strcat(dest, src); return 0; }
