
Program ejercicio1;

Type 
  Venta = Record
    ventasID: Integer;
    CantUnidades: Integer;
    Precio: Real;
  End;

  Datos = Record
    total: Integer;
    Monto: Real;
  End;

  Lista = ^nodoLista;
  nodoLista = Record
    dato: Venta;
    sig: Lista;
  End;

  Arbol = ^nodo;
  nodo = Record
    productoID: Integer;
    datosProducto: Datos;
    ListaVentas: Lista;
    HI: Arbol;
    HD: Arbol;
  End;

Procedure leerCodigo(Var c: Integer);
Begin
  c := random(25)-1;
  // Genera un número aleatorio para simular el código de producto
End;

Procedure leerVenta(Var v: Venta);
Begin
  v.ventasID := random(300);
  v.CantUnidades := random(10);
  v.Precio := random(255);
End;

Procedure agregarDatos(Var d:Datos; unidades: Integer; precio: Real);
Begin
  d.total := d.total + unidades;
  d.monto := d.monto + (unidades * precio);
End;

Procedure agregarListaVenta(Var l: Lista; v: Venta);

Var 
  aux: Lista;
Begin
  new(aux);
  aux^.dato := v;
  aux^.sig := l;
  l := aux;
End;

Procedure inicializarValores(Var arb: Arbol; cod: Integer);
Begin
  arb^.productoID := cod;
  arb^.datosProducto.total := 0;
  arb^.datosProducto.Monto := 0;
  arb^.ListaVentas := Nil;
End;

Procedure agregarArbol(Var arb: Arbol; cod: Integer; v: Venta);
Begin
  If (arb = Nil) Then
    Begin
      new(arb);
      inicializarValores(arb, cod);
      agregarListaVenta(arb^.ListaVentas, v);
      agregarDatos(arb^.datosProducto, v.CantUnidades, v.Precio);
      arb^.HI := Nil;
      arb^.HD := Nil;
    End
  Else If (arb^.productoID > cod) Then
         agregarArbol(arb^.HI, cod, v)
  Else If (arb^.productoID < cod) Then
         agregarArbol(arb^.HD, cod, v)
  Else
    Begin
      agregarListaVenta(arb^.ListaVentas, v);
      agregarDatos(arb^.datosProducto, v.CantUnidades, v.Precio);
    End;
End;

Procedure almacenarProductos(Var arb: Arbol);

Var 
  cod: Integer;
  v: Venta;
Begin
  arb := Nil;
  leerCodigo(cod);
  While (cod <> -1) Do
    Begin
      leerVenta(v);
      agregarArbol(arb, cod, v);
      leerCodigo(cod);
    End;
End;

Procedure recorrerArbol(arb:Arbol);

Procedure imprimirArbol(arb:Arbol);
Begin
  WriteLn('Codigo de producto:', arb^.productoID);
  WriteLn('Cantidad de productos:', arb^.datosProducto.total);
  WriteLn('Monto total:', arb^.datosProducto.monto:0:2);
End;
Procedure recorrerLista(l:Lista);
Begin
  WriteLn('Lista de productos:');
  While (l<>Nil) Do
    Begin
      WriteLn('Codigo venta:',l^.dato.ventasID);
      WriteLn('Unidades vendidas:',l^.dato.CantUnidades);
      WriteLn('Precio:',l^.dato.precio:0:2);
      l := l^.sig;
    End;
End;
Begin
  If (arb<>Nil) Then
    Begin
      recorrerArbol(arb^.HI);
      WriteLn();
      WriteLn();
      imprimirArbol(arb);

      //recorrerLista(arb^.ListaVentas);
      recorrerArbol(arb^.HD);
    End;
End;

Procedure CalcularMaximo(a:Arbol; Var Codmax:Integer);

Procedure Maximos(a:Arbol; Var codMax,cantMax:Integer);
Begin
  If (a<>Nil) Then
    Begin
      Maximos(a^.HI,codMax,cantMax);
      If (a^.datosProducto.total>cantMax) Then
        Begin
          cantMax := a^.datosProducto.total;
          codMax := a^.productoID;
        End;
      Maximos(a^.HD,codMax,cantMax);
    End;
End;

Var 
  cantMax: Integer;
Begin
  cantMax := 0;
  Maximos(a,Codmax,cantMax);
End;




Function esMenor(a:Arbol; valor:Integer): Integer;
Begin
  If (a=Nil) Then
    esMenor := 0
  Else
    Begin

      If (a^.productoID<valor) Then
        //then todo lo que siga es menor EN HI, NO EN HD
        esMenor := 1 + esMenor(a^.HI,valor) + esMenor(a^.HD,valor)

      Else
        //encuentra la posicion del arbol en que todo lo que le siga sea menor
        esMenor := esMenor(a^.HI,valor)
    End;


End;


Function montoTotal(a:Arbol; p1,p2: Integer): Real;
Begin
  If (a=Nil) Then
    montoTotal := 0
  Else If (a^.productoID<p1) Then










//si el codigo es menor al parametro 1, todo lo que esté a su izquierda sera menor 
         montoTotal := montoTotal(a^.HD,p1,p2)
  Else If (a^.productoID>p2) Then




//lo mismo pero del otro lado, si es mayor entonces todo lo de su derecha sera mayor
         montoTotal := montoTotal(a^.HI,p1,p2)
  Else
    // en el medio de los parametros
    montoTotal := a^.datosProducto.Monto + montoTotal(a^.HI,p1,p2) +
                  montoTotal(a^.HD,p1,p2)
End;

Var 
  arb: Arbol;
  menorQue,p1,p2,codMax: Integer;
Begin
  randomize;
  //Inciso 1
  almacenarProductos(arb);


  //Inciso 2
  recorrerArbol(arb);

  //inciso 3
  WriteLn('El codigo con mas unidades vendidas es:');
  CalcularMaximo(arb,codMax);
  WriteLn(codMax);

  // inciso 4
  WriteLn('Ingrese parametro:');
  ReadLn(menorQue);
  WriteLn('La cantidad de codigos menores al valor ingresado son:');
  WriteLn(esMenor(arb,menorQue));

  //ultimooo

  WriteLn('Ingrese el limite inferior (p1): ');
  ReadLn(p1);
  WriteLn('Ingrese el limite superior (p2): ');
  ReadLn(p2);

  WriteLn('El monto total acumulado entre el rango establecido es: ', montoTotal
          (arb,p1,p2): 0: 2);


End.
