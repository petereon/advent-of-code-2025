CC = gcc
CFLAGS = -Wall -Wextra -Iinclude
OBJ = build/main.o build/day_4.o

day_4: $(OBJ)
	$(CC) $(OBJ) -o build/day_4

build/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf build/*.o build/day_4
