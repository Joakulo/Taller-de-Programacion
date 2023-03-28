{Escribir un programa que:	
a. Implemente un modulo que lea informacion de socios de un club y las almacene en un arbol binario de busqueda. De cada socio se lee numero de socio, 
nombre y edad. La lectura finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio.
b. Una vez generado el arbol, realice modulos independientes que reciban el arbol como parametro y: 
    i. Informe el numero de socio mas grande. Debe invocar a un modulo recursivo que retorne dicho valor. 
    ii. Informe los datos del socio con el numero de socio mas chico. Debe invocar a un modulo recursivo que retorne dicho socio. 
    iii. Informe el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor. 
    iv. Aumente en 1 la edad de todos los socios.
    v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el valor lei­do y
    retorne verdadero o falso.
    vi. Lea un nombre e informe si existe o no existe un socio con ese valor. Debe invocar a un modulo recursivo que reciba el nombre lei­do y 
    retorne verdadero o falso.
    vii. Informe la cantidad de socios. Debe invocar a un modulo recursivo que retorne dicha cantidad.
    viii. Informe el promedio de edad de los socios. Debe invocar a un modulo recursivo que retorne dicho promedio.
    ix. Informe, a partir de dos valores que se leen, la cantidad de socios en el arbol cuyo numero de socio se encuentra entre 
        los dos valores ingresados. Debe invocar a un modulo recursivo que reciba los dos valores leÃ­dos y retorne dicha cantidad. 
    x. Informe los numeros de socio en orden creciente. 
    xi. Informe los numeros de socio pares en orden decreciente. }

Program ImperativoClase3;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;

Procedure LeerSocio (var s: socio);
begin
	writeln ('Ingrese numero del socio: ');
	readln(s.numero);
	If (s.numero <> 0) then begin
		writeln ('Ingrese nombre del socio: ');
		readln(s.nombre);
		writeln ('Ingrese edad del socio: ');
		readln(s.edad);
	end;
end;  
  
Procedure InsertarElemento (var a: arbol; elem: socio);
Begin
	if (a = nil) then begin
		new(a);
        a^.dato:= elem; 
        a^.HI:= nil; 
        a^.HD:= nil;
    end else if (elem.numero < a^.dato.numero) then
		InsertarElemento(a^.HI, elem)
	else
		InsertarElemento(a^.HD, elem); 
End;
  
procedure GenerarArbol (var a: arbol);
var unSocio: socio;  
Begin
	a:= nil;
	LeerSocio (unSocio);
	while (unSocio.numero <> 0)do begin
		InsertarElemento (a, unSocio);
		writeln;
		LeerSocio (unSocio);
	end;
end;

function NumeroMasGrande (a: arbol): integer;
begin
	if (a = nil) then 
		NumeroMasGrande:= -1
	else if (a^.HD = nil) then 
		NumeroMasGrande:= a^.dato.numero
    else 
		NumeroMasGrande:= NumeroMasGrande (a^.HD);
end;

procedure InformarNumeroSocioMasGrande (a: arbol); 
var max: integer;
begin
	writeln;
	writeln ('----- Informar Numero Socio Mas Grande ----->');
	writeln;
	max:= NumeroMasGrande (a);
	if (max = -1) then
		writeln ('Arbol sin elementos')
	else begin
		writeln;
		writeln ('Numero de socio mas grande: ', max);
		writeln;
	end;
end;

function SocioMasChico (a: arbol): arbol;
begin
	if ((a = nil) or (a^.HI = nil)) then
		SocioMasChico:= a
	else 
		SocioMasChico:= SocioMasChico (a^.HI);
end;

procedure InformarDatosSocioNumeroMasChico (a: arbol);
var minSocio: arbol;
begin
	writeln;
	writeln ('----- Informar Datos Socio Numero Mas Chico ----->');
	writeln;
	minSocio:= SocioMasChico (a);
	if (minSocio = nil) then 
		writeln ('Arbol sin elementos')
	else begin
		writeln;
        writeln ('Socio con numero mas chico: ', minSocio^.dato.numero, ' Nombre: ', minSocio^.dato.nombre, ' Edad: ', minSocio^.dato.edad); 
        writeln;
    end;
end;

procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
begin
  if (nuevoValor >= maxValor) then
  begin
	  maxValor := nuevoValor;
	  maxElem := nuevoElem;
  end;
end;
	
procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
begin
   if (a <> nil) then
   begin
	   actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
	   numeroMasEdad(a^.hi, maxEdad,maxNum);
	   numeroMasEdad(a^.hd, maxEdad,maxNum);
   end; 
end;

procedure InformarNumeroSocioConMasEdad (a: arbol);
var maxEdad, maxNum: integer;
begin
	maxEdad := -1;
	maxNum := -1;
	writeln;
	writeln ('----- Informar Numero Socio Con Mas Edad ----->');
	writeln;
	NumeroMasEdad (a, maxEdad, maxNum);
	if (maxEdad = -1) then 
		writeln ('Arbol sin elementos')
	else begin
		writeln;
        writeln ('Numero de socio con mas edad: ', maxNum);
        writeln;
    end;
end;

procedure AumentarEdad (a: arbol);
begin
	if (a <> nil) then begin
        a^.dato.edad:= a^.dato.edad + 1;
        AumentarEdad (a^.HI);
        AumentarEdad (a^.HD);
    end;
end;
     
function Buscar (a: arbol; num: integer): boolean;
begin
	if (a = nil) then 
		Buscar:= false
    else If (a^.dato.numero = num) then 
		Buscar:= true
    else if (num < a^.dato.numero) then 
		Buscar:= Buscar (a^.HI, num)
    else 
		Buscar:= Buscar (a^.HD, num);
end;
 
procedure InformarExistenciaNumeroSocio (a: arbol);
var numABuscar: integer;
begin
	writeln;
	writeln ('----- Informar Existencia Numero Socio ----->');
	writeln;
	write ('Ingrese numero de socio a buscar: ');
	Readln (numABuscar);
	writeln;
	if (Buscar (a, numABuscar)) then
		writeln ('El numero ', numABuscar, ' existe')
	else 
		writeln ('El numero ', numABuscar, ' no existe');
	writeln;
end;

function BuscarNom (a: arbol; nom: string): boolean;
begin
	if (a = nil) then 
		BuscarNom:= false
    else If (nom = a^.dato.nombre) then 
		BuscarNom:= true
    else
		BuscarNom:= BuscarNom (a^.HI, nom) or BuscarNom (a^.HD, nom);
end;

procedure InformarExistenciaNombreSocio (a:arbol);
var 
	nomABuscar:string;
begin
	writeln;
	writeln ('----- Informar Existencia Nombre Socio ----->');
	writeln;
	write ('Ingrese nombre de socio a buscar: ');
	Readln (nomABuscar);
	writeln;
	if (BuscarNom (a, nomABuscar)) then
		writeln ('El nombre ', nomABuscar, ' existe')
	else 
		writeln ('El nombre ', nomABuscar, ' no existe');
	writeln;
end;

procedure contar(a:arbol;var cant:integer);
begin
	if (a <> nil) then begin
		cant := cant + 1;
		contar(a^.HI,cant);
		contar(a^.HD,cant);
	end;
end;

procedure InformarCantidadSocios (a:arbol);
var
	cant:integer;
begin
	cant := 0;
	contar(a,cant);
	writeln('----- Cantidad de Socios ----->');
	writeln();
	writeln(cant);
	writeln();
end;

procedure contarEdad(a:arbol;var cant,prom:integer);
begin
	if (a <> nil) then begin
		cant := cant + 1;
		prom := prom + a^.dato.edad;
		contarEdad(a^.HI,cant,prom);
		contarEdad(a^.HD,cant,prom);
	end;
end;

procedure InformarPromedioDeEdad(a:arbol);
var
	cant,prom:integer;
begin
	cant:=0;
	prom:=0;
	contarEdad(a,cant,prom);
	writeln('----- Promedio de Edad ----->');
	writeln();
	writeln(prom / cant:2:1);
	writeln();
end;

procedure contarRango(a:arbol; vMenor,vMayor:integer; var cant:integer);
begin
	if (a <> nil) then begin
		if ((a^.dato.numero >= vMenor) and (a^.dato.numero <= vMayor)) then
			cant := cant+1;
		if (a^.dato.numero > vMenor) then
			contarRango(a^.HI,vMenor,vMayor,cant);
		if (a^.dato.numero < vMayor) then
			contarRango(a^.HD,vMenor,vMayor,cant);
	end;
end;

procedure InformarCantidadSociosEnRango(a:arbol);
var
	vMenor, vMayor, cant : integer;
begin
	cant:=0;
	writeln('----- Cantidad Socios En Rango ----->');
	writeln;
	write('Ingrese el valor menor: ');
	readln(vMenor);
	write('Ingrese el valor mayor: ');
	readln(vMayor);
	contarRango(a,vMenor,vMayor,cant);
	writeln('Cantidad de socios dentro del rango: ', cant);
end;

procedure InformarNumerosSociosOrdenCreciente(a:arbol);
begin
	if (a <> nil) then begin
		InformarNumerosSociosOrdenCreciente(a^.HI);
		writeln(a^.dato.numero);
		InformarNumerosSociosOrdenCreciente(a^.HD);
	end;
end;

procedure InformarNumerosSociosOrdenDeCreciente(a:arbol);
begin
	if (a <> nil) then begin
		InformarNumerosSociosOrdenDeCreciente(a^.HD);
		writeln(a^.dato.numero);
		InformarNumerosSociosOrdenDeCreciente(a^.HI);
	end;
end;

var a: arbol; 
Begin
	Randomize;
	GenerarArbol (a);
	InformarNumeroSocioMasGrande (a);
	InformarDatosSocioNumeroMasChico (a);
	InformarNumeroSocioConMasEdad (a);
	AumentarEdad (a);
	InformarExistenciaNumeroSocio (a);
	InformarExistenciaNombreSocio (a);
	InformarCantidadSocios (a);
	InformarPromedioDeEdad (a);
	InformarCantidadSociosEnRango (a);
	writeln('----- Informar Numeros de Socio Orden Creciente ----->');
	InformarNumerosSociosOrdenCreciente (a);
	writeln('----- Informar Numeros de Socio Orden Decreciente ----->');
	InformarNumerosSociosOrdenDeCreciente (a);   
  readln;
End.
