
Program EJERCICIO3;

Type 
  rangoRubro = 1..10;
  Productos = Record
    Codigo: Integer;
    Stock: Integer;
    precio: Real;
  End;

  arbol = ^nodoArbol;
  nodoArbol = Record
    dato: Productos;
    hi: arbol;
    hd: arbol;
  End;

  recordC = Record
    maxCodigo: Integer;
    Stock: Integer;
  End;

  VectorRubros = array[rangoRubro] Of arbol;
  vectorTipoC = array[rangoRubro] Of recordC;
  nuevoVector = array[rangoRubro] Of Integer;
Procedure iniciarArbol(Var v: VectorRubros);

Var 
  i: Integer;
Begin
  For i := 1 To 10 Do
    v[i] := Nil;
End;

Procedure leerProducto(Var p: Productos);
Begin
  p.Codigo := random(20);
  p.Stock := random(40);
  p.precio := random(200);
End;

Procedure leerRubro(Var r: rangoRubro);
Begin
  r := random(10) + 1;
End;

Procedure agregarProductoArbol(Var a: arbol; p: Productos);

Procedure iniciarValores(Var a: arbol; p: Productos);
Begin
  new(a);
  a^.dato := p;
  a^.hi := Nil;
  a^.hd := Nil;
End;

Begin
  If (a = Nil) Then
    Begin
      iniciarValores(a, p);
    End
  Else If (a^.dato.Codigo > p.Codigo) Then
         agregarProductoArbol(a^.hi, p)
  Else
    agregarProductoArbol(a^.hd, p);
End;

Procedure inicializarVector(Var v: VectorRubros);

Var 
  rubro: rangoRubro;
  p: Productos;
Begin
  iniciarArbol(v);
  leerProducto(p);
  While (p.Codigo <> 0) Do
    Begin
      leerRubro(rubro);
      agregarProductoArbol(v[rubro], p);
      leerProducto(p);
    End;
End;

Procedure recorrerVectorRubros(v: VectorRubros);

Procedure recorrerArbol(a: arbol);
Begin
  If (a <> Nil) Then
    Begin
      recorrerArbol(a^.hi);
      WriteLn('  - Codigo del producto: ', a^.dato.Codigo);
      WriteLn('    Stock disponible: ', a^.dato.Stock);
      WriteLn('    Precio: ', a^.dato.precio:4:2);
      recorrerArbol(a^.hd);
    End;
End;

Var 
  i: Integer;
Begin
  For i := 1 To 10 Do
    Begin
      WriteLn('====================================');
      WriteLn(' Rubro ', i, ':');
      If v[i] = Nil Then
        WriteLn('  No hay productos en este rubro.')
      Else
        recorrerArbol(v[i]);
    End;
  WriteLn('====================================');
End;

Function existe(a: arbol; n: Integer): Boolean;
Begin
  If (a = Nil) Then
    existe := false
  Else If (a^.dato.Codigo > n) Then
         existe := existe(a^.hi, n)
  Else If (a^.dato.Codigo < n) Then
         existe := existe(a^.hd, n)
  Else
    existe := True;
End;

//se puede implementar de modo tal que sea una lista para una sola direccion (la derecha)


{if (v^.hd <>nil)
recorrer(hd)
else 
		vc.maxCodigo := v^.dato.Codigo;
		vc.Stock := v^.dato.Stock;
}
Procedure recorrerv(v: arbol; Var vc: recordC);
Begin
  If (v <> Nil) Then
    Begin
      recorrerv(v^.hd, vc);
      If (v^.hd=Nil) Then
        Begin
          vc.maxCodigo := v^.dato.Codigo;
          vc.Stock := v^.dato.Stock;
        End;
    End;
End;

Procedure incisoC(v: VectorRubros; Var vC: vectorTipoC);

Var 
  i: Integer;
Begin
  For i := 10 Downto 1 Do
    recorrerv(v[i], vC[i]);

  WriteLn('==============================');
  WriteLn(' Codigos Maximos y Stocks por Rubro');
  WriteLn('==============================');
  For i := 1 To 10 Do
    Begin
      WriteLn(' Rubro ', i, ':');
      If vC[i].maxCodigo = 0 Then
        WriteLn('  No hay productos en este rubro.')
      Else
        Begin
          WriteLn('  Codigo maximo: ', vC[i].maxCodigo);
          WriteLn('  Stock asociado: ', vC[i].Stock);
        End;
      WriteLn('------------------------------');
    End;
  WriteLn('==============================');
End;





Procedure incisoD(v:vectorRubros; Var nuevoV:NuevoVector);

Function Cantidad(a:arbol; p1,p2:Integer): Integer;
Begin
  If (a<>Nil) Then
    Begin
      If (a^.dato.Codigo<p1) Then
        Cantidad := Cantidad(a^.hd,p1,p2)
      Else If (a^.dato.Codigo>p2) Then
             Cantidad := Cantidad(a^.hi,p1,p2)
      Else Cantidad := Cantidad(a^.hi,p1,p2) + Cantidad(a^.hd,p1,p2) + 1;
    End
  Else Cantidad := 0;

End;

Var 
  p1,p2,i: Integer;
Begin
  WriteLn('Ingrese parametro 1:');
  ReadLn(p1);
  WriteLn('Ingrese parametro 2:');
  ReadLn(p2);

  For i:=1 To 10 Do
    nuevoV[i] := Cantidad(v[i],p1,p2);

  For i:=1 To 10 Do
    WriteLn('Rubro ',i,' :',nuevoV[i]);

End;



Var 
  vector: VectorRubros;
  rubroB: rangoRubro;
  cod: Integer;
  vectorC: vectorTipoC;
  vectorD: NuevoVector;
Begin
  randomize;
  inicializarVector(vector);
  recorrerVectorRubros(vector);

  WriteLn('==============================');
  WriteLn(' Busqueda de Producto');
  WriteLn('==============================');
  Write(' Ingrese Rubro (1-10): ');
  ReadLn(rubroB);
  Write(' Ingrese Codigo de Producto: ');
  ReadLn(cod);

  If existe(vector[rubroB], cod) Then
    WriteLn(' El producto con codigo ', cod, ' existe en el rubro ', rubroB, '.'
    )
  Else
    WriteLn(' El producto con codigo ', cod, ' NO existe en el rubro ', rubroB,
            '.');
  WriteLn('==============================');

  incisoC(vector, vectorC);
  incisoD(vector,vectorD);
End.
