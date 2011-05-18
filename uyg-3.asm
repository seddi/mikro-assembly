;-----------------------------------------------------------
; Bir sayının simetriğini alma. Yani:
; A7 A6 A5 A4 A3 A2 A1 A0            olan bir sayıyı  
; A0 A1 A2 A3 A4 A5 A6 A7            biçimine dönüştürme.
;------------------------------------------------------------

mvi b, 21h ; b ye veri yukle
mov a, b   ; ilk veriyi a ya aktar
mvi h, 80h ; and islemi icin kullan
mvi d, 00h ; d yazmacını 0 ile ilkle
mvi c, 07h ; c yi kaydırma dongusu icin kullan
mov e, c   ; e yi kaydırma icin kullan

shiftsol: ral        ; a yı 1 bit sola dondur
	  dcr e      ; e yi 1 azalt
	  jnz shiftsol ; z=0 ise don

shiftsag: ana h      ; h ile a yı and le
	  add d      ; d ile a yı topla
	  mov d, a   ; a yı d ye yukle
	  mov a, h   ; h yı a ya yukle
	  rar        ; a yı saga dondur
          mov h, a   ; a yı h ye yukle
	  mov a, b   ; b yi a ya yukle
	  rar        ; a yı saga kaydır
	  mov b, a   ; a yı b ye yukle
	  dcr c      ; c yi 1 azalt
	  mov e, c   ; c yi e ye yukle
	  jnz shiftsol ; z=0 ise shiftsol'a git 
	  add d    ; en son kaydırıldıktan sonra ekle
          mov d, a 
hlt ;sonucumuz d yazmacında saklı
