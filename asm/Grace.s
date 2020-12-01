;Commentaire
bits 64

%imacro _open 0x03
	mov rax, 0x2000005
	lea rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
%endmacro
%define _START_M _main

section .data
	fileName db "./Grace_kid.s", 0
	quine db ";Commentaire%2$cbits 64%2$c%2$c%%imacro _open 0x03%2$c%3$cmov rax, 0x2000005%2$c%3$clea rdi, %%1%2$c%3$cmov rsi, %%2%2$c%3$cmov rdx, %%3%2$c%3$csyscall%2$c%%endmacro%2$c%%define _START_M _main%2$c%2$csection .data%2$c%3$cfileName db %4$c./Grace_kid.s%4$c, 0%2$c%3$cquine db %4$c%1$s%4$c, 0%2$c%2$csection .text%2$c%3$cglobal start%2$c%3$cglobal _START_M%2$c%3$cextern _dprintf%2$c%2$cstart:%2$c%3$ccall _START_M%2$c%3$cret%2$c%2$c_START_M:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$c_open [rel fileName], 0x0202, 777o%2$c%3$cmov rdi, rax%2$c%3$clea rsi, [rel quine]%2$c%3$clea rdx, [rel quine]%2$c%3$cmov rcx, 0xa%2$c%3$cmov r8, 0x09%2$c%3$cmov r9, 0x22%2$c%3$ccall _dprintf%2$c%3$cleave%2$c%3$cret%2$c", 0

section .text
	global start
	global _START_M
	extern _dprintf

start:
	call _START_M
	ret

_START_M:
	push rbp
	mov rbp, rsp
	_open [rel fileName], 0x0202, 777o
	mov rdi, rax
	lea rsi, [rel quine]
	lea rdx, [rel quine]
	mov rcx, 0xa
	mov r8, 0x09
	mov r9, 0x22
	call _dprintf
	leave
	ret
