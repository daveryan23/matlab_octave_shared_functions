## Author: David Ryan
## Created: 2016-11-02

function [retval] = interpLinear(numberOfPoints)
  
  checkPoints = abs(round(numberOfPoints(1)));
  
  if checkPoints==0
    retval = zeros(0,1);    % Empty column vector
  elseif checkPoints==1
    retval = 0;
  else
    maxVal = checkPoints-1;
    retval = ((0:maxVal)')./maxVal;     % checkPoints equally spaced from 0 to 1
  endif
  
endfunction
