screen _NewImage(640, 480, 32)
dim blend, direction, steps, stepsPerSecond
dim color1 as _Unsigned Long
dim color2 as _Unsigned Long
color1 = _rgb32(25,155,155)
color2 = _rgb32(155,0,155)
stepsPerSecond = 24

Do Until Inkey$ = Chr$(27)
    For steps = 0 To stepsPerSecond
        For x = 0 To _Width
            If direction = 0 Then
                blend = lerp(easeInCubic( x / _Width), easeOutCubic(x / _Width),easeInOutBack(steps / stepsPerSecond))
            Else
                blend = lerp(easeOutCubic( x / _Width), easeinCubic(x / _Width),easeInOutBack(steps / stepsPerSecond))
            End If
            Line (x, 0)-(x, _Height), mixColors(color1, color2, blend)
            Circle (x, _Height \ 2 - (blend * _Height) + ((x / _Width) * _Height)), 1, &HFFFFFFFF
        Next
        _Display
        _Limit stepsPerSecond
    Next
    direction = (direction + 1) mod 2
Loop
System

Function mixColors~& (color1 as _Unsigned Long, color2 as _Unsigned Long, blend as Single)
    Dim r as _Unsigned _Byte
    Dim g As _Unsigned _Byte
    Dim b As _Unsigned _Byte
    r = byteClamp(lerp(_Red32(color1),   _Red32(color2),   blend))
    g = byteClamp(lerp(_Green32(color1), _Green32(color2), blend))
    b = byteClamp(lerp(_Blue32(color1),  _Blue32(color2),  blend))
    mixColors~& = _Rgb(r, g, b)
End Function

Function byteClamp (value)
    byteClamp = (value > 0) * (((value < 256) * value) + ((value > 255) * 255))
END Function

Function lerp (v0, v1, t)
    lerp = (1 - t) * v0 + t * v1
End Function

Function easeInCubic (x)
    easeInCubic = x * x * x
End Function

Function easeOutCubic (x)
    easeOutCubic = 1 - (1 - x) ^ 3
End Function

Function easeInOutBack (x)
    Dim c1, c2
    c1 = 1.70158
    c2 = c1 * 1.525
    If x < 0.5 Then
        easeInOutBack = (((2 * x) ^ 2) * ((c2 + 1) * 2 * x - c2)) / 2
    Else
        easeInOutBack = (((2 * x - 2) ^ 2) * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2
    End If
End Function