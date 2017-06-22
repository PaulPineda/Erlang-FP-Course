-module(tail).
-export([sum/1,max/1,fib/1,fib_/1,perfect/1]).

sum(N) ->
  sum(N,0).

sum(0,P) -> P;
sum(N,P) ->
  sum(N-1, P+N).

max(N) ->
  N.

fib(N) -> fib(N, 1, 0).

fib(0, _, P0) -> P0;
fib(N, P1, P0) -> fib(N-1, P1+P0, P1).

% fib(4)
% = fib(4, 1, 0)
% = fib(3, 1, 1)
% = fib(2, 2, 1)
% = fib(1, 3, 2)
% = >> 3 

% alternative, version:
fib_(N) -> fib_(N, 0, 1).

fib_(0, Prev, _) -> Prev;
fib_(N, Prev, Curr) -> fib(N-1, Curr, Prev+Curr).
% fib_(5)
% = fib(5,0,1)
% = fib(4,1,1)
% = fib(3,1,2)
% = fib(2,2,3)
% = fib(1,3,5)
% = fib(0,5,8)
% = 8

perfect(N,N,S) -> N == S; % case for perfect number

% for other cases, target N, at iteration M with a current sum S
% add N to S if N/M has no remainder
perfect(N,M,S) when N rem M == 0 ->
  perfect(N,M+1,S+M);
perfect(N,M,S) ->
  perfect(N,M+1,S).

perfect(N) ->
  perfect(N,1,0).

% perfect(6)
% = perfect(6,1,0) 

% ...6 rem 1 == 0 so:
% perfect(6,2,1+0)

% ...6 rem 2 == 0 so:
% perfect(6,3,2+1)

% ...6 rem 3 == 0 so:
% perfect(6,4,3+3)

% perfect(6,4,6) >> N == S, perfect

% perfect(4)
% = pefect(4,1,0)

% ...4 rem 1 == 0 so:
% perfect(4,2,1)

% ...4 rem 2 == 0 so:
% perfect(4,3,2+1) = perfect(4,3,3)

% ...4 rem 3 =/= 0 so
% perfect(4,4,3) >> N,N,S match but N=/=S so FALSE... whoop!
