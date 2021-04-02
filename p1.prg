#obrot kosiarki na m2
let kat 0
get 6 kat
while kat :m2
set 1 34
get 6 kat
:m2
set 1 27

#dojechanie do m2
let odl 0
get 9 odl
while odl :jestem_na_m2
set 1 45
get 9 odl
get 6 kat
goifminus :lewo kat - 6
goifzero :prosto kat
goifplus :prawo kat
# korekcja w prawo
:prawo
while kat :obrprawo
set 1 34
get 6 kat
:obrprawo
goto :2
#korekcja w lewo
:lewo
while kat :obrlewo
set 1 20
get 6 kat
:obrlewo
:prosto 
:2
set 1 45
:jestem_na_m2
set 1 27

#obrot kosiarki na m1
get 5 kat
while kat :m1
set 1 34
get 5 kat
:m1
set 1 27

#zmierzenie wartości promienia
let odlR 0
get 10 odlR

#jazda na m1
get 8 odl
while odl :jazda_na_m1
set 1 45
get 8 odl
get 5 kat
goifminus :lewo1 kat - 6
goifzero :prosto1 kat
goifplus :prawo1 kat
# korekcja w prawo
:prawo1
while kat :obrprawo1
set 1 34
get 5 kat
:obrprawo1
goto :3
#korekcja w lewo
:lewo1
while kat :obrlewo1
set 1 20
get 5 kat
:obrlewo1
:prosto1
:3
set 1 45
:jazda_na_m1
set 1 27

#jazda na miejsce koszenia
let R 0
get 8 odl
let R odl - odlR 
while R :jestem_na_miejscu
set 1 45
get 8 odl
let R odl - odlR 
:jestem_na_miejscu
set 1 27



#jazda po okręgu
let zmienna 0
let konieczmienna 0
get 2 zmienna
let zmienna2 7
let konieczmienna zmienna - zmienna2

while konieczmienna :okrag

set 1 44
wait 10
set 1 27


while R :pozycja
set 1 44
get 8 odl
let R odl - odlR
:pozycja

set 1 27
set 3 1
wait 10
set 3 0
let R 1

while R :pozycja1
set 1 37
get 8 odl
let R odl - odlR
:pozycja1

set 1 27
set 3 1
wait 10
set 3 0
get 2 zmienna
let konieczmienna zmienna - zmienna2
:okrag
set 1 27
stop