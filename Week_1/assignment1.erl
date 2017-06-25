-module(assignment1).
-export([area/1,perim/1,enclose/1]).
%========
% SHAPES
%========

% helper function, used for calculating distance between coords of a
% shape whose tuple is defined by a number of tuple pairs (coords)
distanceBetweenCoords({AX,AY},{BX,BY})
  -> W = BX-AX,
     H = BY-AY,
     math:sqrt(W*W + H*H).

% area for right angled triangle 
area({ra_triangle, {_,_}, H,W})
  -> H*W/2;

% define a triangle of any type by returning a shape of 3 coordinates 
% represented by tuples
% A GENERIC SHAPE OF MORE THAN THREE SIDES CAN BE DEFINED IN A SIMILAR
% WAY WITH A COORD FOR EACH POINT.  OTHER VALUES LIKE HEIGHT AND
% WIDTH CAN BE CALCULATED LATER
area({triangle, {AX,AY}, {BX,BY}, {CX,CY}})
% A = disance fromA to B,
% B = distance from B to C,
% C = distance from C to A
  -> A = distanceBetweenCoords({AX,AY},{BX,BY}),
     B = distanceBetweenCoords({BX,BY},{CX,CY}),
     C = distanceBetweenCoords({CX,CY},{AX,AY}),
     S = (A+B+C)/2,
     math:sqrt(S * (S-A) * (S-B) * (S-C));

area({circle, {_,_}, R})
  -> math:pi() * R * R;

area({rectangle, {_,_}, H, W})
  -> H*W.


perim({ra_triangle, {_,_}, H, W})
  -> Hyp = math:sqrt(H*H + W*W),
     H+W+Hyp;

perim({triangle, {AX,AY}, {BX,BY}, {CX,CY}})
  -> A = distanceBetweenCoords({AX,AY},{BX,BY}),
     B = distanceBetweenCoords({BX,BY},{CX,CY}),
     C = distanceBetweenCoords({CX,CY},{AX,AY}),
     A+B+C;

perim({circle, {_,_}, R})
  -> math:pi() * 2 * R;

perim({rectangle, {_,_}, H, W})
  -> H*W*2.


enclose({ra_triangle, {X,Y}, H, W})
  -> {rectangle, {X,Y}, H, W};

% when a triangle (or any shape for that matter is defined by points
% then the enclosing rectangle can be found the the mina dn max of the X and y coordinates
% This could be imroved by creating a min/max function that receives 
% a list of coordinates and returns the max and min for X and Y respectively
enclose({triangle, {AX,AY}, {BX,BY}, {CX,CY}})
  -> X = min(AX, min(BX,CX)),
     Y = min(AY, min(BY,CY)),
     W = max(AX, max(BX,CX)),
     H = max(AY, max(BY,CY)),
     {rectangle, {X,Y}, H, W};

enclose({circle, {X,Y}, R})
  -> {rectangle, {X-R,Y-R}, R*2, R*2}.

% ================
% SUMMING THE BITS
% ================


