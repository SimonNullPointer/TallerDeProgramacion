
Program ejercicio3;

Type 
  ListaFinales = ^Finales;
  AlumnoNota = Record
    CodMateria: Integer;
    Fecha: Integer;
    Nota: Real;
  End;
  Finales = Record
    dato: AlumnoNota;
    sig: ListaFinales;
  End;
  DatoAlumno = Record
    legajo: Integer;
    AlumnoFinal: ListaFinales;
  End;
  Arbol = ^nodoArbol;
  nodoArbol = Record
    dato: DatoAlumno;
    hi: Arbol;
    hd: Arbol;
  End;

  DatosPromedio = Record
    Legajo: Integer;
    Promedio: Real;
  End;

  Promedios = ^nodo ;
  nodo = Record
    Dato: DatosPromedio;
    sig: Promedios;
  End;



Procedure AgregarNota(Var l:ListaFinales; a:AlumnoNota);

Var 
  aux: ListaFinales;
Begin
  New(aux);
  aux^.dato := a;
  aux^.sig := l;
  l := aux;
End;


Procedure LeerNota(Var nota: AlumnoNota);
Begin
  // WriteLn('Ingrese codigo de la materia:');
  // ReadLn(nota.CodMateria);
  // WriteLn('Ingrese fecha del examen:');
  // ReadLn(nota.Fecha);
  // WriteLn('Ingrese nota de la materia:');
  // ReadLn(nota.Nota);












  // Para probar
  nota.CodMateria := random(30)+1;
  nota.Fecha := random(31)+1;
  nota.Nota := random(10);
End;

Procedure LeerLegajo(Var l:Integer);
Begin
  // WriteLn('Ingrese codigo de legajo:');
  // ReadLn(l);
  {  para probar}
  l := random(30);

End;


Procedure AgregarArbol(Var a:Arbol; l:Integer; nota: AlumnoNota);
Begin
  If (a = Nil) Then
    Begin
      New(a);
      a^.dato.legajo := l;
      a^.dato.AlumnoFinal := Nil;
      AgregarNota(a^.dato.AlumnoFinal, nota);
      a^.hi := Nil;
      a^.hd := Nil;
    End
  Else If (a^.dato.legajo < l) Then
         AgregarArbol(a^.hd, l, nota)
  Else If (a^.dato.legajo > l) Then
         AgregarArbol(a^.hi, l, nota)
  Else
    AgregarNota(a^.dato.AlumnoFinal, nota);
End;

Procedure GenerarArbol(Var a: Arbol);

Var 
  nota: AlumnoNota;
  Legajo: Integer;
Begin
  a := Nil;
  LeerLegajo(Legajo);
  While (Legajo <> 20) Do
    Begin
      LeerNota(nota);
      AgregarArbol(a, Legajo, nota);
      LeerLegajo(Legajo);
    End;
End;
Procedure RecorrerArbolAprobados(a: Arbol);
Procedure RecorrerLista(l: ListaFinales; Var cant:Integer);
Begin
  While (l <> Nil) Do
    Begin
      If (l^.dato.Nota>4) Then
        Begin
          cant := cant+1;
          WriteLn('Materia: ', l^.dato.CodMateria);
          WriteLn('Fecha: ', l^.dato.Fecha);
          WriteLn('Nota: ', l^.dato.Nota:0:2);
          WriteLn();
          WriteLn();
        End;
      l := l^.sig;
    End;
  WriteLn(Cant);
  WriteLn();
End;

Var 
  cant: Integer;
Begin
  If (a <> Nil) Then
    Begin
      cant := 0;
      WriteLn('Numero de Legajo del alumno: ', a^.dato.legajo);
      WriteLn('Finales aprobados:');
      RecorrerLista(a^.dato.AlumnoFinal,cant);
      WriteLn();
      RecorrerArbolAprobados(a^.hi);
      RecorrerArbolAprobados(a^.hd);
    End;
End;
Function esImpar(dato: DatoAlumno): Integer;
Begin
  If (dato.legajo Mod 2 = 1) Then esImpar := 1
  Else esImpar := 0;
End;

Function CalcularImpares(a:arbol): Integer;
Begin
  If (a <> Nil) Then
    Begin
      CalcularImpares := CalcularImpares(a^.HI) + CalcularImpares(a^.HD) +
                         esImpar(a^.dato)
    End
  Else
    CalcularImpares := 0;
End;


Procedure procesoPromedios(a:Arbol; n:Real; Var lRetorno: Promedios);
Procedure RecorrerPromedios(a: Arbol; n:Real; Var lRetorno:Promedios);
Procedure RecorrerLista(l: ListaFinales; Var cant:Integer; Var tot:Real);
Begin
  While (l <> Nil) Do
    Begin
      cant := cant+1;
      tot := tot + l^.dato.Nota;
      l := l^.sig;
    End;
End;


Procedure AgregarPromedio(Var l:Promedios; legajo:Integer; prom: Real);

Var 
  aux: Promedios;
Begin
  new(aux);
  aux^.Dato.Legajo := legajo;
  aux^.Dato.Promedio := prom;
  aux^.sig := l;
  l := aux;
End;


Var 
  cant: Integer;
  tot,prom: Real;
Begin
  If (a <> Nil) Then
    Begin
      cant := 0;
      tot := 0;
      prom := 0;

      RecorrerLista(a^.dato.AlumnoFinal,cant,tot);
      If ((tot/cant)>n) Then
        Begin
          prom := tot/cant;
          AgregarPromedio(lRetorno,a^.dato.legajo,prom);
        End;
      RecorrerPromedios(a^.hi,n,lRetorno);
      RecorrerPromedios(a^.hd,n,lRetorno);
    End;
End;
Begin
  lRetorno := Nil;
  RecorrerPromedios(a,n,lRetorno);
End;

Procedure recorrerListaPromedios(l:Promedios);
Begin

  While (l<>Nil) Do
    Begin
      Write('Legajo: ');
      Write(l^.Dato.Legajo);
      WriteLn();
      Write('promedio: ');
      Write(l^.Dato.Promedio:0:2);
      WriteLn();

      l := l^.sig;
    End;


End;


Var 
  arb: Arbol;
  n: Real;
  listaPromedios: promedios;
Begin
  randomize;
  GenerarArbol(arb);
  //otro inciso
  WriteLn(
          'La cantidad de alumnos con numero de lejago impar es:'
  );
  WriteLn(CalcularImpares(arb));
  // otro inciso mas
  RecorrerArbolAprobados(arb);
  //inciso final 
  WriteLn('Ingrese promedio:');
  ReadLn(n);

// retornar se refiere a una estructura de datos en caso de que sea mas que un dato simple
  // informar es un Write
  procesoPromedios(arb,n,listaPromedios);
  recorrerListaPromedios(listaPromedios);
End.
