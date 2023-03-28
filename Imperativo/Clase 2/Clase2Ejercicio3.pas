program Clase2Ejercicio3;

type
	lista=^nodo;
	nodo=record
		dato:integer;
		sig:lista;
	end;

procedure agregarAtras(var L,ULT:lista;num:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=num;
	nue^.sig:=nil;
	if (L = nil) then
		L:=nue
	else
		ULT^.sig:=nue;
	ULT:=nue;
end;

procedure cargarLista(var L,ULT:lista);
var
	num:integer;
begin
	num := random(100);
	if (num <> 0) then begin
		agregarAtras(L,ULT,num);
		cargarLista(L,ULT);
	end;
end;

procedure minimo(L:lista;var min:integer);
begin
	if (L <> nil) then begin
		minimo(L^.sig,min);
		if (L^.dato < min) then
			min := L^.dato;
	end;
end;

procedure maximo(L:lista;var max:integer);
begin
	if (L <> nil) then begin
		maximo(L^.sig,max);
		if (L^.dato > max) then
			max := L^.dato;
	end;
end;

procedure busqueda(L:lista;var ok:boolean;num:integer);
begin
	if ((L <> nil) and (not ok)) then begin
		ok := num = L^.dato;
		busqueda(L^.sig,ok,num);
	end;
end;

procedure imprimir(L:lista);
begin
	while (L <> nil) do begin
		writeln(L^.dato);
		L:=L^.sig;
	end;
end;

procedure IncisosByC(L:lista);
var
	min,max:integer;
begin
	min:= 100;
	max:= 0;
	minimo(L,min);
	maximo(L,max);
	writeln(min, ' ',max);
	writeln;
end;

procedure IncisoD(L:lista);
var
	ok:boolean;
	num:integer;
begin
	ok:=false;
	writeln('Ingrese un numero a buscar');
	readln(num);
	busqueda(L,ok,num);
	if (ok) then
		writeln('Se encontro')
	else
		writeln('No se encuentra');
end;

var
	L,ULT:lista;
BEGIN
	Randomize;
	cargarLista(L,ULT);
	imprimir(L);
	IncisosByC(L);
	IncisoD(L);
END.

