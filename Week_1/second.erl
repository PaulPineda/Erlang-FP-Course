-module(second).
-export([hyp/2,perimeter/2,area/2]).

hyp(X,Y) ->
  math:sqrt(first:sqr(X)+first:sqr(Y)).

perimeter(X,Y) ->
  hyp(X,Y) + X + Y.

area(X,Y) ->
  X*Y/2.
