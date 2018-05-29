## Author: David Ryan
## Created: 2016-11-02

function [retval] = averageMoving(vectorToAverage, numberOfPoints)
  
  vectorToAverage = vectorToAverage(:);    % Make any matrix into a column vector
  len1 = length(vectorToAverage);  % Returned smoothed vector will be same length as this
  
  offset2 = min(1000000,max(0, round((numberOfPoints(1) - 1 ) / 2 )));  % 0, 1, 2, 3...
  points2 = offset2 * 2 + 1;                                     % 1, 3, 5, 7...
  
  if (offset2 == 0)
    retval = vectorToAverage;    % Moving average on 1 point returns straightened vector
    return
  endif
  
  vector2 = [vectorToAverage(1)*ones(offset2,1) ; vectorToAverage ; vectorToAverage(end)*ones(offset2,1)];
  vector3 = [0;cumsum(vector2)];
  
  vectStart = vector3(1:len1);
  vectEnd = vector3((end-len1+1):end);
  
  retval = (vectEnd - vectStart)/points2;
  
endfunction
