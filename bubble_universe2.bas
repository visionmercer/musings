' A loose translation of bubble_universe2
' https://github.com/ZXDunny/SpecBAS-Demos/blob/master/Graphics/bubble_universe2
Const w = 480
Const m = 200
Const r = _Pi * 2
Dim x, y, t, i, j, u
Screen _NewImage(w, w, 32)
Do
    Cls
    For i = 0 To m
        For j = 0 To m
            u = Sin(i + y) + Sin(i + x)
            y = Cos(i + y) + Cos(i + x)
            x = u + t
            PSet (u * m / 2 + w / 2, y * m / 2 + w / 2.3), _RGB(j, i, 127)
        Next
    Next
    t = t + .1
    _Display
    _Limit 30
Loop
