
Program ejercicio2;

Type 

  prestamos = Record
    isbn: Integer;
    Nsocio: Integer;
    Dia: Integer;
    Mes: Integer;
    CantDias: Integer;
  End;

  datosF = Record
    isbn: Integer;
    cant: Integer;
  End;

  listaIncisoF = ^nodoF;
  nodoF = Record
    dato: datosF;
    sig: listaIncisoF;
  End;


  ArbolG = ^nodoG;
  nodoG = Record
    dato: datosF;
    hi: ArbolG;
    hd: ArbolG;
  End;


  Arbol = ^nodo;
  nodo = Record
    isbn: Integer;
    prestamo: prestamos;
    hi: Arbol;
    hd: Arbol;
  End;
  ListaPorLibro = ^nodoListaPorLibro;
  nodoListaPorLibro = Record
    dato: prestamos;
    sig: ListaPorLibro;
  End;

  ListaTotal = ^nodoLista;
  nodoLista = Record
    isbn: Integer;
    dato: ListaPorLibro;
    sig: ListaTotal;
  End;
Procedure generarEstructuras(Var arb: Arbol; Var l:ListaTotal);

Procedure insertarArbol(Var a:Arbol; p:prestamos);
Procedure agregar(Var a:Arbol;p:prestamos);
Begin
  New(a);
  a^.isbn := p.isbn;
  a^.prestamo := p;
  a^.hi := Nil;
  a^.hd := Nil;
End;
Begin
  If (a=Nil) Then
    Begin
      agregar(a,p);
    End
  Else If (p.isbn<a^.isbn) Then
         insertarArbol(a^.hi,p)
  Else insertarArbol(a^.hd,p);
End;

Procedure iniciar(Var arb:Arbol; Var l:ListaTotal);
Begin
  arb := Nil;
  l := Nil;
End;
Procedure insertarLista(Var l:ListaTotal; p:prestamos);

Procedure nuevoPrestamo(Var l: ListaTotal; isbn:Integer);

Var 
  nuevo: ListaTotal;
Begin
  new(nuevo);
  nuevo^.isbn := isbn;
  nuevo^.dato := Nil;
  nuevo^.sig := l;
  l := nuevo;
End;
Procedure agregarAdelante(Var l:ListaPorLibro; p: prestamos);

Var 
  aux: ListaPorLibro;
Begin
  new(aux);
  aux^.dato := p;
  aux^.sig := l;
  l := aux;
End;

Var 
  aux: ListaTotal;
Begin
  aux := l;
  While (aux<>Nil) And (aux^.isbn<>p.isbn) Do
    aux := aux^.sig;
  If (aux=Nil) Then
    Begin
      nuevoPrestamo(l,p.isbn);
      agregarAdelante(l^.dato,p);
    End
  Else
    agregarAdelante(l^.dato,p);
End;

Procedure leerPrestamo(Var p: prestamos);
Begin
  p.isbn := Random(10);
  p.Nsocio := Random(40) + 1;
  p.Dia := Random(31) + 1;
  p.Mes := Random(12) + 1;
  p.CantDias := Random(30) + 1;
End;

Var 
  p: prestamos;
Begin
  iniciar(arb,l);
  leerPrestamo(p);
  While (p.isbn<>0) Do
    Begin
      insertarArbol(arb,p);
      insertarLista(l,p);
      leerPrestamo(p);
    End;
End;

Procedure recorrerArbol(a: Arbol);
Begin
  If (a <> Nil) Then
    Begin
      recorrerArbol(a^.hi);
      Writeln('ISBN: ', a^.isbn);
      recorrerArbol(a^.hd);

    End;
End;

Procedure recorrerLista(l: ListaTotal);

Var 
  auxLista: ListaPorLibro;
Begin
  While l <> Nil Do
    Begin
      Writeln('ISBN: ', l^.isbn);
      auxLista := l^.dato;
      While auxLista <> Nil Do
        Begin
          Writeln('  Socio: ', auxLista^.dato.Nsocio,
                  ' - Fecha: ', auxLista^.dato.Dia, '/', auxLista^.dato.Mes,
                  ' - Dias prestados: ', auxLista^.dato.CantDias);
          auxLista := auxLista^.sig;
        End;
      l := l^.sig;
    End;
End;
Function masGrande(a:Arbol): Integer;

Var 
  maxIzq,maxDer: Integer;
Begin
  If (a=Nil) Then
    masGrande := -1
  Else
    Begin
      maxIzq := masGrande(a^.hi);
      maxDer := masGrande(a^.hd);
      If (maxIzq>maxDer) Then
        masGrande := maxIzq
      Else
        masGrande := maxDer;
      If (a^.isbn>masGrande) Then
        masGrande := a^.isbn;
    End;
End;
// calcular mas chico con el arbol









{Function masChico(a:Arbol): Integer;

Var 
  maxIzq,maxDer: Integer;
Begin
  If (a=Nil) Then
    masChico := 999
  Else
    Begin
      maxIzq := masChico(a^.hi);
      maxDer := masChico(a^.hd);
      If (maxIzq<maxDer) Then
        masChico := maxIzq
      Else
        masChico := maxDer;
      If (a^.isbn<masChico) Then
        masChico := a^.isbn;
    End;
End;}

Function listaRecursiva(l:ListaTotal): Integer;

Var 
  min: Integer;
Begin
  If (l=Nil) Then
    listaRecursiva := 999
  Else
    Begin
      min := listaRecursiva(l^.sig);
      If (l^.isbn<min) Then
        listaRecursiva := l^.isbn
      Else
        listaRecursiva := min;
    End;
End;

Function numeroSocio(a:Arbol; num:Integer): Integer;
Function cumple (nsocio,cmpSocio:Integer): Integer;
Begin
  If (nsocio=cmpSocio) Then
    cumple := 1
  Else cumple := 0;
End;
Begin
  If (a<>Nil) Then
    numeroSocio := numeroSocio(a^.hi,num) + numeroSocio(a^.hd,num) + cumple(a^.
                   prestamo.Nsocio,num)
  Else
    numeroSocio := 0;
End;

Function numeroSocioLista(l:ListaTotal; num:Integer): Integer;

Function contarLista(listaDentro:ListaPorLibro): Integer;

Var 
  cant: Integer;
Begin
  cant := 0;
  While (listaDentro<>Nil) Do
    Begin
      If (listaDentro^.dato.Nsocio = num) Then
        cant := cant+1;
      listaDentro := listaDentro^.sig;
    End;
  contarLista := cant;
End;
Begin
  If (l<>Nil) Then
    numeroSocioLista := numeroSocioLista(l^.sig,num) + contarLista(l^.dato)
  Else numeroSocioLista := 0;
End;
Procedure incisoF(a:Arbol; Var l: listaIncisoF);
Procedure recorrer(a:Arbol; Var l:ListaIncisoF);
Procedure agregarLista(numero:Integer; Var l:listaIncisoF);

Var 
  aux: listaIncisoF;
Begin
  new(aux);
  aux^.dato.isbn := numero;
  aux^.dato.cant := 1;
  aux^.sig := l;
  l := aux;
End;
Begin
  If (a<>Nil) Then
    Begin
      recorrer(a^.hi,l);
      If (l=Nil) Then
        agregarLista(a^.isbn,l)
      Else If (a^.isbn<>l^.dato.isbn) Then
             agregarLista(a^.isbn,l)
      Else l^.dato.cant := l^.dato.cant + 1;
      recorrer(a^.hd,l);
    End;
End;
Begin
  l := Nil;
  recorrer(a,l);
End;

Procedure recorrerIncisoF(l:listaIncisoF);
Begin
  While (l<>Nil) Do
    Begin
      WriteLn('ISBN: ', l^.dato.isbn);
      WriteLn('---------');
      WriteLn('Cantidad: ', l^.dato.cant);
      WriteLn('---------');
      l := l^.sig;
    End;
End;


Procedure incisoG(Var a:ArbolG; l:ListaTotal);
Procedure recorrerListaG(Var a:ArbolG; l:ListaTotal);
Procedure agregarArbolG(Var a:ArbolG; num:Integer);
Begin
  If (a=Nil) Then
    Begin
      New(a);
      a^.dato.cant := 1;
      a^.dato.isbn := num;
      a^.hi := Nil;
      a^.hd := Nil;
    End
  Else If (a^.dato.isbn>num) Then
         agregarArbolG(a^.hi,num)
  Else If (a^.dato.isbn<num) Then
         agregarArbolG(a^.hd,num)
  Else a^.dato.cant := a^.dato.cant + 1;
End;
Begin
  If (l<>Nil) Then
    Begin
      agregarArbolG(a,l^.isbn);
      recorrerListaG(a,l^.sig);
    End;
End;


Begin
  a := Nil;
  recorrerListaG(a,l);
End;

Procedure recorrerIncisoG(a:ArbolG);
Begin
  If (a<>Nil) Then
    Begin
      recorrerIncisoG(a^.hi);
      WriteLn('ISBN: ', a^.dato.isbn);
      WriteLn('---------');
      WriteLn('Cantidad: ', a^.dato.cant);
      WriteLn('---------');
      recorrerIncisoG(a^.hd);

    End;
End;

Function incisoI(a:Arbol; p1,p2:Integer): Integer;
Begin
  If (a=Nil) Then
    incisoI := 0
  Else
    Begin
      If (a^.isbn<=p1) Then
        incisoI := incisoI(a^.hd,p1,p2)
      Else If (a^.isbn>=p2) Then
             incisoI := incisoI(a^.hi,p1,p2)
      Else incisoI := incisoI(a^.hi,p1,p2) + incisoI(a^.hd,p1,p2) + 1
    End;
End;


Var 
  l: ListaTotal;
  arb: Arbol;
  num,p1,p2: Integer;
  listaF: listaIncisoF;
  arbG: ArbolG;
Begin
  randomize;
  GenerarEstructuras(arb,l);
  recorrerArbol(arb);
  WriteLn('-----Recorrer lista: ------');
  WriteLn();
  recorrerLista(l);

  //inciso b
  WriteLn('-----mas grande-----');
  WriteLn(masGrande(arb));

  //inciso c
  //era con la lista XDDDDD
  {WriteLn('-----mas chico-----');
  WriteLn(masChico(arb));}
  WriteLn('-----mas chico-----');
  WriteLn(listaRecursiva(l));
  WriteLn();

  //inciso d
  WriteLn('Ingrese numero de socio:');
  ReadLn(num);
  WriteLn('-----Busqueda por arbol-----');
  WriteLn('La cantidad de prestamos del socio numero ', num, ' es: ',
          numeroSocio(arb,num));
  //inciso e
  WriteLn('-----Busqueda por lista-----');
  ReadLn(num);
  WriteLn('La cantidad de prestamos del socio numero ', num, ' es: ',
          numeroSocioLista(l,num));
  //inciso f

  WriteLn('-----Recorrida por lista-----');

  incisoF(arb,listaF);
  recorrerIncisoF(listaF);

  //inciso g

  WriteLn('-----Recorrida por arbol-----');

  incisoG(arbG,l);

  //inciso h

  recorrerIncisoG(arbG);

  //inciso i
  WriteLn('----Inciso I-----');
  WriteLn('Ingrese parametros:');
  WriteLn('Piso:');
  ReadLn(p1);
  WriteLn('Techo:');
  ReadLn(p2);
  WriteLn('La cantidad de prestamos dentro de los parametros es: ', incisoI(arb,
          p1,p2));
End.
