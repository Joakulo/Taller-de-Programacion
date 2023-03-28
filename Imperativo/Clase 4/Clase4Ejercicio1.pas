program Clase4Ejercicio1;

const
	dimF=12;
type
	meses=1..dimF;
	prestamo=record
		ISBN:integer;
		numS:integer;
		dia:1..31;
		mes:meses;
	end;
	lista=^nodo;
	nodo=record
		dato:prestamo;
		sig:lista;
	end;
	vector=array[meses]of lista;
	
	ISBNs=record
		ISBN:integer;
		cant:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		dato:ISBNs;
		sig:lista2;
	end;

procedure LeerPrestamo(var p:prestamo);
begin
	write('Ingrese el ISBN: ');
	readln(p.ISBN);
	if (p.ISBN <> -1) then begin
		write('Ingrese el Numero de Socio: ');
		readln(p.numS);
		write('Ingrese el dia: ');
		readln(p.dia);
		write('Ingrese el mes: ');
		readln(p.mes);
	end;
end;

procedure InsertarElemento(var L:lista; p:prestamo);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	act:=L;
	ant:=L;
	while ((act <> nil) and (act^.dato.ISBN < p.ISBN)) do begin
		ant:=act;
		act:=act^.sig;
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
	p:prestamo;
begin
	InicializarVector(v);
	LeerPrestamo(p);
	while (p.ISBN <> -1) do begin
		InsertarElemento(v[p.mes],p);
		LeerPrestamo(p);
	end;
end;

procedure ImprimirRecursivo(L:lista);
begin
	if (L <> nil) then begin
		writeln(L^.dato.ISBN);
		writeln(L^.dato.numS);
		ImprimirRecursivo(L^.sig);
	end;
end;

procedure IncisoB (v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		writeln('Mes N°',i);
		ImprimirRecursivo(v[i]);
		writeln;
end;

procedure AgregarAtras (var L,ULT:lista;p:prestamo);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=nil;
	if (L = nil) then
		L := nue
	else
		ult^.sig:=nue;
	ULT := nue;
end;

procedure minimo (var v:vector; var min:prestamo);
var
	pos,i:integer;
begin
	min.ISBN := 9999;
	pos:=-1;
	for i:= 1 to dimF do
		if ((v[i] <> nil) and (v[i]^.dato.ISBN <= min.ISBN)) then begin
			min:= v[i]^.dato;
			pos := i;
		end;
	if (pos <> -1) then
		v[pos] := v[pos]^.sig;
end;

procedure Merge (v:vector; var L:lista);
var
	min:prestamo;
	ult:lista;
begin
	minimo(v,min);
	while (min.ISBN <> -1) do begin
		AgregarAtras(l,ult,min);
		minimo(v,min);
	end;
end;

procedure IncisoD(L:lista);
begin
	if (L <> nil) then begin
		write(L^.dato.ISBN,' ',L^.dato.numS,' | ');
		IncisoD(L^.sig);
	end;
end;

procedure AgregarISBN(var L,ULT:lista2;ISBN:ISBNs);
var
	nue:lista2;
begin
	new(nue);
	nue^.dato := ISBN;
	nue^.sig:=nil;
	if (L = nil) then
		L := nue
	else
		ULT^.sig:=nue;
	ULT := nue;
end;

procedure minimoE(var v:vector;var min:integer);
var
	pos,i:integer;
begin
	min:=9999;
	pos:=-1;
	for i:=1 to dimF do
		if ((v[i]<>nil) and (v[i]^.dato.ISBN <= min)) then begin
			min := v[i]^.dato.ISBN;
			pos := i;
		end;
	if (pos <> -1) then
		v[pos] := v[pos]^.sig;
end;

procedure IncisoE(v:vector;var L:lista2);
var
	min,actual:ISBNs;
	ult:lista2;
begin
	minimoE(v,min.ISBN);
	while (min.ISBN <> 9999) do begin
		actual.ISBN := min.ISBN;
		actual.cant := 0;
		while ((min.ISBN <> 9999) and (min.ISBN = actual.ISBN)) do begin
			actual.cant := actual.cant + 1;
			minimoE(v,min.ISBN);
		end;
		AgregarISBN(L,ULT,min);
	end;
end;

var
	v:vector;
	L:lista;
	L2:lista2;

BEGIN
	GenerarVector(v);
	IncisoB(v);
	Merge(v,L);
	IncisoD(L);
	IncisoE(v,L2);
END.

