#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#define NAME_FILE "Sully_%d.c"
#define FLAGS O_RDWR | O_CREAT
#define MODE S_IRWXU | S_IRWXG | S_IRWXO
#define QUINE "lololol"
#define CC "gcc -Wall -Werror -Wextra %s ;ls" 

int	main()
{
	char	*f;
	char	*cc;
	int	i;
	int	fd;

	i = 5;
	while (i > 0)
	{
		if (asprintf(&f, NAME_FILE, i--) <= 0)
			return (1);
		if ((fd = open(f, FLAGS, MODE)) < 0)
			return (2);
		dprintf(fd, QUINE);
		asprintf(&cc, CC, f);
		system(cc);
	}
	return (0);
}
