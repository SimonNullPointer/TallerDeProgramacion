
Program ejercicioAdicional;


Procedure ConversionBinaria();

Procedure Recursivo(n:Integer);
Begin
  If (n<2) Then
    Write(n)
  Else
    Begin
      Recursivo(n Div 2);
      Write(n Mod 2);
    End;
End;

Var 
  n: Integer;
Begin
  WriteLn('Ingrese Numero');
  ReadLn(n);
  While (n<>0) Do
    Begin
      Recursivo(n);
      WriteLn();
      WriteLn('Ingrese Numero');
      ReadLn(n);
    End;
End;


Begin
  ConversionBinaria();
End.
