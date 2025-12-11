#ifndef DAY_4_H
#define DAY_4_H

char *read_file(char *path);
char **split_newlines(const char *s, int *count);
char *make_empty_line(int size);
int count_removable_rolls(char *prev_line, char *current_line, char *next_line);
char char_arr_get_or_default(char *arr, int index, char default_char);
bool is_roll_removable(int roll_index, char *prev_line, char *current_line,
                       char *next_line);

#endif
