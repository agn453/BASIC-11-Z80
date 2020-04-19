100 DIM A(9,9),I4(8),J4(8)
110 DEF FNC$(X,Y)=CHR$(27)&"["&STR$(Y)&";"&STR$(X)&"H"
120 DEF FNS$(A,B)=CHR$(27)&'['&STR$(A)&';'&STR$(B)&"r"
130 L$=CHR$(27)+"[2J"
140 R$=CHR$(27)+"[7m"
150 B$=CHR$(27)+"[1m"
160 N$=CHR$(27)+"[0m"
170 PRINT L$;
180 PRINT "DO YOU WANT INSTRUCTIONS (Y OR N)"; \ INPUT X$
190 IF X$="N" THEN 390
200 IF X$<>"Y" THEN 180
210 PRINT L$;
220 PRINT "OTHELLO IS PLAYED ON AN 8 X 8 CHECKER BOARD,"
230 PRINT "ROWS NUMBERED 1 TO 8 AND COLUMNS A TO H."
240 PRINT "THE INITIAL CONDITION IS ALL BLANK, EXCEPT"
250 PRINT "FOR THE CENTER FOUR SQUARES, WHICH FORM THE"
260 PRINT "PATTERN"
270 PRINT "             0X"
280 PRINT "             X0"
290 PRINT ""
300 PRINT "TRY TO PLACE YOUR PIECE SO THAT IT 'OUTFLANKS'"
310 PRINT "MINE, CREATING A HORIZONTAL, VERTICAL, OR"
320 PRINT "DIAGONAL RUN OF MY PIECES BOUNDED AT EACH END"
330 PRINT "BY AT LEAST ONE OF YOURS. THIS WILL 'FLIP' MY"
340 PRINT "PIECES TURNING THEM INTO YOURS."
350 PRINT "NOTE: YOU MUST CAPTURE AT LEAST ONE OF MY"
360 PRINT "PIECES IN THIS WAY IF IT IS AT ALL POSSIBLE."
370 PRINT "IF IT IS NOT POSSIBLE, YOU FORFEIT YOUR TURN BY"
380 PRINT "ENTERING 0,0 FOR YOUR (ROW,COL) MOVE."
390 S2=0 \ PRINT CHR$(10)
400 PRINT "SHOULD I PLAY MY BEST STRATEGY (Y OR N)"; \ INPUT X$
410 IF X$="N" THEN 440
420 IF X$<>"Y" GO TO 400
430 S2=2
440 B=-1
450 W=+1
460 D$="X.0"
470 FOR K=1 TO 8
480 READ I4(K)
490 NEXT K
500 DATA 0,-1,-1,-1,0,1,1,1
510 FOR K=1 TO 8
520 READ J4(K)
530 NEXT K
540 DATA 1,1,0,-1,-1,-1,0,1
550 C$="ABCDEFGH"
560 FOR I=0 TO 9
570 FOR J=0 TO 9
580 A(I,J)=0
590 NEXT J
600 NEXT I
610 A(4,4)=W
620 A(5,5)=W
630 A(4,5)=B
640 A(5,4)=B
650 C1=2
660 H1=2
670 N1=4
680 Z=0
690 RESTORE 
700 PRINT "DO YOU WANT TO HAVE X OR O";
710 C=W
720 H=B
730 INPUT X$
740 IF X$="X" GO TO 780
750 IF X$<>"O" GO TO 700
760 C=B
770 H=W
780 PRINT "DO YOU WANT TO GO FIRST (Y OR N)"; \ INPUT X$
790 C9=0
800 PRINT L$;
810 PRINT FNS$(13,24); \ REM SET SCROLL AREA
820 PRINT FNC$(27,5);R$;' OTHELLO ';N$
830 PRINT FNC$(1,24);
840 IF X$="N" GO TO 880
850 IF X$<>"Y" GO TO 780
860 GOSUB 2460
870 GO TO 1350
880 PRINT "I WILL NOW PONDER MY NEXT MOVE FOR A WHILE" \ B1=-1
890 I3=0 \ J3=0
900 T1=C
910 T2=H
920 I=1
930 J=1
940 IF A(I,J)<>0 GO TO 1110
950 GOSUB 2120
960 IF F1=0 THEN 1110
970 U=-1
980 GOSUB 2210
990 IF S1=0 THEN 1110
1000 IF (I-1)*(I-8)<>0 GO TO 1020
1010 S1=S1+S2
1020 IF (J-1)*(J-8)<>0 GO TO 1040
1030 S1=S1+S2
1040 IF S1<B1 GO TO 1110
1050 IF S1>B1 GO TO 1080
1060 R=RND(1)
1070 IF R>.5 GO TO 1110
1080 B1=S1
1090 I3=I
1100 J3=J
1110 J=J+1 \ IF J<9 GO TO 940
1120 I=I+1 \ IF I<9 GO TO 930
1130 IF B1>0 GO TO 1180
1140 PRINT "I HAVE TO FORFEIT MY MOVE."
1150 IF Z=1 GO TO 1810
1160 Z=1
1170 GO TO 1350
1180 Z=0
1190 C0$=SEG$(C$,J3,J3)
1200 PRINT "I WILL MOVE TO ";STR$(I3);",";C0$
1210 I=I3
1220 J=J3
1230 U=1
1240 GOSUB 2210
1250 C1=C1+S1+1
1260 H1=H1-S1
1270 N1=N1+1
1280 PRINT "THAT GIVES ME";S1;"OF YOUR PIECES"
1290 IF S1>6 THEN PRINT "GOTCHA!!!" \ GO TO 1320
1300 IF S1>4 THEN PRINT "YOU WILL HAVE TO DO BETTER THAN THAT!" \ GO TO 1320
1310 IF S1>2 THEN PRINT "NOT TOO BAD."
1320 IF H1=0 GO TO 1810
1330 IF N1=64 GO TO 1810
1340 GOSUB 2460
1350 T1=H
1360 T2=C
1370 PRINT CHR$(7); \ PRINT "YOUR MOVE -- (ROW,COL)"; \ INPUT I,X$
1380 IF I<0 GO TO 1370
1390 IF I>8 GO TO 1370
1400 IF I<>0 GO TO 1490
1410 PRINT "DO YOU WANT TO QUIT (Y OR N)"; \ INPUT X1$
1420 IF X1$="Y" GO TO 1810
1430 IF X1$<>"N" GO TO 1410
1440 PRINT "ARE YOU FORFEITING YOUR TURN (Y OR N)"; \ INPUT X$
1450 IF X$<>"Y" GO TO 1370
1460 IF Z=1 GO TO 1810
1470 Z=1
1480 GO TO 880
1490 J=1
1500 C0$=SEG$(C$,J,J)
1510 IF C0$=X$ GO TO 1540
1520 J=J+1 \ IF J<9 GO TO 1500
1530 GO TO 1370
1540 IF A(I,J)=0 GO TO 1570
1550 PRINT "COME ON, THAT SQUARE IS OCCUPIED: TRY AGAIN."
1560 GO TO 1370
1570 GOSUB 2120
1580 IF F1=1 GO TO 1620
1590 PRINT "SORRY, YOU ARE NOT NEXT TO ONE OF MY PIECES."
1600 PRINT "TRY AGAIN."
1610 GO TO 1370
1620 U=-1
1630 GOSUB 2210
1640 IF S1>0 GO TO 1670
1650 PRINT "WATCH IT, THAT DOESENT FLANK A ROW: TRY AGAIN"
1660 GO TO 1370
1670 Z=0
1680 PRINT "THAT GIVES YOU";S1;"OF MY PIECES."
1690 IF S1>6 THEN PRINT "YOU MUST HAVE CHEATED!!" \ GO TO 1720
1700 IF S1>4 THEN PRINT "YOU GOT TO ME THAT TIME." \ GO TO 1720
1710 IF S1>2 THEN PRINT "NOT BAD. NOT GOOD BUT NOT BAD."
1720 U=1
1730 GOSUB 2210
1740 H1=H1+S1+1
1750 C1=C1-S1
1760 N1=N1+1
1770 IF C1=0 GO TO 1810
1780 IF N1=64 GO TO 1810
1790 GOSUB 2460
1800 GO TO 880
1810 REM
1820 GOSUB 2460
1830 PRINT " "
1840 W1=0 \ W2=0
1850 W=H1-C1
1860 IF W>0 THEN W1=1 \ GO TO 1900
1870 IF W<0 THEN W2=1 \ GO TO 1960
1880 PRINT "YOU MANAGED TO TIE. CONGRATULATIONS!!!";CHR$(10)
1890 GO TO 2020
1900 IF W>40 THEN PRINT "YOU MUST HAVE CHEATED!!" \ GO TO 2020
1910 IF W>30 THEN PRINT "DIDN'T THINK YOU HAD IT IN YOU!" \ GO TO 2020
1920 IF W>20 THEN PRINT "NOT HALF BAD." \ GO TO 2020
1930 IF W>10 THEN PRINT "PRETTY GOOD FOR YOUR IQ." \ GO TO 2020
1940 IF W>5 THEN PRINT "YOU WIN BOZO." \ GO TO 2020
1950 PRINT "YOU WIN BUT JUST BARELY. I'LL GET YOU NEXT TIME." \ GO TO 2020
1960 IF W<-40 THEN PRINT "YOU BEEN HAD DAD. QUIT TRYING!!!!" \ GO TO 2020
1970 IF W<-30 THEN PRINT "NO COMPETITION. TRY TO THINK." \ GO TO 2020
1980 IF W<-20 THEN PRINT "CREAM PUFF. I DIDN'T EVEN TRY." \ GO TO 2020
1990 IF W<-10 THEN PRINT "YOU CAN'T BEAT A PDP-11." \ GO TO 2020
2000 IF W<-5 THEN PRINT "I GOT YOU THAT TIME." \ GO TO 2020
2010 PRINT "JUST BARELY. YOU MUST HAVE BEEN THINKING."
2020 IF W1=1 GO TO 2060
2030 PRINT CHR$(10)
2040 PRINT "I HAVE";C1,"YOU HAVE";H1
2050 GO TO 2080
2060 PRINT CHR$(10)
2070 PRINT "YOU HAVE";H1,"I HAVE";C1
2080 PRINT "DO YOU WISH TO PLAY AGAIN (Y OR N)"; \ INPUT K$
2090 IF K$="Y" THEN  GO TO 180
2100 IF K$<>"N" THEN PRINT " " \ GO TO 2080
2110 PRINT "QUITTER!" \ GO TO 2790
2120 I1=-1
2130 J1=-1
2140 IF A(I+I1,J+J1)=T2 GO TO 2190
2150 J1=J1+1 \ IF J1<2 GO TO 2140
2160 I1=I1+1 \ IF I1<2 GO TO 2130
2170 F1=0
2180 RETURN
2190 F1=1
2200 RETURN
2210 S1=0
2220 K=1
2230 I5=I4(K)
2240 J5=J4(K)
2250 I6=I+I5
2260 J6=J+J5
2270 S3=0
2280 IF A(I6,J6)<>T2 THEN 2440
2290 S3=S3+1
2300 I6=I6+I5
2310 J6=J6+J5
2320 IF A(I6,J6)=T1 THEN 2350
2330 IF A(I6,J6)=0 GO TO 2440
2340 GO TO 2290
2350 S1=S1+S3
2360 IF U<>1 GO TO 2440
2370 I6=I
2380 J6=J
2390 FOR K1=0 TO S3
2400 A(I6,J6)=T1
2410 I6=I6+I5
2420 J6=J6+J5
2430 NEXT K1
2440 K=K+1 \ IF K<9 THEN 2230
2450 RETURN
2460 REM  **** SUBROUTINE TO PRINT THE UPDATED BOARD ON VT100 *******
2470 C9=C9+1 \ PRINT FNC$(25,8);"TURN NUMBER "+STR$(INT(.5+C9/2))+"  "
2480 IF C9>1 THEN 2540
2490 X8=50 \ Y8=2 \ W8=19 \ H8=10 \ GOSUB 2650
2500 PRINT FNC$(52,1);'A B C D E F G H'
2510 FOR Y=3 TO 10 \ PRINT FNC$(48,Y);STR$(Y-2) \ NEXT Y
2520 PRINT FNC$(52,12);'A B C D E F G H'
2530 FOR Y=3 TO 10 \ PRINT FNC$(70,Y);STR$(Y-2) \ NEXT Y
2540 S9$=" "
2550 FOR I=1 TO 8
2560 D0$=''
2570 FOR J=1 TO 8
2580 Q9=A(I,J)+2
2590 D0$=D0$+S9$+SEG$(D$,Q9,Q9)
2600 NEXT J
2610 PRINT R$;FNC$(51,I+2);D0$+' ';N$
2620 NEXT I
2630 PRINT FNC$(1,24);
2640 RETURN
2650 REM DRAW BOX AT X8,Y8 WITH WIDTH W8 AND HEIGHT H8
2660 PRINT CHR$(27)&"(0"&CHR$(27)&"[1m"
2670 PRINT FNC$(X8,Y8);"l";
2680 FOR I8=1 TO W8-2 \ PRINT "q"; \ NEXT I8
2690 PRINT "k"
2700 FOR I8=1 TO H8-2
2710 PRINT FNC$(X8,Y8+I8);"x"
2720 PRINT FNC$(X8+W8-1,Y8+I8);"x"
2730 NEXT I8
2740 PRINT FNC$(X8,Y8+H8-1);"m";
2750 FOR I8=1 TO W8-2 \ PRINT "q"; \ NEXT I8
2760 PRINT "j"
2770 PRINT CHR$(27)&"[0m"&CHR$(27)&"(B"
2780 RETURN
2790 PRINT FNS$(0,0)
2800 END
