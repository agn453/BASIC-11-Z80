100 PRINT "YOU ARE THE RULER OF THE ANCIENT KINGDOM OF SUMERIA."
101 PRINT "YOUR PEOPLE CALL YOU 'HAMURABI THE WISE'. YOUR TASK IS"
102 PRINT "TO DEVELOP A STABLE ECONOMY BY THE WISE MANAGEMENT OF"
103 PRINT "YOUR RESOURCES. YOU WILL BE BESET FROM TIME TO TIME"
104 PRINT "BY NATURAL EVENTS. THE ONLY HELP I CAN GIVE YOU IS THE "
105 PRINT "FACT THAT IT TAKES 2 BUSHELS OF GRAIN AS SEED TO PLANT"
106 PRINT "AN ACRE. MAY YOU JUDGE WELL, ALKNOWING HAMURABI."
107 PRINT "***********HAMURABI IS HERE***********"
110 P=95
111 S=2800
112 H=3000
113 E=H-S
114 Y=3
115 A=H/Y
116 I=5
117 Q=1
210 D=0
215 PRINT 
217 PRINT "LAST YEAR"D"PEOPLE STARVED,"I"CAME TO THE CITY"
218 P=P+I
227 IF Q>0 THEN 230 
228 P=INT(P/2)
229 PRINT "HALF DIED OF THE PLAGUE"
230 PRINT "POPULATION IS NOW"P
232 PRINT "CITY OWNS"A"ACRES,"Y"BUSHELS HARVESTED PER ACRE"
250 PRINT "RATS DESTROYED"E"BUSHELS,"S"BUSHELS IN STORE"
260 PRINT \PRINT "DO YOU WISH TO ABDICATE";
270 INPUT B$\PRINT 
280 IF B$="NO" THEN 310 \IF B$<>"YES" THEN 260 
290 STOP
310 C=INT(10*RND(0))
311 Y=C+17
312 PRINT "LAND COSTS"Y"BUSHELS PER ACRE"
320 PRINT "BUY";
321 INPUT Q
322 IF Y*Q<S THEN 330 
323 GOSUB 710 
324 GO TO 320 
330 IF Q=0 THEN 340 
331 A=A+Q
332 S=S-Y*Q
333 C=0
334 GO TO 410 
340 PRINT "SELL";
341 INPUT Q
342 IF Q<A THEN 350 
343 GOSUB 710 
344 GO TO 340 
350 A=A-Q
351 S=S+Y*Q
352 C=0
410 PRINT "BUSHELS FOR FOOD";
411 INPUT Q
420 IF Q<=S THEN 430 
421 GOSUB 710 
422 GO TO 410 
430 S=S-Q
431 C=1
440 PRINT "ACRES TO PLANT";
441 INPUT D
450 IF D<A THEN 455 
451 IF INT(D/2)<S THEN 455 
452 GOSUB 710 
453 GO TO 440 
455 IF D>=10*P THEN 452 
510 S=S-INT(D/2)
511 GOSUB 800 
512 Y=C
513 H=D*Y
520 E=0
521 GOSUB 800 
522 IF INT(C/2)<>C/2 THEN 530 
523 E=INT(S/C)
530 S=S-E+H
531 GOSUB 800 
532 I=INT(C*(20*A+S)/P/100+1)
540 C=INT(Q/20)
541 Q=INT(10*(2*RND(0)-1))
550 IF P<C THEN 210 
551 D=P-C
552 P=C
553 GO TO 215 
710 PRINT "THINK AGAIN, YOU HAVE"
711 PRINT A"ACRES,"P"PEOPLE,"S"BUSHELS"
712 RETURN
800 C=INT(RND(0)*5)+1
801 RETURN
900 END
