

program ejercicio3;
const
min = 100;
max = 150;

type 
lista = ^nodo;
nodo = record
dato:Integer;
sig:lista;
end;

procedure GenerarLista(var l:lista);
begin 
l:= nil;
end;

Procedure AgregarOrdenado(var l:lista; n:Integer);
var
ant, act, aux: lista;
begin
new(aux);
aux^.dato:= n;
aux^.sig:= nil;
if (l=nil) then 
	l:= aux 
	else
	begin
		act:= l;
		ant:= l;
		while (act<>Nil) and (act^.dato>n) do 
			begin
				ant:= act;
				act:=act^.sig;
			end;
		if act=l then 
			begin
				aux^.sig:=l;
				l:= aux;
			end 
		else 
			begin
			 ant^.sig:= aux;
			 aux^.sig:= act;
			end;
	end;
end;




procedure CargarListaOrdenada(var l:Lista);
var 
ale:Integer;
begin 
GenerarLista(l);
ale:= min+ random(max-min+1);
while (ale<>120) do begin
	AgregarOrdenado(l,ale);
	ale:= min + random(max-min+1);
end;
 end;







procedure ImprimirLista(l:lista); 
begin 
while (L<>nil) do
begin
writeln(l^.dato);
l:=l^.sig;
end;
end;
function BuscarElementoOrdenado(l:lista; n:integer):boolean;
begin 
while (l<>nil) and (l^.dato>n) do
l:= l^.sig;

if (l<>nil) and (l^.dato=n) then BuscarElementoOrdenado:= True else BuscarElementoOrdenado:= False;
end;





var l:lista; n:integer;
BEGIN
	Randomize;
	CargarListaOrdenada(l);
	ImprimirLista(l);
	
	
	WriteLn('num');
	readLn(n);
	WriteLn(BuscarElementoOrdenado(l,n));
	
	
END.

 
