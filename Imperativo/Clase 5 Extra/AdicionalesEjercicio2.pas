program AdicionalesEjercicio2;

const
	dimF=2018;

type
	rangoF=2010..dimF;
	patentes=string[7];
	
	autos=record
		patente:patentes;
		anioF:rangoF;
		marca:string[50];
		modelo:string[50];
	end;
	
	arbol=^nodo;
	nodo=record
		dato:autos;
		HI:arbol;
		HD:arbol;
	end;

	lista=^nodo2;
	nodo2=record
		dato:autos;
		sig:lista;
	end;
	vector=array[rangoF] of lista;


procedure LeerAuto(var a:autos);
begin
	write('Ingrese la patente: ');
	readln(a.patente);
	if (a.patente <> 'zzz') then begin
		write('Ingrese el anio de fabricacion: ');
		readln(a.anioF);
		write('Ingrese la marca: ');
		readln(a.marca);
		write('Ingrese el modelo: ');
		readln(a.modelo);
		writeln;
	end;
end;

procedure InsertarElemento(var a:arbol;au:autos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := au;
		a^.HI := nil;
		a^.HD := nil;
	end else if (a^.dato.patente > au.patente) then
		InsertarElemento(a^.HI,au)
	else
		InsertarElemento(a^.HD,au);
end;

procedure GenerarArbol(var a:arbol);
var
	au:autos;
begin
	LeerAuto(au);
	while (au.patente <> 'zzz') do begin
		InsertarElemento(a,au);
		LeerAuto(au);
	end;
end;

function CantMarcas (a:arbol;m:string):integer;
begin
	if (a = nil) then
		CantMarcas:=0
	else if (a^.dato.marca = m) then
		CantMarcas := CantMarcas(a^.HI,m) + CantMarcas(a^.HD,m) + 1
	else
		CantMarcas := CantMarcas(a^.HI,m) + CantMarcas(a^.HD,m);
end;

procedure IncisoB(a:arbol);
var
	m:string;
begin
	write('Ingrese una marca: ');
	readln(m);
	writeln(CantMarcas(a,m));
end;

procedure InicializarVector(var v:vector);
var
	i:integer;
begin
	 for i:=2010 to dimF do
		v[i]:= nil;
end;

procedure AgregarAdelante(a:autos;var l:lista);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=a;
	nue^.sig:=l;
	l:=nue;
end;

procedure IncisoC(a:arbol; var v:vector);
begin
	if (a <> nil) then begin
		IncisoC(a^.HI,v);
		IncisoC(a^.HD,v);
		AgregarAdelante(a^.dato,v[a^.dato.anioF]);
	end;
end;

procedure BuscarPatente (a:arbol;p:string);
begin
	if (a <> nil) then begin
		if (a^.dato.patente = p) then
			writeln(a^.dato.anioF)
		else if (a^.dato.patente > p) then
			BuscarPatente(a^.HI,p)
		else
			BuscarPatente(a^.HD,p);
	end;
end;

procedure IncisoD(a:arbol);
var
	p:patentes;
begin
	write('Ingrese una patente a buscar: ');
	readln(p);
	BuscarPatente(a,p);
end;

var
	a:arbol;
	v:vector;

BEGIN
	GenerarArbol(a);
	InicializarVector(v);
	IncisoB(a);
	IncisoC(a,v);
	IncisoD(a);
END.

