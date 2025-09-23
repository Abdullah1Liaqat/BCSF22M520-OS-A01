#include <stdio.h>
// Count lines, words, chars
int wordCount(FILE* file, int* lines, int* words, int* chars); 
// Search for string in file
int mygrep(FILE* fp, const char* search_str, char*** matches); 
