##
## EPITECH PROJECT, 2025
## Makefile
## File description:
## Makefile for MinilibC
##

NAME = libasm.so

SRC = src/strlen.asm \
	  src/strchr.asm \
	  src/memset.asm \
	  src/strrchr.asm \
	  src/memcpy.asm \
	  src/strcmp.asm \
	  src/memmove.asm \
	  src/strncmp.asm \
	  src/strcasecmp.asm \
	  src/strstr.asm \
	  src/strpbrk.asm \

OBJ = $(SRC:.asm=.o)

NASM = nasm
NASM_FLAGS = -f elf64

LD = ld
LD_FLAGS = -shared -o

RM = rm -f

all: $(NAME)

$(NAME): $(OBJ)
	$(LD) $(LD_FLAGS) $(NAME) $(OBJ)

%.o: %.asm
	$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all
