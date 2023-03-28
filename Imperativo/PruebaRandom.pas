program untitled;

var
	i, num:integer;

BEGIN
	Randomize;
	for i:=1 to 50 do begin
		num := random(10) + 1;
		writeln(num);
	end;
END.

