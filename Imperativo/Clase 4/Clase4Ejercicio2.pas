program Clase4Ejercicio2;

const
	dimF=8;

type
	rangoG=1..dimF;
	
	pelicula=record
		codP:integer;
		codG:rangoG;
		puntaje:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:pelicula;
		sig:lista;
	end;
	vector=array[rangoG]of lista;

procedure LeerPelicula(var p:pelicula);
begin
	write('Ingrese codigo de pelicula: ');
	readln(p.codP);
	if (p.codP <> -1) then begin
		write('Ingrese codigo de genero: ');
		readln(p.codG);
		write('Ingrese puntaje promedio: ');
		readln(p.puntaje);
	end;
end;

procedure InsertarOrdenado(var L:lista;p:pelicula);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	act:=L;
	ant:=L;
	while ((act <> nil) and (act^.dato.codP < p.codP)) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act = ant) then
		L:=nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure InicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

procedure GenerarVector(var v:vector);
var
	p:pelicula;
begin
	InicializarVector(v);
	LeerPelicula(p);
	while (p.codP <> -1) do begin
		InsertarOrdenado(v[p.codG],p);
		LeerPelicula(p);
	end;
end;

procedure AgregarAtras(var L,ULT:lista;min:pelicula);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=min;
	nue^.sig:=nil;
	if (L = nil) then
		L:=nue
	else
		ULT^.sig:=nue;
	ULT:=nue;
end;

procedure minimo(var v:vector; var min:pelicula);
var
	pos,i:integer;
begin
	min.codP:=9999;
	pos :=-1;
	for i:=1 to dimF do
		if ((v[i] <> nil) and (v[i]^.dato.codP <= min.codP)) then begin
			min := v[i]^.dato;
			pos := i;
		end;
		if (pos <> -1) then
			v[pos] := v[pos]^.sig;
end;

procedure Merge(v:vector; var L:lista);
var
	min:pelicula;
	ULT:lista;
begin
	minimo(v,min);
	while (min.codP <> -1) do begin
		AgregarAtras(L,ULT,min);
		minimo(v,min);
	end;
end;

var
	v:vector;
	L:lista;
BEGIN
	GenerarVector(v);
	Merge(v,L);
END.

