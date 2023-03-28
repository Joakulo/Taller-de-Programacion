program untitled;

const
	dimF=8

type
	productos=record
		codigoP:integer;
		codigoR:1..dimF;
		precio:integer;
	end;

	lista=^nodo;
	nodo=record
		dato:productos;
		sig:lista;
	end;
	vector=array[1..dimF] of lista

var

BEGIN
	
	
END.

