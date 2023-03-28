program untitled;

const
	dimF = 8;

type
	pelicula = record
		codigoP : integer;
		codigoG : 1..dimF;
		puntaje : 1..10;
	end;
	
	lista =^ nodo;
	nodo = record
		dato : pelicula;
		sig : lista;
	end;
	
	pelis2 = record
		codigo:integer;
		puntaje:1..10;
	end;
	
	vector = array[1..dimF] of lista;
	vector2 = array[1..dimF] of pelis2;

procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

procedure leerPelicula(var p:pelicula);
begin
	writeln('Ingrese el codigo de la pelicula');
	p.codigoP := random(102) - 1;
	writeln(p.codigoP);
	if (p.codigoP <> -1) then begin
		writeln('Ingrese el codigo de la pelicula');
		p.codigoG := random(dimF) + 1;
		writeln(p.codigoG);
		writeln('Ingrese el puntaje');
		p.puntaje := random(10) + 1;
		writeln(p.puntaje);
	end;
end;

procedure agregarAtras(var L, ULT:lista;p:pelicula);
var
	nue: lista;
begin
	new (nue); 
 	nue^.dato := p;
 	nue^.sig := nil; 
 	if( L = nil) then
 		L:= nue
 	else
 		ULT^.sig := nue;
 	ULT := nue;
end;

procedure cargarVector(var v:vector; var ULT:lista);
var
	p:pelicula;
begin
	leerPelicula(p);
	writeln;
	while (p.codigoP <> -1) do begin
		agregarAtras(v[p.codigoG],ULT,p);
		leerPelicula(p);
		writeln;
	end;
end;

procedure IncisoB (var v2:vector2; v:vector);
var
	i:integer;
	max, maxcodigo:integer;
begin
	for i:=1 to dimF do begin
	max:=0;
		while (v[i] <> nil) do begin
			if (v[i]^.dato.puntaje > max) then begin
				max := v[i]^.dato.puntaje;
				maxcodigo := v[i]^.dato.codigoP;
			end;
			v[i] := v[i]^.sig;
		end;
		writeln('integer');
		v2[i].codigo := maxcodigo;
		v2[i].puntaje := max;
		writeln('real');
	end;
end;

procedure IncisoC(var v:vector2);
var
	i,j,p:integer;
	aux:pelis2;
begin
	for i:=1 to dimF - 1 do begin
		p:=i;
		for j:= i+1 to dimF do 
			if v[j].puntaje > v[p].puntaje then 
				p := j;
		aux := v[p];
		v[p]:= v[i];
		v[i]:= aux;
	end;
end;

procedure IncisoD(v:vector2);
var
	i:integer;
	max, min:integer;
begin
	max:=-1;
	min:=11;
	for i:=1 to dimF do begin
		while (v[i].puntaje > max) do begin
			if (v[i].puntaje > max) then begin
				max := v[i].puntaje;
			end;
		end;
		while (v[i].puntaje < min) do begin
			if (v[i].puntaje < min) then begin
				min := v[i].puntaje;
			end;
		end;
	end;
	writeln('Codigo con mayor puntaje: ', max);
	writeln('Codigo con menor puntaje: ', min);
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		writeln(i);
		while (v[i] <> nil) do begin
			writeln(v[i]^.dato.puntaje);
			v[i] := v[i]^.sig;
		end;
		writeln;
	end;
end;

procedure imprimirVector2(v:vector2);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		writeln(v[i].codigo);
		writeln(v[i].puntaje);
		writeln;
	end;
end;

var
	v:vector;
	v2:vector2;
	ULT:lista;

BEGIN
	Randomize;
	cargarVector(v,ULT);
	imprimirVector(v);
	writeln('Inciso B');
	incisoB(v2,v);
	writeln('Inciso B');
	imprimirVector2(v2);
	writeln;
	IncisoC(v2);
	writeln('Inciso C');
	imprimirVector2(v2);
	writeln;
	IncisoD(v2);
END.

