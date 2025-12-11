#include "day_4.h"
#include <stdio.h>

#include <string.h>

int main(void) {
  int line_count;
  char **lines = split_newlines(read_file("data/input.txt"), &line_count);

  int sum_removable = 0;

  char *prev_line;
  char *curr_line;
  char *next_line;

  for (int i = 0; i < line_count; i++) {
    curr_line = lines[i];
    
    if (line_count > i + 1){
      next_line = lines[i + 1];
    } else {
      next_line = make_empty_line(strlen(curr_line));
    }

    if (i != 0) {
      prev_line = lines[i - 1];
    } else {
      prev_line = make_empty_line(strlen(curr_line));
    }

    sum_removable = sum_removable + count_removable_rolls(prev_line, curr_line, next_line);
  }

  printf("\n\nFinal result: %d\n", sum_removable);
}
