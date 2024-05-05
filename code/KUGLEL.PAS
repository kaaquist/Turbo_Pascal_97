PROGRAM Kuglel;
  USES
    Crt;

  VAR
    Radius, Rumfang, Overflade: Real;
    Ch                        : Char;

  PROCEDURE InData;
    Begin(* InData *)
      ClrScr;
      GotoXY(25,5);
      Write('Rumfang og overflade af en kugle');
      GotoXY(25,6);
      Write('================================');
      GotoXY(25,7);
      Write('Intast kuglens radius -> ');
      Readln(Radius);
    End; (* InData *)

  PROCEDURE Beregning;
    Begin(* Beregning *)
      Rumfang := 4/3*Pi*exp(3*ln(Radius));  (*Radius*Radius;*)
      Overflade := 4*Pi*Radius*Radius;
    End; (* Beregning *)

  PROCEDURE UdData;
    Begin(* UdData *)
      GotoXY(25,12);
      Write('Rumfang:   ',Rumfang : 8 : 2);
      GotoXY(25,14);
      Write('Overflade:    ',Overflade : 8 : 2);
    End; (* UdData *)

  Begin (* Kuglel *)
    Repeat
      InData;
      Beregning;
      UdData;
      GotoXY(25,20);
      Write('Vil du forts‘tte (j/n): ');
      Ch := ReadKey;
    Until (Ch <> 'j') And (Ch <> 'J');
  End. (* Kuglel *)