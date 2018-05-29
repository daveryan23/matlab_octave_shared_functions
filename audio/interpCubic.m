## Author: David Ryan
## Created: 2016-11-02

function [retval] = interpCubic(numberOfPoints)
  
  vect1 = interpLinear(numberOfPoints);
  
  % Maths!
  retval = 3.*(vect1.^2) - 2.*(vect1.^3);
  
endfunction
