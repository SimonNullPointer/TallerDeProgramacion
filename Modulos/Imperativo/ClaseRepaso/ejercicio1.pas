program ejercicio1;


TYPE vector = array[1..50] of integer;


procedure MinYMax(var min,max:integer);
begin	
WriteLn('min');
readLn(min);
WriteLn('max');
readLn(max);

end;

procedure CargarVector(var v:Vector; min,max:Integer; var n:Integer);
var ale:integer;
begin
	n:= 0;
	ale := min + random (max-min+1);
	while (n<50)and (ale<>0) do begin
	n:=n+1;
	v[n]:= ale;
	ale := min + random (max-min+1);
	end;
end;
	
	
procedure RecorrerVector(v:vector; n:integer);
var i:Integer;
begin

for i:= 1 to n do
	WriteLn(i,'-',v[i]);
end;

var min,max,n: integer;
v:vector;
begin
randomize; 
MinYMax(min,max);
CargarVector(v,min,max,n);
RecorrerVector(v,n);
end.
