program Clase3Ejercicio2;

type
	ventas=record
		codigo:integer;
		fecha:integer;
		cant:integer;
	end;
	
	arbol=^nodo;
	nodo=record
		dato:ventas;
		HI:arbol;
		HD:arbol;
	end;

procedure LeerVenta(var v:ventas);
begin
	write ('Ingrese codigo de venta: ');
	readln(v.codigo);
	if (v.codigo <> 0) then begin
		write('Ingrese fecha de venta: ');
		readln(v.fecha);
		write('Ingrese cantidad de unidades vendidas: ');
		readln(v.cant);
	end;
end;

procedure InsertarElemento(var a:arbol; v:ventas);
begin
	if (a=nil) then begin
		new(a);
		a^.dato:=v;
		a^.HI:=nil;
		a^.HD:=nil;
	end else if (v.codigo < a^.dato.codigo) then
		InsertarElemento(a^.HI,v)
	else
		InsertarElemento(a^.HD,v);
end;

procedure GenerarArbol(var a:arbol);
var
	v:ventas;
begin
	a:=nil;
	LeerVenta(v);
	while (v.codigo <> 0) do begin
		InsertarElemento(a,v);
		writeln;
		LeerVenta(v);
	end;
end;

Procedure InsertarElemento2 (var a: arbol; v:ventas);
Begin
	if (a = nil) then begin
		new(a);
        a^.dato:= v; 
        a^.HI:= nil; 
        a^.HD:= nil;
    end else if (v.codigo < a^.dato.codigo) then
		InsertarElemento(a^.HI, v)
	else if (v.codigo > a^.dato.codigo) then
		InsertarElemento(a^.HD, v) 
	else
		a^.dato.cant := a^.dato.cant + v.cant;
End;

procedure Generar2doArbol(a:arbol; var a2:arbol);
begin
	if (a <> nil) then begin
		InsertarElemento2(a2,a^.dato);
		Generar2doArbol(a^.HI, a2);
		Generar2doArbol(a^.HD, a2);
	end;
end;

Procedure Imprimir ( a : arbol );
begin 
    if ( a <> nil ) then begin
        Imprimir (a^.HI);
        write (a^.dato.codigo,'|');
        Imprimir (a^.HD);
    end;
end;

var
	a, a2:arbol;

BEGIN
	Randomize;
	GenerarArbol(a);
	writeln(a^.dato.codigo);
	a2:=nil;
	Generar2doArbol(a,a2);
	writeln('a');
	Imprimir(a);
	writeln('a');
	writeln;
	Imprimir(a2);
	writeln('a');
END.

