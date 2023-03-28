procedure OrdenarSeleccion (var v:vector;dimL:integer);
var
	i,p,j,aux:integer;
begin
	for i:=1 to dimL-1 do begin
		p:=i;
		for j:=i+1 to dimL do 
			if (v[j] < v[p]) then
				p:=j;
	aux := v[p];
	v[p] := v[i];
	v[i] := aux;	
	end;
end;

procedure OrdenarInsercion(var v:vector;dimL:integer);
var
	i,j,actual:integer;
begin
	actual:=0;
	for i:=2 to dimL do begin
		actual:=v[i];
		j := i-1;
		while ((j>0) and (v[j] > actual)) do begin
			v[j+1]:=v[j];
			j:=j-1;
		end;
		v[j+1]:=actual;
	end;
end;
