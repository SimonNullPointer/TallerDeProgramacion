Program ejercicio2;

Const 
  minAnio = 2010;
  maxAnio = 2018;

Type 
  RangoAnios = 2010..2018;
  Cadena = String[25];
  autos = Record
    patente: Integer;
    anio: RangoAnios;
    marca: Cadena;
    modelo: Cadena;
  End;
  AutoLista = Record
    patente: Integer;
    anio: RangoAnios;
    Modelo: Cadena;
  End;
    autoD= Record
    patente: Integer;
    marca: Cadena;
    modelo: Cadena;
  End;

    listaD = ^nodoD;
  nodoD = Record
    dato: AutoD;
    sig: listaD;
  End;

vectorAnios = array[RangoAnios] of listaD;
  lista = ^nodoL;
  nodoL = Record
    dato: AutoLista;
    sig: lista;
  End;

  arbolPatente = ^nodoP;
  nodoP = Record
    dato: Autos;
    hi: arbolPatente;
    hd: arbolPatente;
  End;
  campos = Record
    Marca: Cadena;
    ListaAutos: Lista;
  End;
  ArbolMarca = ^nodoM;
  nodoM = Record
    dato: Campos;
    hi: ArbolMarca;
    hd: ArbolMarca;
  End;


Procedure leerAuto(Var a: autos);
Begin
  a.patente := random(50);
  a.anio := minAnio + random(maxAnio - minAnio + 1);
  a.marca := 'Marca ' + Chr(65 + random(26));
  If random(20) = 0 Then
    a.modelo := 'MMM'
  Else
    a.modelo := 'Modelo ' + Chr(65 + random(26));
End;

Procedure agregarAdelante(Var l:lista; a:autos);
Procedure agregar(Var aux:lista; a:autos);
Begin
  aux^.dato.patente := a.patente;
  aux^.dato.anio := a.anio;
  aux^.dato.Modelo := a.Modelo;

End;

Var 
  aux: lista;
Begin
  New(aux);
  agregar(aux,a);
  aux^.sig := l;
  l := aux;
End;


Procedure insertarArbolP(Var a:arbolPatente; auto:autos);
Procedure insertarDatos(Var a:arbolPatente; auto:autos);
Begin
  New(a);
  a^.dato := auto;
  a^.hi := Nil;
  a^.hd := Nil;
End;
Begin
  If (a=Nil) Then
    insertarDatos(a,auto)
  Else If (a^.dato.patente>auto.patente) Then
         insertarArbolP(a^.hi,auto)
  Else insertarArbolP(a^.hd,auto)
End;

Procedure iniciarValores(Var a:ArbolMarca; auto:autos);
Begin
  new(a);
  a^.dato.Marca := auto.marca;
  a^.dato.ListaAutos := Nil;
  a^.hi := Nil;
  a^.hd := Nil;
  agregarAdelante(a^.dato.ListaAutos, auto);
End;


Procedure insertarArbolM(Var a:ArbolMarca; auto:autos);
Begin
  If (a=Nil) Then
    iniciarValores(a,auto)
  Else If (a^.dato.Marca>auto.marca) Then
         insertarArbolM(a^.hi,auto)
  Else If (a^.dato.Marca<auto.marca) Then
         insertarArbolM(a^.hd,auto)
  Else agregarAdelante(a^.dato.ListaAutos,auto);
End;



Procedure iniciarArboles(Var AM: ArbolMarca; Var AP: arbolPatente);

Var 
  a: autos;
Begin
  leerAuto(a);
  While (a.modelo<>'MMM') Do
    Begin
      insertarArbolP(AP,a);
      insertarArbolM(AM,a);
      leerAuto(a)
    End;
End;

Procedure recorrerListaAutos(l: lista);
Begin
  While l <> Nil Do
    Begin
      WriteLn('  Patente: ', l^.dato.patente, ', Anio: ', l^.dato.anio,
              ', Modelo: ', l^.dato.Modelo);
      l := l^.sig;
    End;
End;

Procedure recorrerArbolMarca(a: ArbolMarca);
Begin
  If a <> Nil Then
    Begin
      recorrerArbolMarca(a^.hi);
      WriteLn('Marca: ', a^.dato.Marca);
      WriteLn('  Autos: ');
      recorrerListaAutos(a^.dato.ListaAutos);
      recorrerArbolMarca(a^.hd);
    End;
End;
Procedure recorrerArbolPatente(a: arbolPatente);
Begin
  If a <> Nil Then
    Begin
      recorrerArbolPatente(a^.hi);
      WriteLn('Patente: ', a^.dato.patente, ', Anio: ', a^.dato.anio,
              ', Marca: ', a^.dato.marca, ', Modelo: ', a^.dato.modelo);
      recorrerArbolPatente(a^.hd);
    End;
End;

Function marcaCant(a:arbolPatente; m:Cadena): Integer;

Function cumple(cmpAct,cmpRef: Cadena): Integer;
Begin
  If (cmpAct=cmpRef) Then
    cumple := 1
  Else cumple := 0;
End;
Begin
  If (a<>Nil) Then
    marcaCant := marcaCant(a^.hi,m) +marcaCant(a^.hd,m) +cumple(a^.dato.marca,m)
  Else marcaCant := 0;
End;


Procedure incisoB(a:arbolPatente);

Var 
  m: Cadena;
Begin
  WriteLn('Ingrese la marca para buscar:');
  ReadLn(m);
  WriteLn('La cantidad de autos registrados a esa marca son: ', marcaCant(a,m));
End;

Function busquedaCant(a:ArbolMarca;M:Cadena): Integer;

Function recorrer(l:lista): Integer;

Var 
  aux: Integer;
Begin
  aux := 0;
  While (l<>Nil) Do
    Begin
      aux := aux + 1;
      l := l^.sig;
    End;
  recorrer := aux;
End;

Begin
  If (a<>Nil) Then
    Begin
      If (a^.dato.Marca<M) Then
        busquedaCant := busquedaCant(a^.hd,m)
      Else If (a^.dato.Marca>M) Then
             busquedaCant := busquedaCant(a^.hi,m)
      Else busquedaCant := recorrer(a^.dato.ListaAutos)
    End
  Else busquedaCant := 0;
End;


Procedure incisoC(a:ArbolMarca);

Var 
  m: Cadena;
Begin
  WriteLn('Ingrese la marca para buscar:');
  ReadLn(m);
  WriteLn('La cantidad de autos registrados a esa marca son: ', busquedaCant(a,m
  ));

End;

Procedure incisoE(a:arbolPatente);

Function buscarPatente(a:arbolPatente;p:Integer): Cadena;
Begin
  If (a<>Nil) Then
    Begin
      If (a^.dato.patente>p) Then
        buscarPatente := buscarPatente(a^.hi,p)
      Else If (a^.dato.patente<p) Then
             buscarPatente := buscarPatente(a^.hd,p)
      Else buscarPatente := a^.dato.marca
    End
  Else buscarPatente := 'Patente not found';
End;

Var 
  p: Integer;
Begin

  WriteLn('Ingrese patente para buscar modelo:');
  ReadLn(p);
  WriteLn('El modelo del auto de la patente buscada es:', buscarPatente(a,p));

End;

procedure inicializarVector(var v:vectorAnios);
var
i:Integer;
begin
  for i:=minAnio to maxAnio do 
    v[i]:= Nil;
end;
Procedure agregarAdelante(Var l:listaD; a:autos);
Procedure agregar(Var aux:listaD; a:autos);
Begin
  aux^.dato.patente := a.patente;
  aux^.dato.marca:= a.marca;
  aux^.dato.Modelo := a.Modelo;
End;

Var 
  aux: listaD;
Begin
  New(aux);
  agregar(aux,a);
  aux^.sig := l;
  l := aux;
End;

procedure agregarVectorLista(a:arbolPatente;var v:vectorAnios);
begin
  if (a<>Nil) then
  begin
    agregarVectorLista(a^.Hi,v);
    agregarAdelante(v[a^.dato.anio],a^.dato);
    agregarVectorLista(a^.Hd,v);
  end;
end;

procedure incisoD(a:arbolPatente; var v:vectorAnios);

begin
  inicializarVector(v);
  agregarVectorLista(a,v);
end;

Procedure recorrerListaD(l: listaD);
Begin
  While l <> Nil Do
    Begin
      WriteLn('  Patente: ', l^.dato.patente, ', Marca: ', l^.dato.marca, ', Modelo: ', l^.dato.modelo);
      l := l^.sig;
    End;
End;

Procedure recorrerIncisoD(v: vectorAnios);
Var
  i: RangoAnios;
Begin
  For i := minAnio To maxAnio Do
    Begin
      WriteLn('Anio: ', i);
      If v[i] <> Nil Then
        recorrerListaD(v[i])
      Else
        WriteLn('  Sin autos registrados para este año.');
    End;
End;


Procedure incisoF(a: ArbolMarca);

Function buscarPatenteEnLista(l: lista; p: Integer): Cadena;
Begin
  While (l <> Nil) and (l^.dato.patente <> p) Do
    l := l^.sig;
  If l = Nil Then
    buscarPatenteEnLista := 'Patente no encontrada'
  Else
    buscarPatenteEnLista := l^.dato.Modelo;
End;

function buscarPatenteEnMarcas(a:ArbolMarca; p:Integer):Cadena;
var 
modelo:Cadena;
begin
  if (a<>Nil) then
  begin
     modelo := buscarPatenteEnLista(a^.dato.ListaAutos, p);
    
    if (modelo = 'Patente no encontrada') then
    begin
      modelo := buscarPatenteEnMarcas(a^.hi, p);  
      if (modelo = 'Patente no encontrada') then
        modelo := buscarPatenteEnMarcas(a^.hd, p);  
    end;
    buscarPatenteEnMarcas := modelo; 
  end 
end;


var 
p:Integer;
begin
 WriteLn('Ingrese patente para buscar modelo:');
  ReadLn(p);
  WriteLn('El modelo del auto de la patente buscada es: ', buscarPatenteEnMarcas(a, p));
end;

Var 
  arbMarca: ArbolMarca;
  arbPatente: arbolPatente;
  vector:vectorAnios;
Begin
  randomize;
  iniciarArboles(arbMarca,arbPatente);

  WriteLn('Recorrido del árbol por patentes:');
  recorrerArbolPatente(arbPatente);

  WriteLn('Recorrido del árbol por marcas:');
  recorrerArbolMarca(arbMarca);


  incisoB(arbPatente);
  incisoC(arbMarca);
  incisoD(arbPatente,vector);
    recorrerIncisoD(vector);

  incisoE(arbPatente);
  incisoF(arbMarca);
End.

