program Clase2Ejercicio2;

procedure imprimir(num:integer);
begin
	if (num DIV 10 <> 0) then
		imprimir(num DIV 10);
		writeln(num MOD 10);
end;

var
	num:integer;
BEGIN
	readln(num);
	imprimir(num);
END.

