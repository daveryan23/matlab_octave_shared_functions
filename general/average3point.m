## Author: David Ryan
## Created: 2016-11-02

function [retval] = average3point(vectorToAverage)
  
  % IMPROVE: Make this function work for row vectors as well as column vectors
  
  % Force to column, slightly extend
  vector2 = [vectorToAverage(1);vectorToAverage(:);vectorToAverage(end)];
  
  % Take a 3 point weighted average.
  retval = 0.25 * vector2(1:end-2) + 0.5 * vector2(2:end-1) + 0.25 * vector2(3:end);
  
endfunction
