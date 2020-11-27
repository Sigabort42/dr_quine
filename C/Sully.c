#include <stdlib.h>
#include <fcntl.h>
#include <stdio.h>
#define NAME_FILE "Sully_%d.c"
#define FLAGS O_RDWR | O_CREAT
#define MODE S_IRWXU | S_IRWXG | S_IRWXO
#define QUINE "#include <stdlib.h>%c#include <fcntl.h>%c#include <stdio.h>%c#define NAME_FILE %cSully_%%d.c%c%c#define FLAGS O_RDWR | O_CREAT%c#define MODE S_IRWXU | S_IRWXG | S_IRWXO%c#define QUINE %c%s%c%c%cint%cmain()%c{%c%cchar%c%cf, %cb, %cgcc;%c%cint%ci, fd;%c%c%ci = %d;%c%cif (--i >= 0)%c%c{%c%c%cif (asprintf(&f, NAME_FILE, i) <= 0)%c%c%c%creturn (1);%c%c%cif (asprintf(&b, %cSully_%%d%c, i) <= 0)%c%c%c%creturn (1);%c%c%cif ((fd = open(f, FLAGS, MODE)) < 0)%c%c%c%creturn (2);%c%c%cdprintf(fd, QUINE, 10, 10, 10, 34, 34, 10, 10, 10, 34, QUINE, 34, 10, 10, 9, 10, 10, 9, 9, 42, 42, 42, 10, 9, 9, 10, 10, 9, i, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 34, 34, 10, 9, 9, 9, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 10, 10);%c%c%casprintf(&gcc, %cgcc -Wall -Werror -Wextra %%s -o %%s;./%%s%c, f, b, b);%c%c%csystem(gcc);%c%c}%c%creturn (0);%c}%c"

int	main()
{
	char	*f, *b, *gcc;
	int	i, fd;

	i = 5;
	if (--i >= 0)
	{
		if (asprintf(&f, NAME_FILE, i) <= 0)
			return (1);
		if (asprintf(&b, "Sully_%d", i) <= 0)
			return (1);
		if ((fd = open(f, FLAGS, MODE)) < 0)
			return (2);
		dprintf(fd, QUINE, 10, 10, 10, 34, 34, 10, 10, 10, 34, QUINE, 34, 10, 10, 9, 10, 10, 9, 9, 42, 42, 42, 10, 9, 9, 10, 10, 9, i, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 34, 34, 10, 9, 9, 9, 10, 9, 9, 10, 9, 9, 9, 10, 9, 9, 10, 9, 9, 34, 34, 10, 9, 9, 10, 9, 10, 9, 10, 10);
		asprintf(&gcc, "gcc -Wall -Werror -Wextra %s -o %s;./%s", f, b, b);
		system(gcc);
	}
	return (0);
}
