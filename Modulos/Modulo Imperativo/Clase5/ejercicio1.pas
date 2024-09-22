
Program ejercicio1;

Type 
  oficinas = Record
    id: Integer;
    dni: Integer;
    expensas: real;
  End;

  rangoOficinas = 1..300;
  VectorOficinas = array[rangoOficinas] Of oficinas;

Procedure retornarVector(Var v:VectorOficinas; Var DimL:Integer);
Procedure leerOficina(Var ofi:oficinas);
Begin
  ofi.id := random(100);
  ofi.dni := random(200);
  ofi.expensas := random(300);
End;


Var 
  ofi: oficinas;
Begin
  DimL := 0;
  leerOficina(ofi);
  While (ofi.id<>0) Do
    Begin
      DimL := DimL + 1;
      v[DimL] := ofi;
      leerOficina(ofi);
    End;
End;


Procedure ordenarVector(Var v:VectorOficinas; DimL: Integer);

Var 
  i,j,pos: Integer;
  aux: oficinas;
Begin
  For i:=1 To DimL-1 Do
    Begin
      pos := i;
      For j:=i+1 To DimL Do
        If (v[j].id<v[pos].id) Then
          pos := j;
      If (pos<>i) Then
        Begin
          aux := v[pos];
          v[pos] := v[i];
          v[i] :=  aux;
        End;
    End;
End;

Procedure informar(v:VectorOficinas; pos:Integer);
Begin
  If (pos<>0) Then
    Begin
      WriteLn('El usuario se encuentra en la posicion:', pos);
      WriteLn('El DNI es:', v[pos].dni);
      WriteLn('Las expensas son:', v[pos].expensas:0:2);
    End
  Else
    Begin
      WriteLn('-----Oficina no encontrada-----');
    End;
End;


Function dicotomica(v:VectorOficinas; dimL,cod:Integer): Integer;

Var 
  pri, ult, medio : integer;

Begin
  pri := 1 ;
  ult := dimL;
  medio := (pri + ult ) Div 2 ;

  While  (pri<=ult ) And ( cod <> v[medio].id) Do
    Begin
      If ( cod < v[medio].id ) Then
        ult := medio -1
      Else pri := medio+1 ;
      medio := (pri + ult) Div 2 ;
    End;
  If (pri <=ult) And (cod = v[medio].id) Then
    dicotomica := medio
  Else dicotomica := 0;
End;

Procedure recorrerVector(v:VectorOficinas;dl:Integer);

Var 
  i: Integer;
Begin
  For i:=1 To dl Do
    WriteLn(v[i].id);
End;


Var 
  vector: VectorOficinas;
  DimL: Integer;
  CodBusqueda,pos: Integer;
Begin
  retornarVector(vector,DimL);
  ordenarVector(vector,DimL);
  recorrerVector(vector,DimL);

  WriteLn('Ingrese codigo para buscar');
  ReadLn(CodBusqueda);
  pos := dicotomica(vector,dimL,CodBusqueda);
  WriteLn(pos);
  informar(vector,pos);
End.
