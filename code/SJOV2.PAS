PROGRAM ET;

Uses Crt,Sketch;
const s=20;k=9;

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
  Speed (10);
  ClearScreen(cyan);
  E(250,255,white);
  E(250-s,255-k,black);
  E(100,105,blue);
  E(100-s,105-k,LightRed);
  T(320,255,red);
  T(320-s,255-k,yellow);
  T(170,105,DarkGray);
  T(170-s,105-k,Magenta);

  WaitAndStop
End.