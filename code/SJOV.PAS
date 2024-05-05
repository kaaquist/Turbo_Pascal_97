PROGRAM ET;

Uses Crt,Sketch;
  Procedure E;
  const t=4;
   Begin (* E *)
     SetColor(black);Bar(250,255,300,265);
     SetColor(black);Bar(250,255,263,190);
     SetColor(black);Bar(250,190,300,200);
     SetColor(black);Bar(250,222,290,232);
     SetColor(red);Bar(250+t,255+t,300+t,265+t);
     SetColor(red);Bar(250+t,255+t,263+t,190+t);
     SetColor(red);Bar(250+t,190+t,300+t,200+t);
     SetColor(red);Bar(250+t,222+t,290+t,232+t);
   End; (* E *)

  Procedure T;
  const t=4;
   Begin (* T *)
     SetColor(black);Bar(320,255,393,265);
     SetColor(black);Bar(350,255,363,190);
     SetColor(red);Bar(320+t,255+t,393+t,265+t);
     SetColor(red);Bar(350+t,255+t,363+t,190+t);
  End; (* T*)

Begin
  ClearScreen(yellow);
  E;
  T;
  WaitAndStop
End.

