## Author: David Ryan
## Created: 2016-11-02

function [retval] = interpQuadBack(numberOfPoints)
  
  vect1 = interpLinear(numberOfPoints);
  
  % Simple maths / algebra here
  retval = 2.*vect1 - vect1.^2;
  
endfunction
