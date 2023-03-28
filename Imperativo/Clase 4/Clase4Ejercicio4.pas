program Clase4Ejercicio4;

const
	dimF=7;

type
	rangoDias=1..dimF;
	entrada=record
		dia:rangoDias;
		cod:integer;
		asiento:integer;
		monto:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:entrada;
		sig:lista;
	end;
	vector=array[rangoDias]of lista;

	entXobra=record
		cod:integer;
		cant:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		dato:entXobra;
		sig:lista2;
	end;

procedure LeerEntrada(var e:entrada);
begin
	write('Ingrese el codigo de obra: ');
	readln(e.cod);
	if (e.cod <> 0) then begin
		write('Ingrese el dia: ');
		e.dia := random(7) + 1;
		{write('Ingrese el asiento: ');
		readln(e.asiento);
		write('Ingrese el monto: ');
		readln(e.monto);}
	end;
end;

procedure InsertarOrdenado(var L:lista; e:entrada);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato:=e;
	act:=L;
	ant:=L;
	while ((act <> nil) and (act^.dato.cod <= e.cod)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		L := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
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
	e:entrada;
begin
	InicializarVector(v);
	LeerEntrada(e);
	while (e.cod <> 0) do begin
		InsertarOrdenado(v[e.dia],e);
		writeln;
		LeerEntrada(e);
	end;
end;

procedure AgregarAtras(var L,ULT:lista2;e:entXobra);
var
	nue:lista2;
begin
	new(nue);
	nue^.dato:=e;
	nue^.sig:=nil;
	if (L = nil) then
		L:=nue
	else
		ULT^.sig:=nue;
	ULT:=nue;
end;

procedure minimo(var v:vector; var min:entXobra);
var
	pos,i:integer;
begin
	min.cod := 31000;
	min.cant := 0;
	pos := -1;
	for i:=1 to dimF do begin
		if ((v[i] <> nil) and (v[i]^.dato.cod <= min.cod)) then begin
			pos := i;
			min.cod := v[i]^.dato.cod;
			min.cant := 1
		end;
	end;
	if (pos <> -1) then
		v[pos] := v[pos]^.sig;
end;

procedure MergeAcumulador(v:vector; var L:lista2);
var
	ult:lista2;
	min,actual:entXobra;
begin
	
	minimo(v,min);
	while (min.cod <> 31000) do begin
		actual.cod := min.cod;
		actual.cant := 0;
		while ((min.cod <> 31000) and (min.cod = actual.cod)) do begin
			actual.cant := actual.cant + min.cant;
			minimo(v,min);
		end;
		AgregarAtras(L,ult,actual);
	end;
end;

var
	v:vector;
	L:lista2;

BEGIN
	Randomize;
	GenerarVector(v);
	MergeAcumulador(v,L);
END.

