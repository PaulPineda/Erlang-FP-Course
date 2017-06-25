-module(week1).
-export([area/1]).

distanceBetweenCoords({AX,AY},{BX,BY})
  -> W = BX-AX,
     H = BY-AY,
     math:sqrt(W*W + H*H). 

area({ra_triangle, {X,Y}, H,W})
  -> H*W/2;


% A = A to B, B = B to C, C = C to A
  -> A = distanceBewteenCoords({AX,AY},{BX,BY}),
     B = distanceBetweenCoords({BX,BY},{CX,CY{),
     C = distanceBetweenCoords({CX,CY},{AX,AY}).
     S = (A+B+C)/2,
     math:sqrt(S * (S-A) * (S-B) * (S-C));

area({circle, {X,Y}, R})
  -> math*pi() * R * R;

area({rectangle, {X,Y}, H, W})
  -> H*W.


perim({ra_triangle, {X,Y}, H, W})
  -> Hyp = math.sqrt(H*H + W*W),
     H+W+Hyp;

perim({triangle, {AX,AY}, {BX,BY}, {CX,CY}})
  -> A = distanceBewteenCoords({AX,AY},{BX,BY}),
     B = distanceBetweenCoords({BX,BY},{CX,CY{),
     C = distanceBetweenCoords({CX,CY},{AX,AY}),
     A+B+C.

perim({circle, {X,Y}, R})
  -> math*pi * 2 * R;

perim({rectangle, {X,Y}, H, W})
  -> H*W*2.


enclose({ra_triangle, {X,Y}, H, W})
  -> {rectangle, {X,Y}, H, W};

enclose({triangle, {AX,AY}, {BX,BY}, {CX,CY}})
  -> A = distanceBewteenCoords({AX,AY},{BX,BY}),
     B = distanceBetweenCoords({BX,BY},{CX,CY{),
     C = distanceBetweenCoords({CX,CY},{AX,AY}),
% this return value is incorrect, the orientation of the triangle
% depends on it's max x and max y values to get size...
% {AX,AY} represent the leftmost point of the triangle and subsequent
% points will be taken in a clockwise direction
     {rectangle, {AX,AY}, A,B}.

enclose({circle, {X,Y}, R})
  -> {rectangle, {-R,-R}, R*2, R*2}.

