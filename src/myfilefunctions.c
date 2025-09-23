// File: src/myfilefunctions.c
#include "../include/myfilefunctions.h"
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>


int wordCount(FILE* file, int* lines, int* words, int* chars) {
    if (!file || !lines || !words || !chars) return -1;

    int c;
    int in_word = 0;
    *lines = *words = *chars = 0;

    while ((c = fgetc(file)) != EOF) {
        (*chars)++;
        if (c == '\n') (*lines)++;
        if (isspace(c)) {
            in_word = 0;
        } else if (!in_word) {
            in_word = 1;
            (*words)++;
        }
    }

    // If file does not end with newline, count last line
    if (*chars > 0) (*lines)++;

    rewind(file);  // Reset file pointer for further use
    return 0;
}



int mygrep(FILE* fp, const char* search_str, char*** matches) {
    if (!fp || !search_str || !matches) return -1;

    size_t capacity = 10;
    size_t count = 0;
    char** results = malloc(capacity * sizeof(char*));
    if (!results) return -1;

    char line[1024];
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, search_str)) {
            if (count >= capacity) {
                capacity *= 2;
                char** temp = realloc(results, capacity * sizeof(char*));
                if (!temp) {
                    for (size_t i = 0; i < count; i++) free(results[i]);
                    free(results);
                    return -1;
                }
                results = temp;
            }
            results[count] = strdup(line);  // Copy line into results
            count++;
        }
    }

    *matches = results;
    rewind(fp);  // Reset file pointer for further use
    return (int)count;
}
