%include "/usr/local/share/csc314/asm_io.inc"

; OFFICIAL CUSTOM KRABBY PATTY OPTIONAL INGREDIENTS LIST SOURCED FROM SPONGEPEDIA, THE OFFICIAL SPONGEBOB WIKIPEDIA

; ORDER CODE DEFINITIONS
	%define KRAB_MEAT		512
	%define	POSEIDON_POWDER 256
	%define	PICKLES			128
	%define MUSTARD			64
	%define KETCHUP			32
	%define TOMATOES 		16
	%define ONIONS 			8
	%define CHEESE 			4
	%define LETTUCE 		2
	%define	MAYO 			1

segment .data
	prompt						db "Optional Ingredients (y or n for each)",10,0
	prompt_mayo					db "Mayo: ",0
	prompt_lettuce				db "Lettuce: ",0
	prompt_cheese				db "Cheese: ",0
	prompt_onions				db "Onions: ",0
	prompt_tomatoes				db "Tomatoes: ",0
	prompt_ketchup				db "Ketchup: ",0
	prompt_mustard				db "Mustard: ",0
	prompt_pickles				db "Pickles: ",0
	prompt_poseidon_powder		db "Poseidon Powder: ",0
	prompt_krab_meat			db "Krab Meat: ",0
	result						db "Encrypted Krabby Patty Order Code: ",0

segment .bss
	code	resd	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; INITIAL PROMPT
		mov		eax, prompt
		call	print_string

	; INGREDIENT CHOICES
		call	choice_mayo
		call	choice_lettuce
		call	choice_cheese
		call	choice_onions
		call	choice_tomatoes
		call	choice_ketchup
		call	choice_mustard
		call	choice_pickles
		call	choice_powder
		call	choice_krab

	; ENCRYPTION
		mov		eax, DWORD [code]
		xor		eax, 0x42
		rol		eax, 24
		xor		eax, 0x24
		rol		eax, 42
		mov		DWORD [code], eax

	; OUTPUT RESULT
		mov		eax, result
		call	print_string
		mov		eax, DWORD [code]
		call	print_int
		call	print_nl

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret

choice_mayo:
	mov		eax, prompt_mayo
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_mayo
		or		DWORD [code], MAYO
	no_mayo:
	call	read_char
	ret

choice_lettuce:
	mov		eax, prompt_lettuce
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_lettuce
		or		DWORD [code], LETTUCE
	no_lettuce:
	call	read_char
	ret

choice_cheese:
	mov		eax, prompt_cheese
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_cheese
		or		DWORD [code], CHEESE
	no_cheese:
	call	read_char
	ret

choice_onions:
	mov		eax, prompt_onions
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_onions
		or		DWORD [code], ONIONS
	no_onions:
	call	read_char
	ret

choice_tomatoes:
	mov		eax, prompt_tomatoes
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_tomatoes
		or		DWORD [code], TOMATOES
	no_tomatoes:
	call	read_char
	ret

choice_ketchup:
	mov		eax, prompt_ketchup
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_ketchup
		or		DWORD [code], KETCHUP
	no_ketchup:
	call	read_char
	ret

choice_mustard:
	mov		eax, prompt_mustard
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_ketchup
		or		DWORD [code], MUSTARD
	no_mustard:
	call	read_char
	ret

choice_pickles:
	mov		eax, prompt_pickles
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_pickles
		or		DWORD [code], PICKLES
	no_pickles:
	call	read_char
	ret

choice_powder:
	mov		eax, prompt_poseidon_powder
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_powder
		or		DWORD [code], POSEIDON_POWDER
	no_powder:
	call	read_char
	ret

choice_krab:
	mov		eax, prompt_krab_meat
	call	print_string
	call	read_char
	cmp		eax, 'y'
	jne		no_krab
		or		DWORD [code], KRAB_MEAT
	no_krab:
	call	read_char
	ret
