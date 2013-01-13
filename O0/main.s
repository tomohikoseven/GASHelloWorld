	.file	"main.c"
	.section	.rodata
.LC0:
	.string	"hello, world!"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp                # ベースポインタをスタックに積む
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp          # ebp = esp
	.cfi_def_cfa_register 5
	andl	$-16, %esp          # スタックポインタの移動(なぜ？)
	subl	$16, %esp           # スタック領域確保
	movl	$.LC0, (%esp)       # hello, world!の先頭ポインタをスタックに積む
	call	puts                # puts() 実行.ソース上は、printf()
	movl	$0, %eax            # return 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.1-9ubuntu3) 4.6.1"
	.section	.note.GNU-stack,"",@progbits
