## Author: David Ryan
## Created: 2016-11-02

function [retval] = interpZero(numberOfPoints)
  
  checkPoints = abs(round(numberOfPoints(1)));
  
  retval = zeros(checkPoints,1);     % This works for checkPoints = 0, 1, 2...
  
endfunction
