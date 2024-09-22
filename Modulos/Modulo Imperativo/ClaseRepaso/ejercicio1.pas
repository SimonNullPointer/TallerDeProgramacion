
Program ejercicio1;


Type vector = array[1..50] Of integer;


Procedure MinYMax(Var min,max:integer);
Begin
  WriteLn('min');
  readLn(min);
  WriteLn('max');
  readLn(max);

End;

Procedure CargarVector(Var v:Vector; min,max:Integer; Var n:Integer);

Var ale: integer;
Begin
  n := 0;
  ale := min + random (max-min+1);
  While (n<50)And (ale<>0) Do
    Begin
      n := n+1;
      v[n] := ale;
      ale := min + random (max-min+1);
    End;
End;


Procedure RecorrerVector(v:vector; n:integer);

Var i: Integer;
Begin

  For i:= 1 To n Do
    WriteLn(i,'-',v[i]);
End;

Var min,max,n: integer;
  v: vector;
Begin
  randomize;
  MinYMax(min,max);
  CargarVector(v,min,max,n);
  RecorrerVector(v,n);
End.
