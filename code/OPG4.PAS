Program Opg;

 Uses
   Crt;

 Var
   o,p,s: String;
   Ch   : Char

 Procedure Inddata;
   Begin (* Inddata *)
     ClrScr;
     GotoXY(25,5);
     Write('Navn');
     GotoXY(25,6);
     Write('อออออออออออออออออออ');
     GotoXY(25,7);
     Write('Indtast fornavn : ');
     Readln(o);
     GotoXY(25,8);
     Write('Indtast efternavn : ');
     Readln(p);
   End; (* Inddata *)

 Procedure Beregning;
   Begin (* Beregning *)
     s := o+' '+p;
   End; (* Beregning *)

 Procedure Uddata;
   Begin (* Uddata *)
     GotoXY(25,12);
     Write('Navn= ', s);
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