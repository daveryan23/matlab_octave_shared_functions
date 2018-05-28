## Author: David Ryan
## Created: 2018-05-28


function [retval] = averageIterateMoving(vector1, points1, iterations)
  
  % iterations:
  % 0 is zero interpolation
  % 1 is linear interpolation
  % 2 is quadratic
  % 3 is cubic
  % 4 is quartic
  % etc
  
  % Make number of iterations an integer between 0 and 20
  iter = max(0,min(20,round(real(iterations(1)))));
  
  if iter < 0.5
    retval = averageMoving(vector1,1);      % Call at least once, for consistent formatting
  else
    retval = averageIterateMoving(
      averageMoving(vector1, points1),
      points1,
      iter - 1    
    );
  endif
  
endfunction
