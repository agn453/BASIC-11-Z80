10 REM *** GAME OF ACEY-DUCEY WRITTEN BY BILL PALMBY
20 REM *** ADLAI STEVENSON HIGH SCHOOL, PRAIRE VIEW, ILL
30 REM *** TRANSLATED TO RSTS/E BY DAVE AHL, DIGITAL
100 RANDOMIZE
101 PRINT "ACEY-DUCEY IS PLAYED IN THE FOLLOWING MANNER:"
102 PRINT "THE DEALER (COMPUTER) DEALS TWO CARDS FACE UP."
103 PRINT "YOU HAVE THE OPTION TO BET OR NOT TO BET DEPENDING"
104 PRINT "ON WHETHER OR NOT YOU FEEL THE NEXT CARD WILL HAVE"
105 PRINT "A VALUE BETWEEN THE FIRST TWO."
106 PRINT "IF YOU DO NOT WANT TO BET, INPUT A 0."
110 PRINT 
160 N=100 \ Q=100
190 PRINT "YOU NOW HAVE",Q,"DOLLARS."
195 PRINT 
200 GO TO 260 
210 Q=Q+M
220 GO TO 190 
240 Q=Q-M
250 GO TO 190 
260 PRINT "HERE ARE YOUR NEXT TWO CARDS..."
270 A=INT(14*RND(5))+2
280 IF A<2 THEN 270 
290 IF A>14 THEN 270 
300 B=INT(14*RND(6))+2
310 IF B<2 THEN 300 
320 IF B>14 THEN 300 
330 IF A>=B THEN 270 
350 IF A<11 THEN 400 
360 IF A=11 THEN 420 
370 IF A=12 THEN 440 
380 IF A=13 THEN 460 
390 IF A=14 THEN 480 
400 PRINT A
410 GO TO 500 
420 PRINT "JACK"
430 GO TO 500 
440 PRINT "QUEEN"
450 GO TO 500 
460 PRINT "KING"
470 GO TO 500 
480 PRINT "ACE"
500 IF B<11 THEN 550 
510 IF B=11 THEN 570 
520 IF B=12 THEN 590 
530 IF B=13 THEN 610 
540 IF B=14 THEN 630 
550 PRINT B
560 GO TO 650 
570 PRINT "JACK"
580 GO TO 650 
590 PRINT "QUEEN"
600 GO TO 650 
610 PRINT "KING"
620 GO TO 650 
630 PRINT "ACE"
650 PRINT 
660 PRINT "WHAT IS YOUR BET"; \ INPUT M
670 IF M<>0 THEN 680 
675 PRINT "CHICKEN!!" \ PRINT 
677 GO TO 260 
680 IF M<=Q THEN 730 
690 PRINT "SORRY, MY FRIEND, BUT YOU BET TOO MUCH"
700 PRINT "YOU HAVE ONLY",Q,"DOLLARS TO BET."
710 GO TO 650 
730 C=INT(14*RND(7))+2
740 IF C<2 THEN 730 
750 IF C>14 THEN 730 
760 IF C<11 THEN 810 
770 IF C=11 THEN 830 
780 IF C=12 THEN 850 
790 IF C=13 THEN 870 
800 IF C=14 THEN 890 
810 PRINT C
820 GO TO 910 
830 PRINT "JACK"
840 GO TO 910 
850 PRINT "QUEEN"
860 GO TO 910 
870 PRINT "KING"
880 GO TO 910 
890 PRINT "ACE"
910 IF C>A THEN 930 
920 GO TO 970 
930 IF C>=B THEN 970 
950 PRINT "YOU WIN!!!"
960 GO TO 210 
970 PRINT "SORRY, YOU LOSE."
980 IF M<Q THEN 240 
1000 PRINT 
1010 PRINT "SORRY, FRIEND, BUT YOU BLEW YOUR WAD."
1020 PRINT "TRY AGAIN (YES OR NO)"; \ INPUT A$
1030 IF A$="YES" THEN 110 
1040 PRINT  \ PRINT "O.K. HOPE YOU HAD FUN!!"
1050 END