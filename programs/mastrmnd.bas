10 C$=CHR$(27)+"[2J" \ REM DISPLAY_CLEAR
11 DEF FNC$(X,Y)=CHR$(27)+"["+STR$(Y)+";"+STR$(X)+"H" \ REM MOVE_CURSOR(Y,X)
12 REM ----------------------------------------------------------------------
13 REM *** THIS GAME OF MASTERMIND WRITTEN BY BOB PRESTWOOD OF THE T.A.C. ***
14 REM ----------------------------------------------------------------------
15 PRINT "THIS IS THE GAME OF MASTERMIND - WOULD YOU LIKE THE RULES (Y/N)"; \ INPUT R5$ \ IF R5$="Y" THEN  GOSUB 1000
20 RANDOMIZE
30 DIM X(4)
40 PRINT C$ \ PRINT FNC$(1,1); \ REM RESTART FROM HERE
45 GOSUB 600
50 REM LETS GO GET 4 RANDOM NUMBERS
60 FOR I=1 TO 4
70 GOSUB 550
80 N(I)=A
90 NEXT I
95 J=9 \ PRINT FNC$(1,J);
100 PRINT ,,"   GUESS","     RESULT" \ REM START GAME PROPER NOW
110 PRINT 
120 FOR J=11 TO 20 \ REM 11 TO 19 = 10 GUESSES
130 PRINT FNC$(32,J);
140 PRINT "          ";
150 PRINT FNC$(10,J);
160 PRINT "GUESS NUMBER ";J-10;
170 PRINT FNC$(30,J);
180 INPUT X$ \ REM INPUT A 4 FIGURE NO.
190 REM NOW MAKE SURE IT IS 4 FIGURES
200 L=LEN(X$)
210 IF L<4 THEN 130
220 IF L>4 THEN 130
230 FOR I=1 TO 4
240 REM NOW MAKE SURE WE HAVE ONLY NUMERALS AND STORE IN ARRAY X()
250 X$(I)=SEG$(X$,I,I)
260 IF X$(I)<"0" THEN 130
270 IF X$(I)>"9" THEN 130
280 X(I)=VAL(X$(I))
290 NEXT I
300 REM NOW WE GO INTO CHECK GUESS MODE
310 PRINT FNC$(49,J);
320 C=0
330 FOR I=1 TO 4 \ REM CLEAR MARKERS LOOP
340 N1(I)=0 \ X1(I)=0
350 NEXT I
360 FOR I=1 TO 4 \ REM CHECK FOR *'s LOOP
370 IF X(I)=N(I) THEN X1(I)=1 \ N1(I)=1 \ PRINT "*"; \ C=C+1
380 IF C=4 THEN T=T+1 \ G1=G1+(J-10) \ G=G1/T \ GO TO 480
390 NEXT I
400 FOR I=1 TO 4 \ REM CHECK FOR ?'s LOOP
410 FOR K=1 TO 4
420 IF X1(I)=1 THEN 450
430 IF N1(K)=1 THEN 450
440 IF X(I)=N(K) THEN X1(I)=1 \ N1(K)=1 \ PRINT "?"; \ GO TO 460
450 NEXT K
460 NEXT I
470 NEXT J
480 PRINT  \ PRINT  \ PRINT ,N(1);N(2);N(3);N(4);" WAS THE CORRECT NUMBER"
490 PRINT ,"       *** YOU WERE "; \ IF C=4 THEN PRINT "RIGHT ***" \ Y=Y+1
500 IF C<>4 THEN PRINT "WRONG ***" \ M=M+1
505 GOSUB 600
510 REM AGAIN?
515 PRINT FNC$(1,24);
520 PRINT "AGAIN (Y/N)"; \ INPUT Q1$
530 IF Q1$="Y" THEN 40
535 IF Q1$<>"N" THEN 510
540 GO TO 580
550 REM FIND A RANDOM NO. SUBROUTINE
560 A=INT(RND(1)*10)
570 RETURN
580 STOP
600 REM SUB TO PRINT SCORES
605 PRINT FNC$(1,1);
610 PRINT 
620 PRINT ,,"   ** SCORES **"
625 PRINT 
630 PRINT ,,"MINE","YOURS"
635 PRINT ,,,"               ";CHR$(13);
640 PRINT ,,M,Y
695 RETURN
1000 REM SUB TO PRINT THE RULES
1005 PRINT 
1010 PRINT  \ PRINT "I WILL THINK OF A 4 FIGURE NUMBER ALL YOU HAVE TO DO IS GUESS IT"
1015 PRINT 
1020 PRINT "I WILL LET YOU HAVE TEN GUESSES (IF YOU NEED THAT MANY)"
1025 PRINT 
1030 PRINT "EACH TIME YOU MAKE A GUESS I WILL:-"
1040 PRINT "1) INDICATE HOW MANY ARE RIGHT AND IN THE RIGHT POSITION WITH A ";
1050 PRINT CHR$(34);"*";CHR$(34);" IN THE RESULTS COLUMN"
1060 PRINT "2) INDICATE HOW MANY ARE RIGHT BUT IN THE WRONG POSITION WITH A ";
1070 PRINT CHR$(34);"?";CHR$(34);" IN THE RESULTS COLUMN"
1080 PRINT  \ PRINT "I WILL ALSO KEEP THE SCORE"
1085 PRINT 
1090 PRINT "HIT RETURN WHEN READY TO CONTINUE"; \ INPUT R5$
1095 RETURN
1099 END
