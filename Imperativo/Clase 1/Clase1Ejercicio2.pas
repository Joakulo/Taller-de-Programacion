program untitled;
const
	dimF = 20;
type
	oficinas = record
		codigo : integer;
		DNI : integer;
		valor : real;
	end;
	vector = array [1..dimF] of oficinas;

procedure inicializarVector (var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i].codigo := 0;
		v[i].DNI := 0;
		v[i].valor := 0;
end;

procedure leerOficina(var o:oficinas);
begin	
	writeln('Ingrese el codigo de identificacion');
	o.codigo := random(101);
	if (o.codigo <> -1) then begin
		writeln('Ingrese el DNI');
		o.DNI := random(10000) + 1;
		writeln('Ingrese el valor de la expensa');
		o.valor := random(1000);
	end;
end;

procedure agregarEnVector(var v:vector;o:oficinas;var i:integer);
begin
	i := i + 1;
	v[i] := o;
end;

procedure cargarVector(var v:vector; var dimL:integer);
var
	i:integer;
	o:oficinas;
begin
	i:=0;
	dimL:=0;
	Randomize;
	leerOficina(o);
	while ((o.codigo <> -1) and (dimL < dimF)) do begin
		agregarEnVector(v,o,i);
		dimL := dimL + 1;
		leerOficina(o);
	end;
end;

procedure insercion(var v:vector; dimL:integer);
var
	i,j,actual : integer;
begin
	for i:=2 to dimL do begin
		actual := v[i].codigo;
		j := i - 1;
		while ((j > 0) and (v[j].codigo > actual)) do begin
			v[j + 1] := v[j];
			j := j - 1;
		end;
		v [j+1].codigo := actual;
	end;
end;

procedure seleccion(var v:vector; dimL:integer);
var
	i,j,p, aux:integer;
begin
	for i:=1 to dimL - 1 do begin
		p := i;
		for j:= i+1 to dimL do
			if v[j].codigo < v[p].codigo then 
				p := j;
		aux := v[p].codigo;
		v[p].codigo:= v[i].codigo;
		v[i].codigo:= aux;
	end;
end;

procedure imprimirCodigos(v:vector;dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do
		writeln(v[i].codigo);
end;

var
	v:vector;
	dimL:integer;
BEGIN
	inicializarVector(v);
	cargarVector(v,dimL);
	writeln('Normal');
	imprimirCodigos(v,dimL);
	insercion(v,dimL);
	writeln('Insercion');
	imprimirCodigos(v,dimL);
	seleccion(v,dimL);
	writeln('Seleccion');
	imprimirCodigos(v,dimL);
END.

