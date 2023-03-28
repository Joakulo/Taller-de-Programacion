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

Procedure InsertarElemento2 (var a:arbol; v:ventas);
Begin
	if (a = nil) then begin
		new(a);
        a^.dato:= v; 
        a^.HI:= nil; 
        a^.HD:= nil;
    end else if (v.codigo < a^.dato.codigo) then
		InsertarElemento2(a^.HI,v)
	else if (v.codigo > a^.dato.codigo) then
		InsertarElemento2(a^.HD, v) 
	else
		a^.dato.cant := a^.dato.cant + v.cant;
End;

procedure GenerarArboles(var a,a2:arbol);
var
	v:ventas;
begin
	a:=nil;
	LeerVenta(v);
	while (v.codigo <> 0) do begin
		InsertarElemento(a,v);
		InsertarElemento2(a2,v);
		writeln;
		LeerVenta(v);
	end;
end;

Procedure Imprimir ( a : arbol );
begin 
    if ( a <> nil ) then begin
        Imprimir (a^.HI);
        write (a^.dato.cant,'|');
        Imprimir (a^.HD);
    end;
end;

procedure ContarVentas(a:arbol; var cant:integer;codigo:integer);
begin
	if (a <> nil) then begin
		ContarVentas(a^.HI,cant,codigo);
		if (a^.dato.codigo = codigo) then
			cant := cant + a^.dato.cant;
		ContarVentas(a^.HD,cant,codigo);
	end;
end;

procedure ContarVentas2(a:arbol;var cant:integer;codigo:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.codigo > codigo) then
			ContarVentas2(a^.HI,cant,codigo)
		else
		if (a^.dato.codigo < codigo) then
			ContarVentas2(a^.HD,cant,codigo)
		else
		cant := cant + a^.dato.cant; 	
	end;
end;

var
	a, a2:arbol;
	cant1,cant2:integer;
BEGIN
	cant1 := 0;
	cant2 := 0;
	Randomize;
	GenerarArboles(a,a2);
	writeln;
	Imprimir(a);
	writeln;
	Imprimir(a2);
	writeln;
	ContarVentas(a,cant1,5);
	writeln(cant1);
	ContarVentas2(a2,cant2,5);
	writeln(cant2);
END.

