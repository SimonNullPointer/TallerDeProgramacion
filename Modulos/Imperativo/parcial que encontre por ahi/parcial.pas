program parcial;

type 
  cadena = String[25];
  arbolProyectos = ^nodoProyectos;
  nodoProyectos = record
    cantVotos: Integer;
    Topico: Cadena;
    hi:arbolProyectos;
    hd:arbolProyectos;
  end;

  Alumno = record
    nombre: Cadena;
    Proyectos:arbolProyectos;
  end;

  Arbol = ^nodoArbol;
  nodoArbol = record 
    dato:Alumno;
    hi:Arbol;
    hd:Arbol;
  end;

procedure generarNombreAleatorio(var v:cadena);
const
  nombres: array[1..5] of cadena = ('Ana', 'Juan', 'Carlos', 'Lucia', 'Maria');
begin
  v := nombres[Random(5) + 1]; 
end;

procedure generarTopicoAleatorio(var t:cadena);
const
  topicos: array[1..5] of cadena = ('Matematica', 'Fisica', 'Quimica', 'Historia', 'Programacion');
begin
  t := topicos[Random(5) + 1]; 
end;

procedure leerVoto(var v:cadena; var contador: integer);
begin
  if contador >= 200 then
    v := 'zzz'  
  else begin
    generarNombreAleatorio(v);
    Inc(contador);
  end;
end;

procedure leerTopico(var t:cadena);
begin
  generarTopicoAleatorio(t);
end;

procedure inicializarValores(var a:Arbol; v:cadena);
begin
  New(a);
  a^.dato.nombre := v;
  a^.dato.Proyectos := Nil;
  a^.hi := Nil;
  a^.hd := Nil;
end;

procedure agregarArbolTopico(var a:arbolProyectos; t:cadena);

  procedure iniciar(var a:arbolProyectos; t:cadena);
  begin
    New(a);
    a^.cantVotos := 1;
    a^.Topico := t;
    a^.hi := Nil;
    a^.hd := Nil;
  end;

begin
  if (a = Nil) then 
    iniciar(a, t)
  else if (a^.Topico < t) then
    agregarArbolTopico(a^.hd, t)
  else if (a^.Topico > t) then
    agregarArbolTopico(a^.hi, t)
  else 
    a^.cantVotos := a^.cantVotos + 1;
end;

procedure generarArbol(var a:Arbol; v, t:cadena);
begin
  if (a = Nil) then begin
    inicializarValores(a, v);
    agregarArbolTopico(a^.dato.Proyectos, t);
  end
  else if (a^.dato.nombre < v) then 
    generarArbol(a^.hd, v, t)
  else if (a^.dato.nombre > v) then 
    generarArbol(a^.hi, v, t)
  else 
    agregarArbolTopico(a^.dato.Proyectos, t);
end;

procedure sistemaVotacion(var a:Arbol);
var 
  votoAlumno, topico:cadena;
  contador: integer;
begin
  contador := 0;
  a := Nil;
  leerVoto(votoAlumno, contador);
  while (votoAlumno <> 'zzz') do
  begin
    leerTopico(topico);
    generarArbol(a, votoAlumno, topico);
    leerVoto(votoAlumno, contador);
  end;
end;

procedure recorrerProyectos(a: arbolProyectos);
begin
  if (a <> Nil) then
  begin
    recorrerProyectos(a^.hi);  
    WriteLn('   > Topico: ', a^.Topico, ' - Votos: ', a^.cantVotos); 
    recorrerProyectos(a^.hd);  
  end;
end;

procedure recorrerArbol(a: Arbol);
begin
  if (a <> Nil) then
  begin
    recorrerArbol(a^.hi);  
    WriteLn('=====================================');
    WriteLn('Alumno: ', a^.dato.nombre);  
    WriteLn('Proyectos votados: ');
    recorrerProyectos(a^.dato.Proyectos);  
    WriteLn('=====================================');
    recorrerArbol(a^.hd); 
  end;
end;

procedure EncontrarGanador(a:Arbol; var maxVotos:integer;var ng,tg:cadena);

procedure Arbol2(a:arbolProyectos;nombre:Cadena;var maxVotos:integer;var ng,tg:cadena);
begin
if (a<>Nil) then
begin
  arbol2(a^.hi,nombre,maxVotos,ng,tg);
  if (a^.cantVotos>maxVotos) then
  begin
  maxVotos:= a^.cantVotos;
  ng:= nombre;
  tg:= a^.Topico;
  end;
  arbol2(a^.hd,nombre,maxVotos,ng,tg);
end;
end;
begin
  if(a<>Nil) then
    begin
      EncontrarGanador(a^.hi,maxVotos,ng,tg);
      Arbol2(a^.dato.Proyectos,a^.dato.nombre,maxVotos,ng,tg);
      EncontrarGanador(a^.hd,maxVotos,ng,tg);
    end;
end;




  procedure incisoC(a:Arbol);
  var 
    nombreGanador, topicoGanador: cadena;
  maxVotos: Integer;
    begin
    maxVotos:= 0;
    EncontrarGanador(a,maxVotos,nombreGanador,topicoGanador);
if (maxVotos<>0) then
begin
WriteLn('Proyecto ganador:');
  WriteLn('Alumno: ', nombreGanador);
  WriteLn('Topico: ', topicoGanador);
  WriteLn('Votos: ', maxVotos);

end
else WriteLn('se cancelo el concurso')
end;

var
  arb:Arbol;
begin
  Randomize;  
  sistemaVotacion(arb);
  WriteLn('=========== RESULTADOS ===========');
  recorrerArbol(arb);
  WriteLn('=========== FIN ===========');

incisoC(arb);
end.
