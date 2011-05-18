;---------------------------------------------------------------------------
; 0000 - FFFF aralığında herhangi bir adresten başlayarak 256 adet adrese 
; FF, FE, FD, ..., 00 şeklinde FF'den 00'a kadar olan sayıların yazılması.
;---------------------------------------------------------------------------

lxi h, 0ffffh
mvi b, 0ffh
mvi c, 0100h

loop:	mov m, b
	dcr b
	dcx h
	dcr c
	jnz loop
hlt
