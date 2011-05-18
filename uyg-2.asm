;-------------------------------------------------------------------------------------
; 16-bitlik iki sayının çarpılıp sonucun 0100'dan (LSB) başlayarak belleğe yazılması. 
;-------------------------------------------------------------------------------------

; lhld 2000H
; sphl      ; stack 16 bit var.
; lhld 3000H
; xchg      ; de'de 16 bit sayı var.

lxi h, 2000h
mvi m, 02h
lxi h, 2001h
mvi m, 03h

lxi h, 3000h
mvi m, 00h
lxi h, 3001h
mvi m, 01h

lhld 2000H
sphl            ;sp = 0302
lhld 3000H
xchg            ;de = 0100
lxi h, 0000h	;
lxi b, 0000h    ;

next:	dad sp  ;hl = hl + sp
	jc var  ;elde var
devam:	dcx d
	mov a, d
	ora e
	jnz next
	jmp sonuc
var:	inx b   ;bc = bc + 1
	jmp devam	
sonuc:	xchg
	lxi h, 0100h
	mov m, b
	inx h
	mov m, c
	inx h
	mov m, d
	inx h
	mov m, e
	hlt
