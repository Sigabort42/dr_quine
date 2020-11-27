#include <stdio.h>

int	func()
{
	return (1);
}

int	main()
{
	char *q = "#include <stdio.h>%c%cint%cfunc()%c{%c%creturn (1);%c}%c%cint%cmain()%c{%c%cchar *q = %c%s%c;%c%cprintf(q, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 34, q, 34, 10, 9, 10, 9, 10, 9, 10, 47, 42, 10, 9, 10, 42, 47, 10, 10, 47, 42, 10, 9, 10, 42, 47, 10);%c%cfunc();%c%creturn (0);%c%c%c%c%cUn commentaire dans la fonction%c%c%c%c}%c%c%c%c%cUn commentaire en dehors de la fonction%c%c%c%c";
	printf(q, 10, 10, 9, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 34, q, 34, 10, 9, 10, 9, 10, 9, 10, 47, 42, 10, 9, 10, 42, 47, 10, 10, 47, 42, 10, 9, 10, 42, 47, 10);
	func();
	return (0);
/*
	Un commentaire dans la fonction
*/
}
/*
	Un commentaire en dehors de la fonction
*/
