
Program Ejercicio4;

Const 
  CantRubros = 8;
  DimF = 30;

Type 
  RangoRubro = 1..8;

  producto = Record
    CodigoProducto: Integer;
    CodigoRubro: RangoRubro;
    Precio: Real;
  End;
  ListaRubros = ^nodo;
  VectorRubros = array[RangoRubro] Of ListaRubros;
  Rubro3 = array [1..DimF] Of producto;
  nodo = Record
    dato: producto;
    sig: ListaRubros;
  End;

Procedure LeerProductos(Var v:VectorRubros);
Procedure IngresarProductos(Var p:producto);
Begin
  WriteLn('-----Codigo Producto-----');
  ReadLn(p.CodigoProducto);
  WriteLn('-----Codigo Rubro-----');
  ReadLn(p.CodigoRubro);
  WriteLn('-----Precio-----');
  ReadLn(p.Precio);
  // para probar el codigo

{p.CodigoProducto := Random(20) + 1;
  p.CodigoRubro := Random(CantRubros) + 1;
  p.Precio := Random(200);}

End;
Procedure InsertarOrdenado(Var l:ListaRubros; p:producto);

Var 
  act,ant,aux: ListaRubros;
Begin
  New(aux);
  aux^.dato := p;
  aux^.sig := Nil;
  If l= Nil Then
    l := aux
  Else
    Begin
      act := l;
      ant := l;
      While (act<>Nil) And (act^.dato.CodigoProducto<p.CodigoProducto) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (act=l) Then
        Begin
          aux^.sig := l;
          l := aux;
        End
      Else
        Begin
          ant^.sig := aux;
          aux^.sig := act;
        End;
    End;
End;
Procedure CrearListas(Var v:VectorRubros);

Var 
  i: Integer;
Begin
  For i:=1 To CantRubros Do
    v[i] := Nil;
End;

Var 
  p: producto;
Begin
  CrearListas(v);
  IngresarProductos(p);
  While (p.Precio<>0) Do
    Begin
      InsertarOrdenado(v[p.CodigoRubro],p);
      IngresarProductos(p);
    End;
End;

Procedure ImprimirVector(v:VectorRubros);

Procedure ReproducirLista(l:ListaRubros);
Begin
  While l<>Nil Do
    Begin
      WriteLn('-----Codigo Producto-----');
      WriteLn(l^.dato.CodigoRubro);
      WriteLn();
      l := l^.sig;
    End;
End;


Var 
  i: Integer;
Begin
  For i:=1 To CantRubros Do
    Begin
      WriteLn('----- Rubro',i,' ------');
      WriteLn();
      ReproducirLista(v[i]);
    End;
End;


Procedure GenerarVector3(l:ListaRubros;Var v: Rubro3; Var dimL: Integer);
Procedure AgregarEnVector30(p:producto; Var v:Rubro3; i:Integer);
Begin
  v[i] := p;
End;


Begin
  dimL := 0;
  While (l<>Nil) And (dimL<DimF) Do
    Begin
      dimL := dimL+1;
      AgregarEnVector30(l^.dato,v,dimL);
      l := l^.sig;
    End;
End;

Procedure ImprimirVector3(v:Rubro3; dimL:Integer);

Var 
  i: Integer;
Begin
  WriteLn('---Productos Vector 3---');

  For i:=1 To dimL Do
    Begin
      WriteLn(v[i].CodigoProducto);
    End;
End;

Procedure OrdenarVector(Var v:Rubro3; dimL:Integer);

Var 
  i,j,pos: Integer;
  aux: producto;
Begin
  For i:= 1 To dimL-1 Do
    Begin
      pos := i;
      For j:=i+1 To dimL Do
        If v[j].Precio>v[pos].Precio Then pos := j;
      aux := v[pos];
      v[pos] := v[i];
      v[i] := aux;
    End;
End;

Procedure ImprimirVectorOrdenado(v:Rubro3; dimL:Integer; Var total:Real);

Var 
  i: Integer;
Begin
  total := 0;
  WriteLn('Precios Ordenados:');
  For i:=1 To DimL Do
    Begin
      WriteLn(i,'- ',v[i].Precio:0:2);
      total := total + v[i].Precio;
    End;
End;

Function promedio(tot:Real; cant:Integer): Real;
Begin
  promedio := (tot/cant);
End;

Var 
  vector: VectorRubros;
  vector3: Rubro3;
  dimL: Integer;
  total: Real;
Begin
  randomize;
  LeerProductos(vector);
  ImprimirVector(vector);
  GenerarVector3(vector[3],vector3,dimL);
  ImprimirVector3(vector3,DimL);
  OrdenarVector(vector3,dimL);
  ImprimirVectorOrdenado(vector3,dimL,total);
  WriteLn();
  WriteLn('--Promedio de precios rubro 3: ',promedio(total,dimL): 0: 2);
End.
