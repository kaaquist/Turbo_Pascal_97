     Program Tekstfiloevelse;

           USES Crt;

           TYPE str80 = STRING[80];
                str20 = STRING[20];

           VAR tekst    : text; (* erkl‘ring af tekstfilen *)
               menuvalg : char;
               DOSnavn  : str20;

           Const
                        tegn1=['?','!','.',',',':',';'];
                   
    {              repeat until KeyPressed;  }

           PROCEDURE Vent;
              VAR v : char;
              BEGIN
                writeln; write('  - tryk p† en tast: ');
                v := readKey; writeln;
              END;


           PROCEDURE IndlaesOgGem( VAR Tfil : text);
              VAR l    : str80;

              BEGIN
                 ClrScr;
                 l := ' ';
                 ClrScr;
                 writeln('Teksten indl‘ses nu linie for linie');
                 writeln('Linierne afsluttes med retur-tast');
                 writeln('Tekst-indtastning afsluttes med en ');
                 writeln('linie best†ende af @@ efterfulgt af retur');
                 vent;
                 WHILE NOT(l = '@@') DO
                   BEGIN
                     readln(l);
                     IF NOT(l = '@@') THEN writeln(Tfil,l);
                   END;
              END (*Indl‘sOgGem*);


           PROCEDURE UdskrivTekstFraDisk(VAR Tfil: text);
              VAR l       : str80;
                  i       : integer;

              BEGIN
                clrscr;
                i:= 0; (* i skal t‘lle antal linier   *)
                       (* s† der bliver pause for hver*)
                       (* 20 linie p† sk‘rmen         *)
                reset (Tfil);
                WHILE not(EOF(Tfil)) DO
                  BEGIN
                    readln(tfil,l);
                    Writeln(l);
                    inc(i);
                    IF (i mod 20 = 0) OR (EOF(tfil)) THEN
                       BEGIN
                         vent;
                         ClrScr;
                       END;
                  END;
              END;(*UdskrivTekstfraDisk*)

              PROCEDURE menu;
                 BEGIN
                   ClrScr; window(10,2,70,23);
                   textbackground(blue);
                   textcolor(Green); ClrScr;
                   GotoXY(2,2); writeln('Tast menuvalg:');
                   GotoXY(5,4); writeln('N   Ny fil oprettes');
                   gotoxy(5,6); writeln('F   Ny fil');
                   GotoXY(5,8); writeln('I   Indl‘sning af tekst');
                   GotoXY(5,10); writeln('U   Udskrift af teksten');
                   GotoXY(5,12); writeln('T   Tegn-statistik');
                   GotoXY(5,14); writeln('O   Ord-statistik');
                   GotoXY(5,16); writeln('S   S‘tnings-statistik');
                   GotoXY(5,18); writeln('P   Program-Stop');
                   gotoXY(30,22);write(' - tast forbogstavet: ');
                 END;

              PROCEDURE opretfil(VAR Tfil: text);
                 BEGIN
                   ClrScr;
                   rewrite(Tfil);
                   write('En tom elevfil er nu oprettet under');
                   writeln('DOS-navnet ',DOSnavn);
                   vent;
                 END;

              PROCEDURE afslut(VAR Tfil : text);
                 BEGIN
                   close(Tfil);
                 END;

              PROCEDURE TegnStatistik(VAR Tfil: text);


                 VAR Tegnhyppighed: ARRAY[Char] of integer;
                     antal,i : integer;
                     l :  str80;
                 BEGIN
                   Reset(Tfil);
                   antal:=0;
                   For i:=0 to 255 do
                   Tegnhyppighed[chr(i)]:=0;

                   WHILE NOT(Eof(Tfil)) DO
                     BEGIN
                       Readln(Tfil,l);
                       FOR i := 1 TO length(l) DO
                        inc(Tegnhyppighed[l[i]]);
                     END;

                   ClrScr;
                   for i:=30 to 230 do
                   begin
                   if (i mod 10)  = 0 then writeln;
                   {if tegnhyppighed[chr(i)] >0 then}
                   Write(chr(i),':', tegnhyppighed[chr(i)]:2,'  ');
                   end;
                   vent;
                 END;

              PROCEDURE AntalOrd(VAR Tfil: text);
                 VAR l            : str80;
                     i, antal     : integer;

                 BEGIN
                   Reset(Tfil);
                   antal:=0;
                   WHILE NOT(Eof(Tfil)) DO
                     BEGIN
                       Readln(Tfil,l);
                       FOR i := 1 TO length(l) DO
                           IF l[i] = ' ' THEN
                              BEGIN
                                inc(antal);
                                WHILE l[i] = ' ' DO inc(i);
                              END;

                       inc(antal); (*linieskift t‘ller med*)
                       IF l[1] = ' ' THEN dec(antal);
                           (* blanke i starten t‘ller ikke *)
                     END;
                   ClrScr;
                   Writeln('Der var ', antal,' ord i teksten');
                   vent;
                 END;

                  PROCEDURE AntalSaetninger(VAR Tfil: text);
                 VAR l            : str80;
                     i, antal     : integer;

                 BEGIN
                   Reset(Tfil);
                   antal:=0;

                   WHILE NOT(Eof(Tfil)) DO
                     BEGIN
                       Readln(Tfil,l);
                       FOR i := 1 TO length(l) DO

                           IF l[i] IN tegn1 THEN
                              BEGIN
                                inc(antal);
                                WHILE l[i] = ' ' DO inc(i);
                              END;

                       END;

                   ClrScr;
                   Writeln('Der var ', antal,' s‘tninger i teksten');
                   vent;
                 END;

                 procedure vindue;
                   begin
	                   window(1,1,80,25);
	                   textbackground(Lightgray);
	                   textcolor(magenta);
	                   clrscr;
	                   writeln('   ',dosnavn);
	                   window(5,5,85,20);
	                   textbackground(yellow);
	                   textcolor(white);
                     clrscr;
                     end;

                 procedure nyfil;
                   begin
	                  clrscr;
                    write('Tast navnet p† den nye DOS-fil, du vil arbejde med: ');
                    readln(dosnavn);
                    close(tekst);
                    assign(tekst, dosnavn);
                    vindue;
                    end;


           (************************************************)

            BEGIN
              textbackground(lightGray);
              textcolor(Yellow);
              ClrScr;
              write('Tast navnet p† den DOS-fil, du vil arbejde med: ');
              readln(DOSnavn);
              assign(tekst, DOSnavn);
              {vindue;}
              menuvalg := ' ';
              WHILE not(menuvalg = 'P') DO
                 BEGIN
                   menu;
                   readln(menuvalg);
                   menuvalg := upcase(menuvalg);
                   IF menuvalg = 'N' THEN opretfil(tekst);
                   if menuvalg = 'F' then nyfil;
                   IF menuvalg = 'I' THEN IndlaesOgGem(tekst);
                   IF menuvalg = 'U' THEN UdskrivTekstfradisk(tekst);
                   IF menuvalg = 'T' then tegnstatistik(tekst);
                   IF menuvalg = 'O' THEN AntalOrd(tekst);
                   IF menuvalg = 'S' THEN AntalSaetninger(tekst);
                 END;
              afslut(tekst);
              end.




