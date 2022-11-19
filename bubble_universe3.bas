' A loose translation of bubble_universe3
' https://github.com/ZXDunny/SpecBAS-Demos/blob/master/Graphics/bubble_universe3
const w = 480, n = 200
dim x
dim y
dim t: t = 9
screen _newimage(480, 480, 32)
do
    cls
    for i=0 to n
    for j=0 to n
        u=sin(i+y) + sin(j/(n*_pi)+x)
        v=cos(i+y) + cos(j/(n*_pi)+x)
        x = u + t
        y = v + t
    pset (u*100+w/2, v*100+w/2),_rgb(i,j,99)
    next j,i
    t = t + .1
_display
_limit 30
loop
