       PROGRAM elevliste;
         USES crt;

         TYPE str30 = string[30];
              str5 = string[5];
              telefonstr = string[8];

              elevpostType = RECORD
                              navn    : str30;
                              adresse : str30;
                              klasse  : str5;
                              alder   : integer;
                              tlf     : telefonstr;
                             END;

              elevfilType = FILE OF elevpostType;

         VAR  elev     : elevpostType;
              elevfil  : elevfilType;
              menuvalg : char;
              DOSnavn  : str30;

         (*......................................*)

         PROCEDURE vent;
            VAR v : char;
            BEGIN
              writeln; write('  - tryk p† en tast: ');
              v := ReadKey; writeln;
            END;


         PROCEDURE menu;
            BEGIN
              window(10,5,70,20);
              textbackground(blue);
              textcolor(yellow);
              ClrScr;
              GotoXY(2,2); writeln('Tast menuvalg:');
              GotoXY(5,4); writeln('O   Opret ny fil');
              GotoXY(5,6); writeln('I   Indl‘sning af post');
              GotoXY(5,8); writeln('U   Udskrift af posterne');
              GotoXY(5,12); writeln('S   Stoppe programmet');
              GotoXY(5,10); Writeln('D   Slet en post');
              textcolor(red);
              gotoXY(30,15);write(' - tast forbogstavet: ');
            END;

         PROCEDURE opretfil(VAR fil: elevfilType);
            BEGIN
              ClrScr;
              rewrite(fil);
              write('En tom elevfil er nu oprettet under');
              writeln('DOS-navnet ',DOSnavn);
              vent;
            END;

         PROCEDURE indlaespost(VAR fil: elevfilType);
            BEGIN
              ClrScr;
              reset(fil);
              seek(fil, fileSize(fil));
              WITH elev DO
                 BEGIN
                   write('tast navn ----------> '); readln(navn);
                   write('tast adresse -------> '); readln(adresse);
                   write('tast klasse --------> '); readln(klasse);
                   write('tast alder ---------> '); readln(alder);
                   write('tast telefon -------> '); readln(tlf);
                 END;
              write(fil,elev);
              writeln('Der er ',fileSize(fil),' poster p† filen.');
              vent;
            END;

         PROCEDURE udskrivposter(VAR fil : elevfiltype);

            BEGIN
              reset(fil);
              ClrScr;
              WHILE NOT EOF(fil) DO
                 BEGIN
                   read(fil,elev);
                   ClrScr;
                   WITH elev DO
                     BEGIN
                       writeln(navn);
                       writeln(adresse);
                       writeln(klasse);
                       writeln(alder);
                       writeln(tlf);
                       Writeln('post nr: ',Filepos(elevfil)-1);
                     END;
                   vent;
                 END;
            END;

         PROCEDURE sletenpost(VAR fil : elevfilType);
           VAR Nr:integer;
               Elevflyt,Sletelev: elevpostType;
                 Begin
                   Clrscr;
                   Reset(fil);
                   Writeln('Angiv postnr. du skal slette: ');
                   Readln(nr);
                   Seek(fil,filesize(fil)-1);
                   Read(fil,Elevflyt);
                   Seek(fil,nr);
                   Read(fil,Sletelev);
                   Seek(fil,FilePos(fil)-1);
                   Write(fil,Elevflyt);
                   Seek(fil,Filesize(fil)-1);
                   Truncate(fil);
                   WITH sletelev DO
                     BEGIN
                       writeln(navn);
                       writeln(adresse);
                       writeln(klasse);
                       writeln(alder);
                       writeln(tlf);
                     END;
                   vent;
                 End;

         PROCEDURE afslut(VAR fil : elevfilType);
           BEGIN
             close(elevfil);
           END;


         (*******************************************************)

       BEGIN
         textbackground(LightGray); textcolor(magenta);
         ClrScr;
         write('tast navnet p† den DOS-fil, du vil arbejde med: ');
         readln(DOSnavn);
         assign(elevfil, DOSnavn);
         menuvalg := ' ';
         WHILE not(menuvalg = 'S') DO
            BEGIN
              menu;
              readln(menuvalg);
              menuvalg := upcase(menuvalg);
              IF menuvalg = 'O' THEN opretfil(elevfil);
              IF menuvalg = 'I' THEN indlaespost(elevfil);
              IF menuvalg = 'U' THEN udskrivposter(elevfil);
              IF menuvalg = 'S' THEN afslut(elevfil);
              IF menuvalg = 'D' THEN sletenpost(elevfil);
            END;
       END (* program *).

