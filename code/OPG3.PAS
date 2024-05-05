Program Opg;

 Uses
   Crt;

 Const gr=5;

 Var
   o,p,s,q,i: Integer;
   Tal :ARRAY[1..gr] of integer;
   Ch : Char;

 Procedure Inddata;
   Begin (* Inddata *)
     ClrScr;
     GotoXY(25,5);
     Write('Summen af de ',gr,' heltal');
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
     s:=0;
     for i:=1 to gr do
      s := s +Tal[i];
   End; (* Beregning *)

 Procedure Uddata;
   Begin (* Uddata *)
     GotoXY(25,12);
     Write('Summen = ', s);
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