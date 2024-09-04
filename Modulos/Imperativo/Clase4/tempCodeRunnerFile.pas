
Program ejercicio2;

Type 

  //consultar
  prestamos = Record
    isbn: Integer;
    Nsocio: Integer;
    Dia: Integer;
    Mes: Integer;
    CantDias: Integer;
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
Procedure agregar(Var arb:Arbol;p:prestamos);
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
      agregar(arb,p);
    End
  Else If (p.isbn<a^.isbn) Then
         insertarArbol(arb^.hi,p)
  Else insertarArbol(arb^.hd,p);
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
  p.isbn := Random(20);
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

Var 
  l: ListaTotal;
  arb: Arbol;
Begin
  randomize;
  GenerarEstructuras(arb,l);
End.
