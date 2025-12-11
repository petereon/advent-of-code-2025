#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "day_4.h"

char *read_file(char *path) {
  FILE *f = fopen(path, "rb");
  if (f == NULL) {
    perror("Error opening file");
    return NULL;
  }

  fseek(f, 0, SEEK_END);
  long fsize = ftell(f);
  fseek(f, 0, SEEK_SET);

  char *string = malloc(fsize + 1);
  if (string == NULL) {
    fclose(f);
    return NULL;
  }

  fread(string, fsize, 1, f);
  fclose(f);

  string[fsize] = 0;

  return string;
}

char **split_newlines(const char *s, int *count) {
  char *copy = strdup(s);
  int lines = 0;

  // Count lines
  for (char *p = copy; *p; p++)
    if (*p == '\n')
      lines++;
  lines++; // last line

  char **result = malloc(lines * sizeof(char *));

  int i = 0;
  char *line = strtok(copy, "\n");
  while (line) {
    result[i++] = strdup(line);
    line = strtok(NULL, "\n");
  }

  free(copy);
  *count = lines;
  return result;
}

char *make_empty_line(int size) {
  char *s = malloc(size + 1);
  for (int i = 0; i < size; i++) {
    s[i] = '.';
  }
  s[size] = '\0';
  return s;
}

int count_and_replace_removable_rolls(char *prev_line, char *current_line,
                          char *next_line) {
  int removable_rolls = 0;
  int size = strlen(current_line);

  assert(strlen(prev_line) == strlen(current_line));
  assert(strlen(current_line) == strlen(next_line));

  for (int i = 0; i < size; i++) {
    if (current_line[i] == '@') {
      if (is_roll_removable(i, prev_line, current_line, next_line)) {
        current_line[i] = '.';
        removable_rolls++;
      }
    }
  }

  return removable_rolls;
}

char char_arr_get_or_default(char *arr, int index, char default_char) {
  int size = strlen(arr);
  if (index < 0 || index >= size) {
    return default_char;
  }
  return arr[index];
}

bool is_roll_removable(int roll_index, char *prev_line, char *current_line,
                       char *next_line) {
  char neighbours[8];

  neighbours[0] = char_arr_get_or_default(prev_line, roll_index - 1, '.');
  neighbours[1] = char_arr_get_or_default(prev_line, roll_index, '.');
  neighbours[2] = char_arr_get_or_default(prev_line, roll_index + 1, '.');
  neighbours[3] = char_arr_get_or_default(current_line, roll_index - 1, '.');
  neighbours[4] = char_arr_get_or_default(current_line, roll_index + 1, '.');
  neighbours[5] = char_arr_get_or_default(next_line, roll_index - 1, '.');
  neighbours[6] = char_arr_get_or_default(next_line, roll_index, '.');
  neighbours[7] = char_arr_get_or_default(next_line, roll_index + 1, '.');

  int count_rolls = 0;

  for (int j = 0; j < 8; j++) {
    if (neighbours[j] == '@')
      count_rolls++;
  }

  if (count_rolls < 4) {
    return true;
  }
  return false;
}