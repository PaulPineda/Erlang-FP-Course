-module(patterns).
-export([xor0/2,xor1/2,xorEq/2,xorNotEq/2,xorNot/2,maxThree/3,howManyEqual/3,test1/0]).

xor0(true,false) ->
  true;
xor0(false,true) ->
  true;
xor0(_,_) ->
  false.

xor1(X,X) ->
  false;
xor1(_,_) ->
  true.

xorEq(X,Y) ->
  A = X == Y,
  not A.

xorNotEq(X,Y) ->
  X =/= Y.

xorNot(X,Y) ->
  X and not Y.

maxThree(X,Y,Z) ->
  max(X,max(Y,Z)). 

howManyEqual(X,X,X) ->
  3;
howManyEqual(X,X,_) ->
  2;
howManyEqual(X,_,X) ->
  2;
howManyEqual(_,X,X)->
  2;
howManyEqual(_,_,_)->
  0.

test1() ->
  howManyEqual(34,25,36) == 0.

