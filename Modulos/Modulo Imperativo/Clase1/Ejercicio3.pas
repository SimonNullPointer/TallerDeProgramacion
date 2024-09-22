
Program Ejercicio3;

Const 
  RangoCodigo = 8;

Type 
  ListaPeliculas = ^nodo;
  Rangos = 1..8;

  VectorGenero = array [1..RangoCodigo] Of ListaPeliculas;
  pelicula = Record
    CodigoPelicula: Integer;
    CodGenero: Rangos;
    Promedio: Real;
  End;
  Pelis2 = Record
    CodigoPelicula: Integer;
    Promedio: Real;
  End;

  vectorPromedios = array [1..RangoCodigo] Of Pelis2;

  nodo = Record
    dato: pelicula;
    sig: ListaPeliculas;
  End;





Procedure GenerarListas(Var VectorListas:VectorGenero);

Procedure AgregarAdelante(Var l:ListaPeliculas; elem:pelicula);

Var aux: ListaPeliculas;
Begin
  new(aux);
  aux^.dato := elem;
  aux^.sig := l;
  l := aux;
End;
Procedure LeerPelicula(Var p:pelicula);
Begin
  WriteLn('Codigo');
  ReadLn(p.CodigoPelicula);
  If p.CodigoPelicula <> -1 Then
    Begin
      p.CodGenero := 1 + Random(RangoCodigo);
      p.Promedio := Random * 10;
    End;
End;



Procedure IniciarListas(Var pI: VectorGenero);

Var 
  i: Integer;
Begin
  For i:=1 To RangoCodigo Do
    Begin
      pI[i] := Nil;
    End;
End;

Var 
  Peli: pelicula;
Begin
  IniciarListas(VectorListas);
  LeerPelicula(Peli);
  While (Peli.CodigoPelicula<>-1) Do
    Begin
      AgregarAdelante(VectorListas[Peli.CodGenero], Peli);
      //preguntar en clase


      LeerPelicula(Peli);

    End;

End;


Procedure RecorrerVectores(v1:VectorGenero; Var v2:vectorPromedios);
Procedure IniciarPromedios(Var v2:vectorPromedios);

Var 
  i: Integer;
Begin
  For i:=1 To RangoCodigo Do
    v2[i].Promedio := -1;
End;

Var 
  i: Integer;
  lista: ListaPeliculas;
Begin
  IniciarPromedios(v2);
  // Inicia el vector de promedios
  For i := 1 To RangoCodigo Do
    Begin
      lista := v1[i];
      While (lista <> Nil) Do
        Begin
          If (lista^.dato.Promedio > v2[i].Promedio) Then
            Begin
              v2[i].Promedio := lista^.dato.Promedio;
              v2[i].CodigoPelicula := lista^.dato.CodigoPelicula;
            End;
          lista := lista^.sig;
        End;
    End;
End;

Procedure ImprimirVector(v:vectorPromedios);

Var i: Integer;
Begin
  For i:= 1 To RangoCodigo Do
    WriteLn(i,'----',v[i].Promedio);
End;

Procedure OrdenarVector(Var v:VectorPromedios);

Var 
  i,j,pos: Integer;
  aux: Pelis2;
Begin
  For i:=1 To RangoCodigo-1 Do
    Begin
      pos := i;

      For j:=i+1 To RangoCodigo Do
        If v[j].Promedio<v[pos].Promedio Then
          pos := j;
      aux := v[pos];
      v[pos] := v[i];
      v[i] := aux;
    End;
End;

Procedure ImprimirVectorMaximos(v:vectorPromedios);

Var 
  pri,ult: Integer;
Begin
  pri := 1;
  ult := RangoCodigo;
  WriteLn('minimos');
  WriteLn(v[pri].Promedio);
  WriteLn(v[pri].CodigoPelicula);

  WriteLn('maximos');
  WriteLn(v[ult].Promedio);
  WriteLn(v[ult].CodigoPelicula);
End;


Var 
  VectorListas: VectorGenero;
  VectorMaximos: VectorPromedios;
Begin
  randomize;
  GenerarListas(VectorListas);
  RecorrerVectores(VectorListas,VectorMaximos);
  ImprimirVector(VectorMaximos);
  WriteLn();
  WriteLn();
  WriteLn();
  OrdenarVector(VectorMaximos);
  WriteLn('Promedios Ordenados:');
  ImprimirVector(VectorMaximos);
  ImprimirVectorMaximos(VectorMaximos);
End.
