program Clase3Ejercicio3;

type
	alumno=record
		legajo:integer;
		DNI:integer;
		ingreso:integer;
	end;

	arbol=^nodo;
	nodo=record
		dato:alumno;
		HI:arbol;
		HD:arbol;
	end;

procedure LeerAlumno(var al:alumno);
begin
	write('Ingrese Legajo: ');
	readln(al.legajo);
	if (al.legajo <> 0) then begin
		write('Ingrese DNI: ');
		readln(al.DNI);
		write('Ingrese anio de ingreso: ');
		readln(al.ingreso);
	end;
end;

procedure InsertarElemento(var a:arbol; al:alumno);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := al;
		a^.HI := nil;
		a^.HD := nil;
	end else if (a^.dato.legajo > al.legajo) then
		InsertarElemento(a^.HI,al)
	else
		InsertarElemento(a^.HD,al);
end;

procedure GenerarArbol(var a:arbol);
var
	al:alumno;
begin
	LeerAlumno(al);
	while (al.legajo > 0) do begin
		if (al.ingreso > 0) then
			InsertarElemento(a,al);
		writeln;
		LeerAlumno(al);
	end;
end;

procedure IncisoB (a:arbol;num:integer);
begin
	if (a <> nil) then begin
		IncisoB(a^.HI,num);
		if (a^.dato.legajo < num) then begin
			write(a^.dato.legajo,' | ');
			IncisoB(a^.HD,num);
		end;
	end;
end;

procedure IncisoC (a:arbol; menor,mayor:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.legajo > menor) then
			IncisoC(a^.HI,menor,mayor);
		if ((a^.dato.legajo > menor) and (a^.dato.legajo < mayor)) then
			write(a^.dato.legajo,' | ');
		if (a^.dato.legajo < mayor) then
			IncisoC(a^.HD,menor,mayor);
		
	end;
end;

function IncisoD (a:arbol):integer;
begin
    if ( a^.HD <> nil ) then begin
        IncisoD := IncisoD(a^.HD);
    end
    else
        IncisoD := a^.dato.legajo;
end;

procedure IncisoE(a:arbol;var cant:integer);
begin
	if (a <> nil) then begin
		IncisoE(a^.HI, cant);
		if (a^.dato.legajo MOD 2 = 1) then begin
			write(a^.dato.legajo, ' | ');
			cant := cant + 1;
		end;
		IncisoE(a^.HD, cant);
	end;
end;

procedure Imprimir(a:arbol);
begin
	if (a <> nil) then begin
		Imprimir(a^.HI);
		write(a^.dato.legajo, ' | ');
		Imprimir(a^.HD);
	end;
end;



var
	a:arbol;
	cant:integer;
BEGIN
	Randomize;
	GenerarArbol(a);
	Imprimir(a);
	writeln;
	IncisoB(a,5);
	writeln;
	IncisoC(a,3,8);
	writeln;
	writeln(IncisoD(a));
	writeln;
	IncisoE(a, cant);
	writeln;
	writeln(cant);
END.

