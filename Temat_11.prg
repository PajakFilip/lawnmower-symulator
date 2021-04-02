#ustawienie kierunku na m2

let kat 0
get 6 kat
while kat :m2
set 1 34
get 6 kat
write "Kat na M2 to:"
write kat
write "stopni"
newl
:m2
set 1 27

#dojazd do m2

let odl 0
get 9 odl 
while odl :stoje_w_m2
set 1 45
get 9 odl
get 6 kat
write "Do markera nr 2 pozostalo: "
write odl
write " jednostek"
newl
goifzero :jade_prosto kat
goifminus :lewo kat - 6
goifplus :prawo kat

#korekcja w prawo
:prawo
while kat :obrprawo
set 1 34
get 6 kat
write "Korekcja w prawo, kat na M2: "
write kat
newl
:obrprawo
goto :2

#korekcja w lewo
:lewo
while kat :obrlewo
set 1 20
get 6 kat 
write "Korekcja w lewo, kat na M2: "
write kat
newl
:obrlewo

:jade_prosto
:2

set 1 36
:stoje_w_m2

set 1 27

#ustawianie kierunku na M1
let kat 0
get 5 kat
while kat :m1
set 1 34
get 5 kat
write "Kat na M1 to:"
write kat
write "stopni"
newl
:m1
set 1 27

#dojazd do POLOWY M1
let odlM1 0
get 8 odlM1
let 2odlM1 int ( odlM1 / 2 )
let SodlM1 odlM1 - 2odlM1
 

while SodlM1 :stoje_w_m1
set 1 45
get 8 odlM1
let SodlM1 odlM1 - 2odlM1
get 5 kat
write "Do polowy markera nr 1 pozostalo: "
write odlM1 
write " jednostek"
newl

goifzero :jade_prostoM1 kat
goifminus :lewoM1 kat - 6
goifplus :prawoM1 kat

#korekcja w prawo
:prawoM1
while kat :obrprawoM1
set 1 34
get 5 kat
write "Korekcja w prawo, kat na M1: "
write kat
newl
:obrprawoM1
goto :3

#korekcja w lewo
:lewoM1
while kat :obrlewoM1
set 1 20
get 5 kat 
write "Korekcja w lewo, kat na M1: "
write kat
newl
:obrlewoM1

:jade_prostoM1
:3


:stoje_w_m1

#ustawienie kierunku na m3

let kat 0
get 7 kat
while kat :m3
set 1 34
get 7 kat
write "Kat na M3 to:"
write kat
write "stopni"
newl
:m3
set 1 27

#dojazd do barycentrum
let odlM3 0
get 10 odlM3
let 2odlM3 int ( 2 * odlM3 / 3 )
let SodlM3 odlM3 - 2odlM3

while SodlM3 :stoje_w_m3
set 1 45
get 10 odlM3
let SodlM3 odlM3 - 2odlM3
get 7 kat
write "do barycentrum pozostało: "
write SodlM3 
write " jednostek"
newl

goifzero :jade_prostoM3 kat
goifminus :lewoM3 kat - 7
goifplus :prawoM3 kat

#korekcja w prawo
:prawoM3
while kat :obrprawoM3
set 1 34
get 7 kat
write "Korekcja w prawo, kat na M3: "
write kat
newl
:obrprawoM3
goto :4

#korekcja w lewo
:lewoM3
while kat :obrlewoM3
set 1 20
get 7 kat 
write "Korekcja w lewo, kat na M3: "
write kat
newl
:obrlewoM3
:jade_prostoM3
:4
:stoje_w_m3

set 1 27
stop
