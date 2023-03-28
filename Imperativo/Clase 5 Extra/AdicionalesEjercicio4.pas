program AdicionalesEjercicio4;

const
	dimF = 7;

type
	rangoD=1..dimF;
	entrada=record
		dia:rangoD;
		codigo:integer;
		asiento:integer;
		monto:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:entrada;
		sig:lista;
	end;
	vector=array[rangoD] of lista;
	
	entradasB=record
		codigo:integer;
		cant:integer;
	end;
	lista2=^nodo2;
	nodo2=record
		dato:entradasB;
		sig:lista2;
	end;

procedure InicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i]:=nil;
end;

procedure LeerEntrada(var e:entrada);
begin
	write('Ingrese el codigo de la obra: ');
	readln(e.codigo);
	if (e.codigo <> 0) then begin
		write('Ingrese el dia de la obra: ');
		readln(e.dia);
		write('Ingrese el numero de asiento: ');
		readln(e.asiento);
		write('Ingrese el monto: ');
		readln(e.monto);
	end;
end;

procedure InsertarOrdenado(var L:lista;e:entrada);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato := e;
	act := L;
	ant := L;
	while ((act <> nil) and (act^.dato.codigo < e.codigo)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		L := nue
	else
		ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure GenerarVector(var v:vector);
var
	e:entrada;
begin
	InicializarVector(v);
	LeerEntrada(e);
	if (e.codigo <> 0) then begin
		InsertarOrdenado(v[e.dia],e);
		LeerEntrada(e);
	end;
end;

procedure AgregarAtras(var L,ULT:lista2;min:entradasB);
var
	nue:lista2;
begin
	if (ULT^.dato.codigo = min.codigo) then
		ULT^.dato.cant := ULT^.dato.cant + 1
	else begin
		new(nue);
		nue^.dato:=min;
		nue^.sig:=nil;
		if (L = nil) then
			L:=nue
		else
			ULT^.sig := nue;
	ULT := nue;
	end;
end;

procedure Minimo(var v:vector; var min:entradasB);
var
   pos, i : integer;
begin
	min.codigo := 9999;
	pos := -1;
	for i:= 1 to dimF do					
		if (v[i] <> nil) and (v[i]^.dato.codigo <= min.codigo) then begin
			min.codigo := v[i]^.dato.codigo;
			min.cant := 1;
			pos := i;	
		end;
	if (pos <> -1) then  
		v[pos] := v[pos]^.sig;
end;

procedure Merge(v:vector; var  l:lista2);
var
   min : entradasB;
   ult : lista2;
begin
	minimo(v,min);
	while (min.codigo <> 9999) do begin
		AgregarAtras(l,ult,min);
		minimo(v,min);
	end;
end;

procedure ImprimirRecursivo(L:lista2);
begin
	if (L <> nil) then begin
		ImprimirRecursivo(L^.sig);
		writeln(L^.dato.codigo);
		writeln(L^.dato.cant);
	end;
end;

var
	v:vector;
	L:lista2;

BEGIN
	GenerarVector(v);
	Merge(v,L);
	ImprimirRecursivo(L);
END.

