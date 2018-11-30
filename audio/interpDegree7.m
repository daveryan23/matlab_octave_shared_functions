## Author: David Ryan
## Created: 2018-11-30

function [retval] = interpDegree7(numberOfPoints)

  vect1 = interpLinear(numberOfPoints);

  % See DR maths notes on 30th Nov 2018
  retval = -20.*(vect1.^7) + 70.*(vect1.^6) - 84.*(vect1.^5) + 35.*(vect1.^4);

endfunction
