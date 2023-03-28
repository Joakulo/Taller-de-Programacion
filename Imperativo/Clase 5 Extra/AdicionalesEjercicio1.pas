program AdicionalesEjercicio1;

const
	dimF = 300;
type
	rangoV=1..dimF;
	oficinas=record
		codigo:integer;
		DNI:integer;
		valor:integer;
	end;
	vector=array[rangoV] of oficinas;

procedure InicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		v[i].codigo := 0;
		v[i].DNI := 0;
		v[i].valor := 0;
	end;
end;

procedure LeerOficinas(var o:oficinas);
begin
	readln(o.codigo);
	if (o.codigo <> -1) then begin
		readln(o.DNI);
		readln(o.valor);
	end;
end;

procedure CargarVector (var v:vector; var dimL:integer);
var
	o:oficinas;
begin
	dimL := 0;
	InicializarVector(v);
	LeerOficinas(o);
	while ((dimL < dimF) and (o.codigo <> -1)) do begin
		dimL := dimL + 1;
		v[dimL] := o;
		LeerOficinas(o);
	end;
end;

procedure OrdenarVector(var v:vector;dimL:integer);
var
	p,i,j:integer;
	aux:oficinas;
begin
	for i:=1 to dimL-1 do begin
		p:=i;
		for j:=i+1 to dimL do
			if (v[j].codigo > v[p].codigo) then
				p:=j;
		aux:=v[p];
		v[p]:=v[i];
		v[i]:=aux;
	end;
end;

procedure busquedaDicotomica (v:vector; ini,fin:rangoV; dato:integer; var pos:integer);
var
	medio:rangoV;
begin
	medio:= (ini + fin) DIV 2;
	if (ini <= fin) and (dato <> v[medio].codigo) then begin
		if (dato < v[medio].codigo) then
			fin:= medio-1
		else
			ini:= medio+1;
		busquedaDicotomica(v,ini,fin,dato,pos);
	end;
	if (ini <= fin) and (dato = v[medio].codigo) then
		pos:= medio;
end;

procedure IncisoC (v:vector);
var
	ini,fin:rangoV;
	dato,pos:integer;
begin
	ini:=1;
	fin:=dimF;
	pos:=-1;
	write('Ingrese codigo a buscar: ');
	readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	if (pos <> -1) then writeln(v[pos].DNI)
	else writeln('El codigo buscado no existe');
end;

function SumarRecursivo(v:vector;dimL:integer):integer;
begin
	if (dimL <> 0) then
		SumarRecursivo := 0
	else
		SumarRecursivo := SumarRecursivo(v,dimL - 1) + v[dimL].valor;
end;

var 
	v:vector;
	dimL:integer;
BEGIN
	CargarVector(v,dimL);
	OrdenarVector(v,dimL);
	IncisoC(v);
	SumarRecursivo(v,dimL);
END.

