:-dynamic(piece/5).

piece('r',1,2,'in',3).
piece('o',3,5,'in',2).
piece('r',2,2,'in',1).
piece('o',5,3,'in',2).

transfert(Board,Lin1,Col1,Lin2,Col2,Marq) :-  retract(piece(A,Lin1,Col1,B,C)), boardMarqueur(Board, Lin2,Col2,M), transfert(Board,Lin2,Col2,Lin2,Col2,Marq), asserta(piece(A,Lin2,Col2,B,M)),!.
/* commande de test([[(2, b),(3, b)],[(2, b),(1, b)]],2,2,1,1,M).*/
boardMarqueur([T|_], 1, Col,M) :- boardMarqueurDansLigne(T, Col,M).
boardMarqueur([_|Q], Lin, Col, M) :- NLin is Lin-1, boardMarqueur(Q, NLin, Col,M).
/*On trouve la colonne*/
boardMarqueurDansLigne([(M, _)|_], 1,M).
boardMarqueurDansLigne([_|Q], Col, M) :- NCol is Col-1, boardMarqueurDansLigne(Q, NCol, M).
 
VincentBaheuxFaitDuSkiEnSlip.