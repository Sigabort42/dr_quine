COLLEEN 	=       Colleen

GRACE   	=       Grace

SULLY   	=       Sully

AS		=       nasm

ASFLAGS		=	-f macho64

LINKER		=	ld

LINKER_FLAGS	=	-macosx_version_min 10.8 -lSystem

SRCS    	=       ./Colleen.s \
			./Grace.s \
#                	./Sully.s \


OBJS    	=       $(SRCS:.s=.o)

all:            colleen grace sully

colleen:        $(OBJS)
	$(LINKER) $(LINKER_FLAGS) Colleen.o -o $(COLLEEN)

grace:          $(OBJS)
	$(LINKER) $(LINKER_FLAGS) Grace.o -o $(GRACE)

sully:          $(OBJS)
	$(LINKER) $(LINKER_FLAGS) Sully.o -o $(SULLY)

clean:
	/bin/rm -rf $(OBJS)
	echo "\033[H\033[2J\033[32mall .o [\033[32;5mCleared\033[0m\033[32m]"

clean_sully:
	/bin/rm -rf $(SULLY)_*

fclean: clean clean_sully
	/bin/rm -rf $(COLLEEN)
	/bin/rm -rf $(GRACE)
	/bin/rm -rf $(SULLY)
	echo "\033[H\033[2J\033[32mAll Binary [\033[32;5mCleared\033[0m\033[32m]"

re:     fclean  all
