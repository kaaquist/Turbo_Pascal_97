Program Ombyt;

Uses Crt;
Const gr= 10;
Var
	Tal: Array[1..gr] of Integer;
	s, i, m, k : Integer ;
	Ch: Char;

Procedure Inddata;
	Begin (* Inddata *) 
		ClrScr ;
		Write( 'Skriv',gr,' tal');
		for i:= 1 to gr Do
			Begin
			Write('Indtast tal nr. ',i,': ');
			ReadLn (Tal[i]);
			End;
	End; (* Inddata *)

Procedure Beregning;
	Begin (* Beregning *)
		for k:= 1 to gr Do
			for i:= 1 to gr Do
			If  Tal[i]>Tal[i+1] Then
				Begin

				s:=Tal[i];
				Tal[i]:=Tal[i+1];
        Tal[i+1]:=s;

				End;
	End; (* Beregning *)

Procedure Uddata;
	Begin (* Uddata *)
		for i:= 1 to gr Do
		Write (Tal[i],' ');
	End; (* Uddata *)

Begin
	Repeat
	Inddata;
	Beregning;
	Uddata;
	Write (' vil du fors‘tte (j/n): ');
	Ch := Readkey;
	Until (Ch<>'j') And (Ch<>'J');
End.