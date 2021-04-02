# biblioteka rlib 1a  (c) mjkh 2011.04.04
# obr2or(orient), kor2or(orient), obr2mrk(nr), kor2mrk(nr), go2mrk(nr)

# kola.prg
let _kola11 36
let _kola22 45
let _kola33 54
let _kola21 44
let _kola12 37
let _kola31 52
let _kola13 38
let _kola32 53
let _kola23 46
let _kolabk 18
let _kolast 27
let _kolalw 20
let _kolapr 34
goto :_end_


:normuj
# normuje do zakresu 0-119 liczbe ddd
# zmniejszam ponizej 119
goifplus :_zmin120 ddd - 120
:_step2
# zwiekszam do >=0
goifminus :_zmax120 ddd
return
:_zmin120
let ddd ddd - 120
goto :normuj
:_zmax120
let ddd ddd + 120
goto :_step2


:obr2or
#    obrot na orientacje; argument w orient
let _orkon orient
let _orpocz 0
get 4 _orpocz
let _or _orkon - _orpocz
#   w lewo przez 0   or 60,119     pp0  90
#   w lewo nie p 0   or -60,0      pnp0  -5
#   w prawo przez 0  or -119,-60   lp0   -90
#   w prawo nie p 0  or 0,60       lnp0  5
# or<-60 _lp0
goifminus :_lp0 _or + 60
# or<0 i >-60 pnp0
goifminus :_pnotp0 _or
# or<60 i >0 lnotp0
goifminus :_lnotp0 _or - 60
# or>60 pp0
goifminus :_pp0 _or - 120
#    or==0 - powrot
goto :_powrot
:_lp0
# w lewo przez 0; dokrec do zera  dalej jak nie przez 0
set 1 _kolalw
:_ee2
get 4 _or
goifplus :_ee2 _or - 60
# dokrec
:_lnotp0
# w lewo nie przez 0
set 1 _kolalw
:_ee1
get 4 _or
# dopoki jest or<orkon
goifminus :_ee1 _or - _orkon
goto :_powrot
:_pp0
# prawo przez 0; dokrec do zera i dalej jak pniep0
set 1 _kolapr
:_ee3
get 4 _or
# dopoki jest or<60
goifminus :_ee3 _or - 60
:_pnotp0
# w prawo nie przez 0
set 1 _kolapr
:_ee4
get 4 _or
#dopoki jest or>orkon
goifplus :_ee4 _or - _orkon
:_powrot
set 1 27
return


:kor2or
# korekta jazdy na orientacje; orientacja w orient
# ustawia sie na kierunek poprzez skret w lewo
let _or -1
get 4 _or
let _or orient - _or
goifminus :_el _or + 60
goifplus :_el _or
goifzero :_ep _or
goifminus :_ep _or
set 1 _kola22
return
:_el
set 1 _kola12
return
:_ep
set 1 _kola21
return


:obr2mrk
# obrot w miejscu na marker
# nr markera 1-3 w nr; namiar biezacy w nb; port namiaru w portnam
let _portnam nr + 4 
let _nb -1
get _portnam _nb
# if nb>60 then kolap dopoki nb nie bedzie <60
goifplus :_wprawo _nb - 60
goifminus :_wlewo _nb - 60
:_juz
#set 1 kolast
return
:_wprawo
set 1 _kolapr
:_ff1
get _portnam _nb
goifplus :_ff1 _nb - 60
set 1 _kolast
goto :_juz
:_wlewo
set 1 _kolalw
:_ff2
get _portnam _nb
goifminus :_ff2 _nb - 60
set 1 _kolast
goto :_juz


:kor2mrk
# korekcja kierunku jazdy na marker; w nr numer markera
let _mport nr + 4
let _nb -1
get _mport _nb
goifplus :_wpra _nb - 60
goifminus :_wlew _nb - 60
return
:_wpra
set 1 _kola21
return
:_wlew
set 1 _kola12
return


:go2mrk
# dojazd do markera numer nr (1-3)
let _gleba -1
let _odl -1
let _portodl -1
call :obr2mrk
let _portodl nr + 7
set 1 _kola22
:_g1
get _portodl _odl
get 2 _gleba
# if odl>4
goifplus :_g2 _odl - 3
goifnzero :_g2 _gleba - 4
#dojechal
set 1 _kola22
wait 30
:_g3
get _portodl _odl
goifnzero :_g3 _odl
set 1 _kolast
return
:_g2
call :kor2mrk
goto :_g1


:obrokat
# obrot w miejscu o zadany kat -60,60
# kat -60,60 w zmiennej kat
let orient -1
get 4 orient
let orient orient + kat
let ddd orient
call :normuj
let orient ddd
call :obr2or
return

:_end_

# eof
