#include <fcntl.h>
#include <stdio.h>
#define Q "#include <fcntl.h>%c#include <stdio.h>%c#define Q %c%s%c%c#define START main%c#define FT(FLAG, MODE) int START() %c%c%c{ %c%c%c%cdprintf(open(%c./Grace_kid.c%c, FLAG, MODE), Q, 10, 10, 34, Q, 34, 10, 10, 92, 10, 9, 92, 10, 9, 9, 34, 34, 92, 10, 9, 9, 92, 10, 9, 10, 10, 47, 42, 10, 9, 10, 42, 47, 10); %c%c%c%creturn (0); %c%c%c}%cFT(O_RDWR | O_CREAT, S_IRWXU | S_IRWXG | S_IRWXO)%c%c%c%c%cUn commentaire%c%c%c%c"
#define START main
#define FT(FLAG, MODE) int START() \
	{ \
		dprintf(open("./Grace_kid.c", FLAG, MODE), Q, 10, 10, 34, Q, 34, 10, 10, 92, 10, 9, 92, 10, 9, 9, 34, 34, 92, 10, 9, 9, 92, 10, 9, 10, 10, 47, 42, 10, 9, 10, 42, 47, 10); \
		return (0); \
	}
FT(O_RDWR | O_CREAT, S_IRWXU | S_IRWXG | S_IRWXO)
/*
	Un commentaire
*/
