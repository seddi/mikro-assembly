;--------------------------------------------------------------------------------------------------------------
;16 tane ardışıl adreste bulunan (ör: 0200 - 020F adres aralığında) sayıların en büyük ve en küçüklerini bulma. 
;Bulunan bu sayıları D ve E kaydedicisinde tutma.
;--------------------------------------------------------------------------------------------------------------

;bellege 0200 adresinden den 020f e kadar rastgele veri yukle 
lxi h, 0200h    ; hl ye baslangıc adresini yukle
mvi b, 10h      ; buyuk sayı bulmak icin 16 dongu kullan
mov c, b        ; kucuk sayı bulmak icin 16 dongu kullan 
mov d, m        ; baslangıcta ilk veriyi buyuk olarak al
mov e, m        ; baslangıcta ilk veriyi en kucuk olarak al 
buyuktara: dcr b     ; b yi 1 azalt
      jz kucugubul   ; kucugubul fonk. dallan
      mov a, d  ; buyuk sayıyı d den a ya yukle
      inx h     ; hl deki veriyi 1 artır
      sub m     ; a dan m adresindeki veriyi cıkar
      jm buyuk  ; sonuc eksi ise git
      jmp buyuktara
buyuk: mov d, m ; buyuk sayıyı d ye sakla
       jmp buyuktara;
kucugubul: nop

lxi h, 0200h    ; hl yi basa al
kucuktara: dcr c; c yi 1 azalt
      jz cik    ; cik fonk. dallan
      mov a, e  ; kucuk sayıyı e den a ya yukle
      inx h     ; hl deki veriyi 1 artır
      sub m     ; a dan m adresindeki veriyi cıkar
      jp  kucuk ; sonuc pozitif ise git
      jmp kucuktara
kucuk: mov e, m ; kucuk sayıyı e ye sakla
       jmp kucuktara;

cik: hlt ; son
