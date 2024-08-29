
Program ejercicio2;

Const 
  Dias = 31;

Type 
  producto = Record
    CodigoProducto: Integer;
    Fecha: Integer;
    Cantidad: Integer;
  End;

  arbol = ^nodo;
  nodo = Record
    dato: producto;
    HI: arbol;
    HD: arbol;
  End;

  arbol2 = ^nodo2;
  ventas = Record
    cod: Integer;
    cant: Integer;
  End;
  nodo2 = Record
    dato: Ventas;
    HI: arbol2;
    HD: arbol2;
  End;



  ListaProductos = ^NodoProductos;

  NodoProductos = Record
    dato: producto;
    sig: ListaProductos;
  End;

  arbol3 = ^nodo3;

  venta = Record
    CodigoLista: Integer;
    Lista: ListaProductos;
  End;

  nodo3 = Record
    dato: venta;
    HI: arbol3;
    HD: arbol3;
  End;





Procedure GenerarVentas(Var a: arbol);
Procedure GenerarArbol(Var a:arbol; p: producto);
Begin
  If (a = Nil) Then
    Begin
      New(a);
      a^.dato := p;
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else If (p.CodigoProducto < a^.dato.CodigoProducto) Then
         GenerarArbol(a^.HI, p)
  Else
    GenerarArbol(a^.HD, p);
End;
Procedure LeerProducto(Var p: producto);
Begin
  p.CodigoProducto := Random(10);
  p.Fecha := Random(Dias) + 1;
  p.Cantidad := Random(100) + 1;
End;

Var 
  p: producto;
Begin
  a := Nil;
  Repeat
    LeerProducto(p);
    WriteLn('CodigoProducto: ', p.CodigoProducto, ', Fecha: ', p.Fecha,
            ', Cantidad: ', p.Cantidad);
    GenerarArbol(a, p);
  Until (p.CodigoProducto = 0);
End;


Procedure Recorrer(a: arbol);
Begin
  If (a <> Nil) Then
    Begin
      Recorrer(a^.HI);
      WriteLn('CodigoProducto: ', a^.dato.CodigoProducto, ', Fecha: ', a^.dato.
              Fecha, ', Cantidad: ', a^.dato.Cantidad);
      Recorrer(a^.HD);
    End;
End;



Procedure Ordenado(a: arbol; Var a2: arbol2);
Procedure InsertarEnArbol2(Var a2: arbol2; p: producto);
Begin
  If (a2 = Nil) Then
    Begin
      New(a2);
      //podria ir un modulo
      a2^.dato.Cod := p.CodigoProducto;
      a2^.dato.Cant := p.Cantidad;
      a2^.HI := Nil;
      a2^.HD := Nil;
    End
  Else If (p.CodigoProducto < a2^.dato.Cod) Then
         InsertarEnArbol2(a2^.HI, p)
  Else If (p.CodigoProducto > a2^.dato.Cod) Then
         InsertarEnArbol2(a2^.HD, p)
  Else
    a2^.dato.Cant := a2^.dato.Cant + p.Cantidad;
End;
Begin
  If (a <> Nil) Then
    Begin
      Ordenado(a^.HI, a2);
      InsertarEnArbol2(a2, a^.dato);
      Ordenado(a^.HD, a2);
    End;
End;

Procedure Recorrer2(a2: arbol2);
Begin
  If (a2 <> Nil) Then
    Begin
      Recorrer2(a2^.HI);
      WriteLn('CodigoProducto: ', a2^.dato.Cod, ', Cantidad Total Vendida: ', a2
              ^.dato.Cant);
      Recorrer2(a2^.HD);
    End;
End;


Procedure AgregarConLista(arbolOriginal: arbol; Var TercerArbol:arbol3);
Procedure AgregarTercerArbol(p:producto; Var a:arbol3);
Procedure AgregarAdelante(Var l:ListaProductos; p:producto);

Var 
  aux: ListaProductos;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;

End;
Begin
  If (a= Nil) Then
    Begin
      New(a);
      a^.dato.CodigoLista := p.CodigoProducto;
      AgregarAdelante(a^.dato.Lista,p);
      a^.HI := Nil;
      a^.HD := Nil;
    End
  Else
    Begin

      If (a^.dato.CodigoLista<p.CodigoProducto) Then
        AgregarTercerArbol(p,a^.HI)
      Else If (a^.dato.CodigoLista>p.CodigoProducto) Then
             AgregarTercerArbol(p,a^.HD)
      Else AgregarAdelante(a^.dato.Lista,p)
    End;
End;

Begin
  If (arbolOriginal<>Nil) Then
    Begin
      AgregarConLista(arbolOriginal^.HI, TercerArbol);
      AgregarTercerArbol(arbolOriginal^.dato, TercerArbol);
      AgregarConLista(arbolOriginal^.HD, TercerArbol);
    End;
End;

Procedure RecorrerLista(l: ListaProductos);
Begin
  While (l <> Nil) Do
    Begin
      Writeln('  Cantidad vendida en la lista: ', l^.dato.Cantidad);
      l := l^.sig;
    End;
End;

Procedure RecorrerArbolConListas(arbol: arbol3);
Begin
  If (arbol <> Nil) Then
    Begin
      Writeln('Nodo del arbol con Codigo del Producto: ', arbol^.dato.
              CodigoLista);
      RecorrerLista(arbol^.dato.Lista);

      RecorrerArbolConListas(arbol^.HI);

      RecorrerArbolConListas(arbol^.HD);
    End;
End;

Procedure RecorrerArbol1(a:arbol;n:Integer);
Procedure SumarCantidades(a: arbol; n: Integer; Var cant: Integer);
Begin
  If (a<>Nil) Then
    Begin
      SumarCantidades(a^.HI,n,cant);
      If (a^.dato.Fecha = n) Then cant := cant + a^.dato.Cantidad;
      SumarCantidades(a^.HD, n, cant);
    End;
End;

Var 
  cant: Integer;
Begin
  cant := 0;
  SumarCantidades(a,n,cant);
  WriteLn('La cantidad de ventas del dia ', n,' es: ', cant);
End;

Procedure RecorrerArbol2(a2:arbol2; Var CodMax: Integer);

Procedure Comparar(a2:arbol2; Var CodMax: Integer; Var maximo:Integer);
Begin
  If (a2<>Nil) Then
    Begin
      Comparar(a2^.HI,CodMax,maximo);
      If (a2^.dato.Cant>maximo) Then
        Begin
          CodMax := a2^.dato.Cod;
          maximo := a2^.dato.Cant;
        End;
      Comparar(a2^.HD,CodMax,maximo);
    End
End;

Var 
  maximo: Integer;
Begin
  maximo := -1;
  Comparar(a2,CodMax,maximo);
End;

Procedure RecorrerArbol3(a:arbol3; Var CodMax:Integer);
Procedure Listas(l:ListaProductos; Var cant:Integer);
Begin
  While (l<>Nil) Do
    Begin
      cant := cant+1;
      l := l^.sig;
    End;
End;

Procedure Calcular(a:arbol3; Var codMax: Integer; Var max:Integer);

Var 
  cant: Integer;
Begin
  If (a<>Nil) Then
    Begin
      cant := 0;
      Listas(a^.dato.Lista,cant);
      If cant>max Then
        Begin
          codMax := a^.dato.CodigoLista;
          max := cant;
        End;
      RecorrerArbol3(a^.HI,CodMax);
      RecorrerArbol3(a^.HD,CodMax);
    End;
End;


Var 
  max: Integer;
Begin
  max := -1;
  Calcular(a,CodMax,max);
End;


Var 
  a: arbol;
  a2: arbol2;
  a3: arbol3;
  n,CodMax,mayorVentas: Integer;
Begin
  Randomize;
  //parte 1
  GenerarVentas(a);
  WriteLn('arbol de Ventas:');
  Recorrer(a);


  //parte 2
  Ordenado(a, a2);
  WriteLn('arbol de Productos Vendidos:');
  Recorrer2(a2);
  WriteLn();

  //parte 3
  WriteLn('arbol de listas');
  AgregarConLista(a,a3);
  RecorrerArbolConListas(a3);

  WriteLn();
  //inciso b
  WriteLn('Ingrese fecha a buscar:');
  ReadLn(n);
  RecorrerArbol1(a,n);

  //inciso c
  WriteLn('El codigo de producto con mayor cantidad de unidades vendidas es:');
  RecorrerArbol2(a2,CodMax);
  WriteLn(CodMax);

  //inciso d
  WriteLn('El codigo de producto con mayor cantidad de ventas es:');
  RecorrerArbol3(a3,mayorVentas);
  WriteLn(mayorVentas);


End.
