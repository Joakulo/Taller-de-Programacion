program Clase4Ejercicio3;

const
	dimF=4;

type
	rangoS=1..dimF;
	venta=record
		fecha:integer;
		codigoP:integer;
		codigoS:0..dimF;
		cant:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:venta;
		sig:lista;
	end;
	vector=array[rangoS]of lista;

	ventXcodigo=record
		codigo:integer;
		cant:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		dato:ventXcodigo;
		sig:lista2;
	end;

procedure LeerVenta(var v:venta);
begin
	write('Ingrese el codigo de sucursal: ');
	readln(v.codigoS);
	if (v.codigoS <> 0) then begin
		write('Ingrese la fecha de venta: ');
		readln(v.fecha);
		write('Ingrese el codigo del producto: ');
		readln(v.codigoP);
		write('Ingrese la cantidad vendida: ');
		readln(v.cant);
	end;
end;

procedure InsertarOrdenado(var L:lista; v:venta);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato:=v;
	act:=L;
	ant:=L;
	while ((act <> nil) and (act^.dato.codigoP <= v.codigoP)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (L = nil) then
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
		v[i]:=nil;
end;

procedure GenerarVector(var v:vector);
var
	vent:venta;
begin
	InicializarVector(v);
	LeerVenta(vent);
	while (vent.codigoS <> 0) do begin
		InsertarOrdenado(v[vent.codigoS],vent);
		LeerVenta(vent);
	end;
end;

procedure AgregarAtras(var L,ULT:lista2; v:ventXcodigo);
var
	nue:lista2;
begin
	new(nue);
	nue^.dato:=v;
	nue^.sig:=nil;
	if (L = nil) then
		L:=nue
	else
		ULT^.sig:=nue;
	ULT:=nue;
end;

procedure minimo(var v:vector; var min:ventXcodigo);
var
	pos,i:integer;
begin
	min.codigo:=30000;
	pos:=-1;
	for i:=1 to dimF do begin
		if ((v[i]<>nil) and (v[i]^.dato.codigoP < min.codigo)) then begin
			pos := i;
			min.codigo := v[i]^.dato.codigoP;
			min.cant := v[i]^.dato.cant;
		end;
	end;
	if (pos <> -1) then
		v[pos] := v[pos]^.sig;
end;

procedure MergeAcumulador(v:vector; var L:lista2);
var
	Ult:lista2;
	min,actual:ventXcodigo;
begin
	minimo(v,min);
	while (min.codigo <> 30000) do begin
		actual.codigo := min.codigo;
		actual.cant := 0;
		while ((min.codigo <> 30000) and (actual.codigo = min.codigo)) do begin
			actual.cant:=actual.cant+min.cant;
			minimo(v,min);
		end;
		AgregarAtras(L,ULT,actual);
	end;
end;

var
	v:vector;
	L:lista2;
BEGIN
	GenerarVector(v);
	MergeAcumulador(v,L);
END.

