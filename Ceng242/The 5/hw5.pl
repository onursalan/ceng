:-module(hw5, [catomic_number/2, ion/2, molecule/2]).

:-[catoms].

subt(X, Y, Z):- Z is X - Y.

result(CHARGE,RES) :- CHARGE > 4 -> subt(CHARGE,8,RES) ; subt(CHARGE,0,RES).

catomic_number(X,NUMBER) :- catom(X,_,_,U),sumlist(U,NUMBER).

ion(X,RES) :- catom(X,_,_,U),last(U,CHARGE),result(CHARGE,RES).

molecule(X,Y) :- catom(X,Z,Y,Z).
