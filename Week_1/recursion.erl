-module(recursion).
-export([fib/1,pieces/1]).

fib(0) -> 0;
fib(1) -> 1;
fib(N) -> fib(N-2) + fib(N-1).

pieces(0) -> 1;
pieces(N) -> pieces(N-1) + N.
