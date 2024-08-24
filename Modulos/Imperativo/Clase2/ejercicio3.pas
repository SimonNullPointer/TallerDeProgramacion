
Program ejercicio3;

Const 
  min = 300;
  max = 1550;
  DimF = 20;

Type 
  vector = array [1..DimF] Of integer;

Procedure GenerarVector(Var v:vector;Var dimL:Integer);
Procedure Recursivo(Var v:vector; Var dimL:Integer);

Var 
  num: Integer;
Begin
  num := min + random(max-min+1);
  If (dimL<DimF) Then
    Begin
      dimL := dimL+1;
      v[dimL] := num;
      Recursivo(v,dimL);
    End;
End;
Begin
  dimL := 0;
  Recursivo(v,dimL);
End;

Procedure OrdenarVector(Var v:vector);

Var 
  i,j,pos,aux: Integer;
Begin
  For i:=1 To DimF-1 Do
    Begin
      pos := i;
      For j:= i+1 To DimF Do
        If v[j]<v[pos] Then
          pos := j;

      aux := v[pos];
      v[pos] := v[i];
      v[i] := aux;
    End;
End;

Procedure busquedaDicotomica (v: vector; dato:integer; Var pos:
                              Integer);

Var 
  pri, ult, medio : integer;
Begin
  pri := 1 ;
  ult := DimF;
  medio := (pri + ult) Div 2 ;
  While (pri<=ult) And (dato <>v[medio]) Do
    Begin
      If (dato < v[medio]) Then
        ult := medio - 1
      Else pri := medio+1;
      medio := (pri+ult) Div 2;
    End;
  If (pri<= ult) And (dato = v[medio]) Then
    pos := medio
  Else pos := -1;
End;

Var 
  v: vector;
  dimL,n,pos: Integer;
Begin
  randomize;
  GenerarVector(v,dimL);
  OrdenarVector(v);
  WriteLn('Busqueda dicotomica');
  ReadLn(n);
  busquedaDicotomica(v,n,pos);
  WriteLn(pos);
End.
