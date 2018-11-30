## Author: David Ryan
## Created: 2018-11-30

function [retval] = interpDegree5(numberOfPoints)

  vect1 = interpLinear(numberOfPoints);

  % See DR maths notes on 30th Nov 2018
  retval = 6.*(vect1.^5) - 15.*(vect1.^4) + 10.*(vect1.^3);

endfunction
