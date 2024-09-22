
Program ejercicio4;

Type 

  RangoTipo = 1..20;
  Reclamo = Record
    DNI: Integer;
    IDreclamo: Integer;
    anio: Integer;
    tipoReclamo: RangoTipo;
  End;
  Lista = ^nodoReclamos;
  nodoReclamos = Record
    dato: Reclamo;
    sig: Lista;
  End;
  Reclamos = Record
    ListaReclamos: Lista;
    Cantidad: Integer;
    DNI: Integer;
  End;
  Arbol = ^nodo;
  nodo = Record
    dato: Reclamos;
    HI: Arbol;
    HD: Arbol;
  End;
  ListaD = ^nodoD;
  nodoD = Record
    dato: Integer;
    sig: ListaD;
  End;

Procedure generarEstructura(Var arb:Arbol);

Procedure leerReclamo(Var r:Reclamo);
Begin
  r.DNI := random(40);
  r.IDreclamo := random(40);
  r.anio := random(40);
  r.tipoReclamo := random(40);
End;

Procedure agregarReclamo(Var arb:Arbol; r:Reclamo);
Procedure inicializarDatos(Var arb:Arbol; r:Reclamo);
Begin
  New(Arb);
  arb^.dato.DNI := r.DNI;
  arb^.dato.Cantidad := 0;
  arb^.dato.ListaReclamos := Nil;
End;


Procedure agregarReclamoLista(Var arb:Arbol; r:Reclamo);
Procedure insertarLista(Var l:Lista; r:Reclamo);

Var 
  aux: Lista;
Begin
  //insertarLista
  New(aux);
  aux^.dato := r;
  aux^.sig := l;
  l := aux;
End;
Begin
  //agregarReclamoLista 
  insertarLista(arb^.dato.ListaReclamos,r);
  arb^.dato.Cantidad := arb^.dato.Cantidad + 1;
End;
Begin
  //agregarReclamo
  If (arb=Nil) Then
    Begin
      inicializarDatos(arb,r);
      agregarReclamoLista(arb,r);
    End
  Else If (r.DNI<arb^.dato.DNI) Then
         agregarReclamo(arb^.HI,r)
  Else If (r.DNI>arb^.dato.DNI) Then
         agregarReclamo(arb^.HD,r)
  Else agregarReclamoLista(arb,r);
End;

Var 
  r: Reclamo;
Begin
  //generarEstructura
  arb := Nil;
  leerReclamo(r);
  While (r.IDreclamo<>0) Do
    Begin
      agregarReclamo(arb,r);
      leerReclamo(r);
    End;
End;

Procedure recorrerArbolInorden(arb: Arbol);
Begin
  If (arb <> Nil) Then
    Begin
      recorrerArbolInorden(arb^.HI);
      writeln('DNI: ', arb^.dato.DNI, ' - Cantidad de Reclamos: ', arb^.dato.
              Cantidad);
      recorrerArbolInorden(arb^.HD);
    End;
End;


Function buscarReclamos(a:Arbol; n:Integer): Integer;
Begin
  If (a= Nil) Then
    buscarReclamos := -1
  Else If (a^.dato.DNI<n) Then
         buscarReclamos := buscarReclamos(a^.HD,n)
  Else If (a^.dato.DNI>n) Then
         buscarReclamos := buscarReclamos(a^.HI,n)
  Else
    buscarReclamos := a^.dato.Cantidad;
End;

Procedure incisoB(arb:Arbol);

Var 
  dni: Integer;
Begin
  WriteLn('reclamo');
  ReadLn(dni);
  WriteLn('El DNI ingresado posee:', buscarReclamos(arb,dni),' reclamos.');
End;

Procedure incisoC(arb:Arbol);
Function funcionC(arb:Arbol; d1:Integer; d2:Integer): Integer;
Begin
  If (arb<>Nil) Then
    Begin
      If (arb^.dato.DNI<d1) Then
        funcionC := funcionC(arb^.HD,d1,d2)
      Else If (arb^.dato.DNI>d2) Then
             funcionC := funcionC(arb^.HI,d1,d2)
      Else
        funcionC := funcionC(arb^.HI, d1, d2) + funcionC(arb^.HD, d1, d2) + arb^
                    .dato.Cantidad;
    End
  Else funcionC := 0;
End;



Var 
  dni1,dni2: Integer;
Begin
  WriteLn('dni 1');
  ReadLn(dni1);
  WriteLn('dni 2');
  ReadLn(dni2);
  WriteLn('La cantidad de reclamos dentro de los DNI es:',funcionC(arb,dni1,dni2
  ));
End;

Procedure incisoD(arb:arbol; Var l:listaD);
Procedure recorrerArbolD(arb:arbol; Var l:listaD;n:Integer);
Procedure RecorrerListaReclamos(l:lista;Var lD:listaD; n:integer);
Procedure agregarListaD(Var l:listaD;cod:Integer );

Var 
  aux: listaD;
Begin
  new(aux);
  aux^.dato := cod;
  aux^.sig := l;
  l := aux;
End;
Begin
  While (l<>Nil) Do
    Begin
      If (l^.dato.anio=n)Then
        agregarListaD(lD,l^.dato.IDreclamo);
      l := l^.sig;
    End;

End;
Begin
  If (arb<>Nil) Then
    Begin
      recorrerArbolD(arb^.HI,l,n);
      RecorrerListaReclamos(arb^.dato.ListaReclamos,l,n);
      RecorrerArbolD(arb^.HD,l,n);
    End;
End;

Var 
  n: integer;
Begin
  l := Nil;
  WriteLn('Ingrese anio:');
  ReadLn(n);
  recorrerArbolD(arb,l,n);
End;

Var 
  arb: Arbol;
  listaIncisoD: listaD;
Begin
  randomize;
  generarEstructura(arb);
  recorrerArbolInorden(arb);

  incisoB(arb);
  incisoC(arb);
  incisoD(arb,listaIncisoD);
End.
