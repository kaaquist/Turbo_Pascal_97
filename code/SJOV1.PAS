PROGRAM ET;

Uses Crt,Sketch;

  Procedure E(x,y:integer;farve:word);

   Begin (* E *)
     SetColor(farve);Bar(x,y,x+50,y+10);
     Bar(x,y,x+13,y-65);
     Bar(x,y-65,x+50,y-55);
     Bar(x,y-33,x+40,y-23);
   End; (* E *)

  Procedure T(x,y:integer;farve:word);

   Begin (* T *)
     SetColor(farve);Bar(x,y,x+73,y+10);
     Bar(x+30,y,x+43,y-65);
   End; (* T*)

Begin
  ClearScreen(yellow);
  E(250,255,black);
  E(246,251,red);
  T(320,255,black);
  T(316,251,red);

  WaitAndStop
End.