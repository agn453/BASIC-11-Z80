100 REM THE PROGRAM 23 MATCHES
101 REM
110 PRINT "WE BEGIN WITH 23 MATCHES. YOU MOVE FIRST. YOU MAY TAKE"
115 PRINT "1, 2, OR 3 MATCHES. TYPE YOUR CHOICE FOLLOWED BY A CAR-"
120 PRINT "RIAGE RETURN. THEN THE COMPUTER CHOOSES 1, 2, OR 3"
125 PRINT "MATCHES. YOU CHOOSE AGAIN, AND SO ON. WHOEVER MUST"
130 PRINT "TAKE THE LAST MATCH, LOSES."
140 PRINT  \ LET M=23
200 REM THE HUMAN MOVES
201 REM
210 PRINT  \ PRINT "THERE ARE NOW";M;"MATCHES."
215 PRINT  \ PRINT "HOW MANY DO YOU TAKE";
230 INPUT H
240 IF H>M THEN 510
250 IF H<>INT(H) THEN 510
260 IF H<=0 THEN 510
270 IF H>=4 THEN 510
280 LET M=M-H
290 IF M=0 THEN 410
300 REM THE COMPUTER MOVES
301 REM
305 IF M=1 THEN 440
310 LET R=M-4*INT(M/4)
320 IF R<>1 THEN 350
330 LET C=INT(3*RND)+1 \ GO TO 360
350 LET C=(R+3)-4*INT((R+3)/4)
360 LET M=M-C
370 IF M=0 THEN 440
380 PRINT  \ PRINT "THE COMPUTER TOOK";C;"....";
390 GO TO 210
400 REM SOMEBODY WON
401 REM
410 PRINT  \ PRINT "THE COMPUTER WON." \ GO TO 999
440 PRINT  \ PRINT "YOU WON." \ GO TO 999
500 REM BAD INPUT
501 REM
510 PRINT "ENTER ONLY 1, 2, OR 3." \ GO TO 215
999 END
