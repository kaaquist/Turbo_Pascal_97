Program Opg;

 Uses
   Crt;

 Var
   o,p,q,a,b,c: Integer;
   Ch : Char;

 Procedure Inddata;
   Begin (* Inddata *)
     ClrScr;
     GotoXY(25,7);
     Write('Indtast f›rste heltal -> ');
     Readln(o);
     GotoXY(25,8);
     Write('Indtast anden heltal -> ');
     Readln(p);
     GotoXY(25,9);
     Write('Indtast trede heltal -> ');
     Readln(q);
   End; (* Inddata *)

 Procedure Beregning;
   Begin (* Beregning *)
    If o>p then
     o:=b;
     p:=a;
     q:=c;
   Else
     o:=a;
     p:=b;
     q:=c;
  If o>q then
      o:=c;
      p:=a;
      q:=b;
   Else

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