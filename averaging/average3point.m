## Author: David Ryan
## Created: 2016-11-02

function [retval] = average3point(vectorToAverage)

  % Working only with vectors
  % Force to column at start, change to row later if input is row.
  % Slightly extend to enable averaging.
  vector2 = [vectorToAverage(1);vectorToAverage(:);vectorToAverage(end)];

  % Take a 3 point weighted average.
  retval = 0.25 * vector2(1:end-2) + 0.5 * vector2(2:end-1) + 0.25 * vector2(3:end);

  if size(vectorToAverage,2) > size(vectorToAverage,1)
    retval = retval';
  endif

endfunction
