Program Opg;

 Uses
   Crt;

 Var
   a,b,c: Integer;
   Ch : Char;

 Procedure Inddata;
   Begin (* Inddata *)
     ClrScr;
     Write('Indtast f›rste heltal -> ');
     Readln(a);
     Write('Indtast anden heltal -> ');
     Readln(b);
     Write('Indtast tredje heltal -> ');
     Readln(c);
   End; (* Inddata *)

 Procedure Beregning;
   Begin (* Beregning *)
    If a<b then
       If b<c then Write(a,' ',b,' ',c)
       Else
           If a<c then Write(a,' ',c,' ',b)
           Else Write(c,' ',a,' ',b)
    Else
    If c<b then Write (c,' ',b,' ',a)
    Else
        If c<a then Write(b,' ',c,' ',a)
        Else Write(b,' ',a,' ',c)
   End; (* Beregning *)

 Begin (* Opg *)
   Repeat
     Inddata;
     Beregning;
     GotoXY(25,10);
     Write(' Vil du fors‘tte (j/n): ');
     Ch := Readkey;
   Until (Ch<> 'j') And (Ch<> 'J');
 End. (* Opg *)