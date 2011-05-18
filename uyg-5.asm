;-----------------------------------------------------------------------
;16 tane ardışıl adreste bulunan (ör: 0200 - 020F adres aralığında)
;sayıları belirlenen 8-bitlik bir sayı ile karşılaştırarak büyük küçük
;ve eşit olanların sayısını bulma.

; Bulunan bu sayıları B, C  ve D kaydedicilerinde tutma.
;-------------------------------------------------------------------------

lxi h, 020fh  ; bellekteki verilerin baslangıc adresini hl ye yukle
mvi e, 01h    ; karsılastırılacak olan veri
mvi b, 00h    ; b yazmacını ilkle (esitlik sayısı)
mvi c, 00h    ; c yazmacını ilkle (kucuk sayısı)
mvi d, 00h    ; d yazmacını ilkle (buyuk sayısı)

karsilastir: mov a, e  ; e deki veriyi a ya yukle
	     sub m     ; a'dan m([hl])'deki veriyi cıkar
	     jz esit   ; esit ise git
	     jp kucuk  ; kucuk ise git
             jm buyuk  ; buyuk ise git
devam:	     mov a, b  ; dongu sayısı l bellegini a ya aktar
	     add c     ; a ile c yi topla
	     add d     ; a ile d yi topla
	     sui 10h   ; b+c+d den 10h yani 16 cıkar dongu icin
	     jz son    ; or sonucu 0 ise dongu bitti son'a git
	     dcx h     ; hl yi 1 azalt
	     jmp karsilastir ;

esit:  inr b     ; esit sayısını 1 artır
       jmp devam ;
kucuk: inr c     ; kucuk sayısını 1 artır
       jmp devam ;
buyuk: inr d     ; buyuk sayısını 1 artır
       jmp devam ;

son: hlt    ; program sonu
