Screen _NewImage(640, 480, 32)
Dim c~&(1 To 8)
'kinkan palette
'https://lospec.com/palette-list/kinkan
c~&(1) = &HFF446176
c~&(2) = &HFF3EAAAE
c~&(3) = &HFF8CEFB6
c~&(4) = &HFFC4F0C2
c~&(5) = &HFFFFFEE4
c~&(6) = &HFFBEC0C0
c~&(7) = &HFFFFA7B9
c~&(8) = &HFFFF7A8F
Dim t, i, a, x, y
Do
    Line (0, 0)-(_Width, _Height), _RGB32(0, 0, 0, 5), BF
    t = t + 0.1
    For i = 1 To 8
        a = _Pi * 2 / 8 * i - t
        x = _Width / 2 + 90 * Cos(a)
        y = _Height / 2 + 90 * Sin(a)
        fCirc x, y, 20, c~&(i)
    Next
    _PutImage (Sin(t / 10) * 5, Cos(t / 10) * 5), 0
    _Limit 60
    _Display
Loop Until InKey$ <> ""

Sub fCirc (CX As Long, CY As Long, R As Long, C As _Unsigned Long)
    Dim Radius As Long, RadiusError As Long
    Dim X As Long, Y As Long
    Radius = Abs(R): RadiusError = -Radius: X = Radius: Y = 0
    If Radius = 0 Then PSet (CX, CY), C: Exit Sub
    Line (CX - X, CY)-(CX + X, CY), C
    While X > Y
        RadiusError = RadiusError + Y * 2 + 1
        If RadiusError >= 0 Then
            If X <> Y + 1 Then
                Line (CX - Y, CY - X)-(CX + Y, CY - X), C
                Line (CX - Y, CY + X)-(CX + Y, CY + X), C
            End If
            X = X - 1
            RadiusError = RadiusError - X * 2
        End If
        Y = Y + 1
        Line (CX - X, CY - Y)-(CX + X, CY - Y), C
        Line (CX - X, CY + Y)-(CX + X, CY + Y), C
    Wend
End Sub
