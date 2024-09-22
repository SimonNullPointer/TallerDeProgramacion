
Program ejercicio2;

Const 
  min = 100;
  max = 200;

Type 
  lista = ^nodo;
  nodo = Record
    dato: Integer;
    sig: lista;
  End;

Procedure LlenarListaRecursiva(Var pri,ult:lista);
Procedure generarLista(Var l:lista);
Begin
  l := Nil;
End;

Procedure AgregarElemento(Var pri,ult:lista; n:Integer);

Var 
  aux: lista;
Begin
  new(aux);
  aux^.dato := n;
  aux^.sig := Nil;
  If (pri = Nil) Then
    Begin
      pri := aux;
      ult := aux;
    End
  Else
    Begin
      ult^.sig := aux;
      ult := aux;
    End;
End;

Procedure LlenarLista(Var pri,ult:lista);

Var 
  num : Integer;
Begin
  num := min + random(max-min+1);
  If (num <> min) Then
    Begin
      AgregarElemento(pri,ult,num);
      LlenarLista(pri,ult);
      // recursividad
      // else agregarElemento(pri,ult,100); en caso de que 100 deba procesarse
    End;
End;

Begin
  generarLista(pri);
  LlenarLista(pri,ult)
End;

Procedure ImprimirListaRecursiva(l:lista);
Begin
  If (l<>Nil) Then
    Begin
      Write(l^.dato);
      Write(' | ');
      ImprimirListaRecursiva(l^.sig);
    End;
End;

Procedure ImprimirListaInversaRecursiva(l:lista);
Begin
  If (l <> Nil) Then
    Begin
      ImprimirListaInversaRecursiva(l^.sig);
      Write(l^.dato);
      Write(' | ');
    End;
End;

Function CalcularMinimoRecursivo(l:lista): Integer;

Var 
  Minimo: Integer;
Begin
  If l=Nil Then
    Minimo := 999 //caso base
  Else
    Begin
      Minimo := CalcularMinimoRecursivo(l^.sig);
      //recursivo
      If (l^.dato<Minimo) Then
        CalcularMinimoRecursivo := l^.dato
      Else
        CalcularMinimoRecursivo := Minimo
    End;
End;


Function existe(l:lista; n:Integer): Boolean;
Begin
  If (l = Nil) Then
    existe := False
  Else If (l^.dato = n) Then
         existe := True
  Else
    existe := existe(l^.sig, n);
End;


Var 
  pri,ult: lista;
  n: Integer;
Begin
  //inciso A
  randomize;
  LlenarListaRecursiva(pri,ult);
  //inciso B
  WriteLn('Lista impresa en orden:');
  ImprimirListaRecursiva(pri);

  WriteLn();
  WriteLn();
  // inciso C
  WriteLn('Lista impresa al reves:');
  ImprimirListaInversaRecursiva(pri);

  WriteLn();
  WriteLn();
  //inciso D
  WriteLn('El numero mas bajo de la lista es:');
  WriteLn(CalcularMinimoRecursivo(pri));
  WriteLn();
  WriteLn();
  //inciso E
  WriteLn('Ingrese valor a buscar:');
  ReadLn(n);
  WriteLn(existe(pri,n));
End.
