Program Ejercicio2Clase1; 
Const
DimF = 10;
type 
Oficinas = record
CodigoOficina: Integer;
DNI: Integer;
Valor: Real;
end;
vector = array [1..DimF] of Oficinas;



procedure GenerarVector(var v:vector; var dimL:Integer);
	
	procedure LeerOficina(var n: oficinas);
		begin
		WriteLn('Codigo');
		ReadLn(n.CodigoOficina);
		WriteLn('DNI');
		ReadLn(n.DNI);
		WriteLn('Valor');
		ReadLn(n.Valor);
		end;
var
ofi:oficinas;
begin
dimL:= 0;
LeerOficina(ofi);
While(dimL<dimF) and (ofi.Valor<>-1) do begin
	dimL:=dimL+1;
	v[dimL]:=ofi;
	LeerOficina(ofi);
end;
end;
procedure OrdenarVectorInsercion(var v:vector; dimL:Integer);
var
i,j,pos: Integer;
aux: Oficinas;
begin
for i:=1  to dimL-1 do begin
	pos:= i;
	for j:= i+1 to dimL do 
		if (v[i].codigoOficina<v[j].codigoOficina) then pos:= j;
	aux:= v[pos]; //minimo
	v[pos]:= v[i];
	v[i]:= aux;
end;
end;
procedure ImprimirVector(v:vector; dimL:Integer);
var
i:Integer;
begin
for i:= 1 to dimL do
	WriteLn(v[i].CodigoOficina);

end;

procedure ordenarVectorSeleccion( var v: vector; dimL:Integer);
var 
i,j:Integer;
actual: Oficinas;
begin
for i:=2 to dimL do begin
actual:= v[i];
j:=i-1;
while (j>0) and (v[j].codigoOficina>actual.codigoOficina) do begin
v[j+1]:= v[j];
j:= j-1;
end;
v[j+1]:= actual;
end;
end;

var
v:vector;
dimL:Integer;

Begin 
GenerarVector(v,dimL);
OrdenarVectorInsercion(v,dimL);
OrdenarVectorSeleccion(v,dimL);
ImprimirVector(v,dimL);
end.
