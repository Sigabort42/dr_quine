;commentaire en dehors
bits 64

section .data
	quine db ";commentaire en dehors%2$cbits 64%2$c%2$csection .data%2$c%3$cquine db %4$c%1$s%4$c%2$c%2$csection .text%2$c%3$cglobal start%2$c%3$cglobal _main%2$c%3$cextern _printf%2$cstart:%2$c%3$ccall _main%2$c%3$cret%2$c%2$c_main:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$clea rdi, [rel quine]%2$c%3$clea rsi, [rel quine]%2$c%3$cmov rdx, 0xa%2$c%3$cmov rcx, 0x09%2$c%3$cmov r8, 0x22%2$c%3$ccall _printf%2$c%3$cleave%2$c%3$cret%2$c"

section .text
	global start
	global _main
	extern _printf
start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	lea rdi, [rel quine]
	lea rsi, [rel quine]
	mov rdx, 0xa
	mov rcx, 0x09
	mov r8, 0x22
	call _printf
	leave
	ret
