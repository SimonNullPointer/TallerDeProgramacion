program ejercicio2;

const max= 150; min= 100;


type lista = ^nodo;
nodo = record
dato: Integer;
sig:lista
end;

procedure GenerarLista(var l:lista);
begin
l:= nil;
end;

Procedure AgregarLista(var l:lista; n:Integer);
var aux:lista;
begin 
new(aux);
aux^.dato:= n;
aux^.sig:= l;
l:= aux;
end;


procedure CargarLista(var l:lista);
var ale:Integer;
begin
GenerarLista(l);
ale:= min + random(max-min+1);
while (ale<>120) do begin
	AgregarLista(l,ale);
	ale:= min + random(max-min+1);
	end;
end;

procedure ImprimirLista(l:Lista);
begin
while (l<>nil) do begin
writeln(l^.dato);
l:= l^.sig;
end;

end;

function BuscarElemento(l:lista; n:integer):Boolean;
var buscador:boolean;
begin
buscador:= false;
while (l<>nil) and (not buscador) do begin
if (l^.dato=n) then
	buscador := true
else l:= l^.sig;
end;
 BuscarElemento:= buscador;
end;


var l:lista;
n:integer;
BEGIN
randomize;
CargarLista(l);
ImprimirLista(l);
	
WriteLn('buscar:');
ReadLn(n);
writeln(BuscarElemento(l,n));

END.

