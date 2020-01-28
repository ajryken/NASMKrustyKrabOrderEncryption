%include "/usr/local/share/csc314/asm_io.inc"

; OFFICIAL CUSTOM KRABBY PATTY OPTIONAL INGREDIENTS LIST SOURCED FROM SPONGEPEDIA, THE OFFICIAL SPONGEBOB WIKIPEDIA

; ORDER CODE DEFINITIONS
	%define KRAB_MEAT		512
	%define	POSEIDON_POWDER 256
	%define PICKLES			128
	%define MUSTARD			64
	%define KETCHUP			32
	%define TOMATOES		16
	%define ONIONS			8
	%define CHEESE			4
	%define LETTUCE			2
	%define MAYO			1

segment .data
	prompt				db	"Encrypted Krabby Patty Code: ",0
	ingredient_list 	db	"Krabby Patty needs:",10,0
	needs_mayo			db	"Mayo",10,0
	needs_lettuce		db	"Lettuce",10,0
	needs_cheese		db	"Cheese",10,0
	needs_onions		db	"Onions",10,0
	needs_tomatoes		db	"Tomatoes",10,0
	needs_ketchup		db	"Ketchup",10,0
	needs_mustard		db	"Mustard",10,0
	needs_pickles		db	"Pickles",10,0
	needs_powder		db	"Poseidon Powder",10,0
	needs_krab			db	"Krab Meat",10,0

segment .bss
	code	resd 	1

segment .text
	global  asm_main

asm_main:
	push	ebp
	mov		ebp, esp
	; ********** CODE STARTS HERE **********

	; INITIAL PROMPT
		mov		eax, prompt
		call	print_string

	; USER INPUTS ENCRYPTED CODE
		call	read_int

	; DECRYPTION
		ror		eax, 42
		xor		eax, 0x24
		ror		eax, 24
		xor		eax, 0x42

	or		DWORD [code], eax
	mov		eax, ingredient_list
	call	print_string
	; INGREDIENT CHECKS
		; MAYO CHECK
			mov		eax, DWORD [code]
			and		eax, MAYO
			cmp		eax, 0
			je		no_mayo
				mov		eax, needs_mayo
				call	print_string
			no_mayo:

		; LETTUCE CHECK
			mov		eax, DWORD [code]
			and		eax, LETTUCE
			cmp		eax, 0
			je		no_lettuce
				mov		eax, needs_lettuce
				call	print_string
			no_lettuce:

		; CHEESE CHECK
			mov		eax, DWORD [code]
			and		eax, CHEESE
			cmp		eax, 0
			je		no_cheese
				mov		eax, needs_cheese
				call	print_string
			no_cheese:

		; ONIONS CHECK
			mov		eax, DWORD [code]
			and		eax, ONIONS
			cmp		eax, 0
			je		no_onions
				mov		eax, needs_onions
				call	print_string
			no_onions:

		; TOMATOES CHECK
			mov		eax, DWORD [code]
			and		eax, TOMATOES
			cmp		eax, 0
			je		no_tomatoes
				mov		eax, needs_tomatoes
				call	print_string
			no_tomatoes:

		; KETCHUP CHECK
			mov		eax, DWORD [code]
			and		eax, KETCHUP
			cmp		eax, 0
			je		no_ketchup
				mov		eax, needs_ketchup
				call	print_string
			no_ketchup:

		; MUSTARD CHECK
			mov		eax, DWORD [code]
			and		eax, MUSTARD
			cmp		eax, 0
			je		no_mustard
				mov		eax, needs_mustard
				call	print_string
			no_mustard:

		; PICKLES CHECK
			mov		eax, DWORD [code]
			and		eax, PICKLES
			cmp		eax, 0
			je		no_pickles
				mov		eax, needs_pickles
				call	print_string
			no_pickles:

		; POSEIDON POWDER CHECK
			mov		eax, DWORD [code]
			and		eax, POSEIDON_POWDER
			cmp		eax, 0
			je		no_powder
				mov		eax, needs_powder
				call	print_string
			no_powder:

		; KRAB MEAT CHECK
			mov		eax, DWORD [code]
			and		eax, KRAB_MEAT
			cmp		eax, 0
			je		no_krab
				mov		eax, needs_krab
				call	print_string
			no_krab:

	; *********** CODE ENDS HERE ***********
	mov		eax, 0
	mov		esp, ebp
	pop		ebp
	ret
