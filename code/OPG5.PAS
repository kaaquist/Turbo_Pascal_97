Program Opg;

 Uses
   Crt;

 Const gr=10;

 Var
   s: String;
   i: Integer;
   Tal :ARRAY[1..gr] of Char;
   Ch : Char;

 Procedure Inddata;
   Begin (* Inddata *)
     ClrScr;
     GotoXY(25,5);
     Write('Navn      :POPPEYE');
     GotoXY(25,6);
     Write('อออออออออออออออออออ');

     for i:=1 to gr do
     begin
       GotoXY(25,7);
       Write('Indtast tal nr.',i,': ' );
       Write('               ');GotoXY(44,7);
       ReadLn(Tal[i]);
     end;

   End; (* Inddata *)

 Procedure Beregning;
   Begin (* Beregning *)
     for i:=1 to gr do
      s := s+Tal[i];
   End; (* Beregning *)

 Procedure Uddata;
   Begin (* Uddata *)
     GotoXY(25,12);
     Write('Navn: ', s);
   End; (* Uddata *)

 Begin (* Opg *)
   Repeat
     Inddata;
     Beregning;
     Uddata;
     GotoXY(25,20);
     Write(' Vil du fors‘tte (j/n): ');
     Ch := Readkey;
   Until (Ch<> 'j') And (Ch<> 'J');
 End. (* Opg *)