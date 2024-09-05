program EJERCICIO3;

type
  rangoRubro = 1..10;
  Productos = record
    Codigo: Integer;
    Stock: Integer;
    precio: Real;
  end;

  arbol = ^nodoArbol;
  nodoArbol = record
    dato: Productos;
    hi: arbol;
    hd: arbol;
  end;

  recordC = record
    maxCodigo: Integer;
    Stock: Integer;
  end;

  VectorRubros = array[rangoRubro] of arbol;
  vectorTipoC = array[rangoRubro] of recordC;
  nuevoVector = array[rangoRubro] of Integer;
procedure iniciarArbol(var v: VectorRubros);
var
  i: Integer;
begin
  for i := 1 to 10 do
    v[i] := nil;
end;

procedure leerProducto(var p: Productos);
begin
  p.Codigo := random(20);
  p.Stock := random(40);
  p.precio := random(200);
end;

procedure leerRubro(var r: rangoRubro);
begin
  r := random(10) + 1;
end;

procedure agregarProductoArbol(var a: arbol; p: Productos);

  procedure iniciarValores(var a: arbol; p: Productos);
  begin
    new(a);
    a^.dato := p;
    a^.hi := nil;
    a^.hd := nil;
  end;

begin
  if (a = nil) then
  begin
    iniciarValores(a, p);
  end
  else if (a^.dato.Codigo > p.Codigo) then
    agregarProductoArbol(a^.hi, p)
  else
    agregarProductoArbol(a^.hd, p);
end;

procedure inicializarVector(var v: VectorRubros);
var
  rubro: rangoRubro;
  p: Productos;
begin
  iniciarArbol(v);
  leerProducto(p);
  while (p.Codigo <> 0) do
  begin
    leerRubro(rubro);
    agregarProductoArbol(v[rubro], p);
    leerProducto(p);
  end;
end;

procedure recorrerVectorRubros(v: VectorRubros);

  procedure recorrerArbol(a: arbol);
  begin
    if (a <> nil) then
    begin
      recorrerArbol(a^.hi);
      WriteLn('  - Codigo del producto: ', a^.dato.Codigo);
      WriteLn('    Stock disponible: ', a^.dato.Stock);
      WriteLn('    Precio: ', a^.dato.precio:4:2);
      recorrerArbol(a^.hd);
    end;
  end;

var
  i: Integer;
begin
  for i := 1 to 10 do
  begin
    WriteLn('====================================');
    WriteLn(' Rubro ', i, ':');
    if v[i] = nil then
      WriteLn('  No hay productos en este rubro.')
    else
      recorrerArbol(v[i]);
  end;
  WriteLn('====================================');
end;

function existe(a: arbol; n: Integer): Boolean;
begin
  if (a = nil) then
    existe := false
  else if (a^.dato.Codigo > n) then
    existe := existe(a^.hi, n)
  else if (a^.dato.Codigo < n) then
    existe := existe(a^.hd, n)
  else
    existe := True;
end;

procedure recorrerv(v: arbol; var vc: recordC);
begin
  if (v <> nil) then
  begin
    recorrerv(v^.hd, vc);
    if (v^.hd=nil) then
    begin
		vc.maxCodigo := v^.dato.Codigo;
		vc.Stock := v^.dato.Stock;
		end;
  end;
end;

procedure incisoC(v: VectorRubros; var vC: vectorTipoC);
var
  i: Integer;
begin
  for i := 10 downto 1 do
    recorrerv(v[i], vC[i]);

  WriteLn('==============================');
  WriteLn(' Codigos Maximos y Stocks por Rubro');
  WriteLn('==============================');
  for i := 1 to 10 do
  begin
    WriteLn(' Rubro ', i, ':');
    if vC[i].maxCodigo = 0 then
      WriteLn('  No hay productos en este rubro.')
    else
    begin
      WriteLn('  Codigo maximo: ', vC[i].maxCodigo);
      WriteLn('  Stock asociado: ', vC[i].Stock);
    end;
    WriteLn('------------------------------');
  end;
  WriteLn('==============================');
end;





procedure incisoD(v:vectorRubros; var nuevoV:NuevoVector);

function Cantidad(a:arbol; p1,p2:Integer):Integer;
begin
if(a<>nil) then
	begin 
		if (a^.dato.Codigo<p1) then 
		Cantidad:= Cantidad(a^.hd,p1,p2)
		else if (a^.dato.Codigo>p2) then
		Cantidad:= Cantidad(a^.hi,p1,p2)
		else Cantidad:= Cantidad(a^.hi,p1,p2) + Cantidad(a^.hd,p1,p2) + 1;
	end else Cantidad:= 0;

end;

var
p1,p2,i:Integer;
begin
WriteLn('Ingrese parametro 1:');
ReadLn(p1);
WriteLn('Ingrese parametro 2:');
ReadLn(p2);

for i:=1 to 10 do 
nuevoV[i]:= Cantidad(v[i],p1,p2);

for i:=1 to 10 do 
WriteLn('Rubro ',i,' :',nuevoV[i]);

end;



var
  vector: VectorRubros;
  rubroB: rangoRubro;
  cod: Integer;
  vectorC: vectorTipoC;
  vectorD:NuevoVector;
BEGIN
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
  
  if existe(vector[rubroB], cod) then
    WriteLn(' El producto con codigo ', cod, ' existe en el rubro ', rubroB, '.')
  else
    WriteLn(' El producto con codigo ', cod, ' NO existe en el rubro ', rubroB, '.');
  WriteLn('==============================');

  incisoC(vector, vectorC);
  incisoD(vector,vectorD);
END.
