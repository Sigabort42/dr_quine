COLLEEN	=	Colleen

GRACE	=	Grace

SULLY	=	Sully

CC	=	gcc

CFLAGS	=	-Wall -Wextra -Werror

SRCS	=	./Colleen.c \
		./Grace.c \
		./Sully.c \


OBJS	=	$(SRCS:.c=.o)

all:		colleen grace sully

colleen:	$(OBJS)
	@$(CC) $(CFLAGS) Colleen.o -o $(COLLEEN)

grace:		$(OBJS)
	@$(CC) $(CFLAGS) Grace.o -o $(GRACE)

sully:		$(OBJS)
	@$(CC) $(CFLAGS) Sully.o -o $(SULLY)

clean:
	@/bin/rm -rf $(OBJS)
	@echo "\033[H\033[2J\033[32mall .o [\033[32;5mCleared\033[0m\033[32m]"

clean_sully:
	@/bin/rm -rf $(SULLY)_*

fclean:	clean clean_sully
	@/bin/rm -rf $(COLLEEN)
	@/bin/rm -rf $(GRACE)
	@/bin/rm -rf $(SULLY)
	@echo "\033[H\033[2J\033[32mAll Binary [\033[32;5mCleared\033[0m\033[32m]"

re:	fclean	all
