program Ejercicio5;
const
	dimF = 100;
type
	rangoV = 1..dimF;
	vector = array [rangoV] of integer;

procedure CargarVector (var v:vector);
var
	i:integer;
begin
	for i:= 1 to dimF do
		v[i]:= i;
end;

procedure busquedaDicotomica (v:vector; ini,fin:rangoV; dato:integer; var pos:integer);
var
	medio:rangoV;
begin
	medio:= (ini + fin) DIV 2;
	if (ini <= fin) and (dato <> v[medio]) then begin
		if (dato < v[medio]) then
			fin:= medio-1
		else
			ini:= medio+1;
		busquedaDicotomica(v,ini,fin,dato,pos);
	end;
	if (ini <= fin) and (dato = v[medio]) then
		pos:= medio;
end;

var
	v:vector;
	ini,fin:rangoV;
	dato,pos:integer;

begin
	CargarVector(v);
	ini:= 1;
	fin:= dimF;
	pos:= -1;
	writeln('Ingrese el dato a buscar');
	readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	writeln(pos);
end.
