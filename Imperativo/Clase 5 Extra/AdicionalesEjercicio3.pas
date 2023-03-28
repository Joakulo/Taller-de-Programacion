program AdicionalesEjercicio3;

const
	dimF = 10;

type
	rangoR=1..dimF;

	productos=record
		codigo:integer;
		rubro:rangoR;
		stock:integer;
		precio:real;
	end;

	arbol=^nodo;
	nodo=record
		dato:productos;
		HI:arbol;
		HD:arbol;
	end;

	vector=array[rangoR] of arbol;

	c=record
		Ccodigo:integer;
		Cstock:integer;
	end;
	Cvector=array[rangoR] of c;

	Dvector=array[rangoR] of integer;
	
procedure InicializarVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i] := nil;
end;

procedure LeerProducto(var p:productos);
begin
	write('Ingrese el codigo: ');
	readln(p.codigo);
	if (p.codigo <> -1) then begin
		write('Ingrese el rubro (1..10): ');
		readln(p.rubro);
		write('Ingrese el stock: ');
		readln(p.stock);
		write('Ingrese el precio: ');
		readln(p.precio);
	end;
end;

procedure InsertarElemento(var a:arbol; p:productos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato:=p;
		a^.HI:=nil;
		a^.HD:=nil;
	end else if (a^.dato.codigo > p.codigo) then
		InsertarElemento(a^.HI,p)
	else
		InsertarElemento(a^.HI,p);
end;

procedure GenerarVector(var v:vector);
var
	p:productos;
begin
	InicializarVector(v);
	LeerProducto(p);
	while (p.codigo <> -1) do begin
		InsertarElemento(v[p.rubro],p);
		LeerProducto(p);
	end;
end;

procedure BuscarCodigo(a:arbol;c:integer; var ok:boolean);
begin
	if ((a <> nil) and (not ok)) then begin
		if (a^.dato.codigo = c) then
			ok := true
		else if (a^.dato.codigo > c) then
			BuscarCodigo(a^.HI,c,ok)
		else
			BuscarCodigo(a^.HD,c,ok);
	end;
end;

procedure IncisoB(v:vector);
var
	r:rangoR;
	c:integer;
	ok:boolean;
begin
	write('Ingrese un rubro: ');
	readln(r);
	write('Ingrese un codigo a buscar: ');
	readln(c);
	ok:=false;
	BuscarCodigo(v[r],c,ok);
	if (ok) then 
		writeln('El codigo ',c,' se encuentra en el rubro ',r)
	else
		writeln('El codigo ',c,' no se encuentra en el rubro ',r);
end;

procedure BuscarMaximo(a:arbol; var c:c);
begin
	if (a^.HD <> nil) then
		BuscarMaximo(a^.HD,c)
	else begin
		c.Ccodigo := a^.dato.codigo;
		c.Cstock := a^.dato.stock;
	end;
end;

procedure IncisoC(v:vector;var Cv:Cvector);
var
	i:integer;
begin
	for i:=1 to dimF do begin
		BuscarMaximo(v[i],Cv[i]);
	end;
end;

procedure ContarProductos (a:arbol; var cant:integer; min,max:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.codigo > min) then
			ContarProductos(a^.HI,cant,min,max);
		if (a^.dato.codigo < max) then
			ContarProductos(a^.HD,cant,min,max);
		if ((a^.dato.codigo > min) and (a^.dato.codigo < max)) then
			cant := cant + 1;
	end;
end;

procedure IncisoD(v:vector; var Dv:Dvector);
var
	Cmin, Cmax, i:integer;
begin
	write('Ingrese el codigo Minimo: ');
	readln(Cmin);
	write('Ingrese el codigo Maximo: ');
	readln(Cmax);
	for i:=1 to dimF do
		ContarProductos(v[i],Dv[i],Cmin,Cmax);
end;

var
	v:vector;
	Cv:Cvector;
	Dv:Dvector;
	
BEGIN
	GenerarVector(v);
	IncisoB(v);
	IncisoC(v,Cv);
	IncisoD(v,Dv);
END.

