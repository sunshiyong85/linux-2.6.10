/* memmove.S: Simple memmove implementation.
 *
 * Copyright (C) 1997, 2004 David S. Miller (davem@redhat.com)
 * Copyright (C) 1996, 1997, 1998, 1999 Jakub Jelinek (jj@ultra.linux.cz)
 */

	.text
	.align		32
	.globl		memmove
	.type		memmove,#function
memmove:
	mov		%o0, %g1
	cmp		%o0, %o1
	blu,pt		%xcc, memcpy
	 sub		%o0, %o1, %g5
	add		%o1, %o2, %g3
	cmp		%g3, %o0
	bleu,pt		%xcc, memcpy
	 add		%o1, %o2, %g5
	add		%o0, %o2, %o5

	sub		%g5, 1, %o1
	sub		%o5, 1, %o0
1:	ldub		[%o1], %g5
	subcc		%o2, 1, %o2
	sub		%o1, 1, %o1
	stb		%g5, [%o0]
	bne,pt		%icc, 1b
	 sub		%o0, 1, %o0

	retl
	 mov		%g1, %o0
	.size		memmove, .-memmove
