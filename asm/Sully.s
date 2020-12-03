bits 64

%imacro _open 0x03
	mov rax, 0x2000005
	lea rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
%endmacro

section .bss
	buf_s: resy 1
	buf_o: resy 1
	buf_b: resy 1
	cmd: resy 1

section .data
	quine db "bits 64%2$c%2$c%%imacro _open 0x03%2$c%3$cmov rax, 0x2000005%2$c%3$clea rdi, %%1%2$c%3$cmov rsi, %%2%2$c%3$cmov rdx, %%3%2$c%3$csyscall%2$c%%endmacro%2$c%2$csection .bss%2$c%3$cbuf_s: resy 1%2$c%3$cbuf_o: resy 1%2$c%3$cbuf_b: resy 1%2$c%3$ccmd: resy 1%2$c%2$csection .data%2$c%3$c quine db %4$c%1$s%4$c, 0%2$c%3$ccompile db %4$cnasm -f macho64 %%1$s -o %%2$s; ld %%2$s -macosx_version_min 10.8 -lSystem -o %%3$s;./%%3$s%4$c, 0%2$c%3$cfileName db %4$cSully_%%d%%s%4$c, 0%2$c%3$cextension_s db %4$c.s%4$c, 0%2$c%3$cextension_o db %4$c.o%4$c, 0%2$c%3$cextension_b db %4$c%4$c, 0%2$c%2$csection .text%2$c%3$cglobal start%2$c%3$cglobal _main%2$c%3$cextern _system, _dprintf, _sprintf%2$c%2$c_compile_child_quine:%2$c%3$clea rdi, [rel buf_o]%2$c%3$clea rsi, [rel fileName]%2$c%3$cmov rdx, rbx%2$c%3$clea rcx, [rel extension_o]%2$c%3$ccall _sprintf%2$c%3$clea rdi, [rel buf_b]%2$c%3$clea rsi, [rel fileName]%2$c%3$cmov rdx, rbx%2$c%3$clea rcx, [rel extension_b]%2$c%3$ccall _sprintf%2$c%3$clea rdi, [rel cmd]%2$c%3$clea rsi, [rel compile]%2$c%3$clea rdx, [rel buf_s]%2$c%3$clea rcx, [rel buf_o]%2$c%3$clea r8, [rel buf_b]%2$c%3$ccall _sprintf%2$c%3$clea rdi, [rel cmd]%2$c%3$ccall _system%2$c%3$cjmp quit%2$c%2$c_write_file_quine:%2$c%3$cmov rdi, rax%2$c%3$clea rsi, [rel quine]%2$c%3$clea rdx, [rel quine]%2$c%3$cmov rcx, 0xa%2$c%3$cmov r8, 0x09%2$c%3$cmov r9, 0x22%2$c%3$csub rsp, 8%2$c%3$cpush rbx%2$c%3$ccall _dprintf%2$c%3$cjmp _compile_child_quine%2$c%2$c_create_file_quine:%2$c%3$clea rdi, [rel buf_s]%2$c%3$clea rsi, [rel fileName]%2$c%3$cdec rbx%2$c%3$cmov rdx, rbx%2$c%3$clea rcx, [rel extension_s]%2$c%3$ccall _sprintf%2$c%3$c_open [rel buf_s], 0x0202, 777o%2$c%3$cjmp _write_file_quine%2$c%2$cstart:%2$c%3$ccall _main%2$c%3$cret%2$c%2$c_main:%2$c%3$cpush rbp%2$c%3$cmov rbp, rsp%2$c%3$cmov rbx, %5$d%2$c%3$ccmp rbx, 0x0%2$c%3$cjg _create_file_quine%2$c%2$cquit:%2$c%3$cleave%2$c%3$cret%2$c", 0
	compile db "nasm -f macho64 %1$s -o %2$s; ld %2$s -macosx_version_min 10.8 -lSystem -o %3$s;./%3$s", 0
	fileName db "Sully_%d%s", 0
	extension_s db ".s", 0
	extension_o db ".o", 0
	extension_b db "", 0

section .text
	global start
	global _main
	extern _system, _dprintf, _sprintf

_compile_child_quine:
	lea rdi, [rel buf_o]
	lea rsi, [rel fileName]
	mov rdx, rbx
	lea rcx, [rel extension_o]
	call _sprintf
	lea rdi, [rel buf_b]
	lea rsi, [rel fileName]
	mov rdx, rbx
	lea rcx, [rel extension_b]
	call _sprintf
	lea rdi, [rel cmd]
	lea rsi, [rel compile]
	lea rdx, [rel buf_s]
	lea rcx, [rel buf_o]
	lea r8, [rel buf_b]
	call _sprintf
	lea rdi, [rel cmd]
	call _system
	jmp quit

_write_file_quine:
	mov rdi, rax
	lea rsi, [rel quine]
	lea rdx, [rel quine]
	mov rcx, 0xa
	mov r8, 0x09
	mov r9, 0x22
	sub rsp, 8
	push rbx
	call _dprintf
	jmp _compile_child_quine

_create_file_quine:
	lea rdi, [rel buf_s]
	lea rsi, [rel fileName]
	dec rbx
	mov rdx, rbx
	lea rcx, [rel extension_s]
	call _sprintf
	_open [rel buf_s], 0x0202, 777o
	jmp _write_file_quine

start:
	call _main
	ret

_main:
	push rbp
	mov rbp, rsp
	mov rbx, 0x5
	cmp rbx, 0x0
	jg _create_file_quine

quit:
	leave
	ret
