## Author: David Ryan
## Created: 2017-11-26

function [retval] = interpMethods(numberOfPoints, startValue, endValue, methodType)
  
  % Method Type:
  % 0 - zero order interpolation (use start value throughout)
  % 1 - linear interpolation (linear from start to end)
  % 2 - quadratic interpolation with turning point at start
  % 3 - cubic interpolation with turning points at start and end
  % 4 (or -2) - quadratic interpolation with turning point at end
  
  % 11 - linear interpolation of logarithms (then scale back up)
  % 12 - quad
  % 13 - cubic
  % 14 - quad backwards
  
  % numberOfPoints checked on inner script
  start1 = startValue(1);
  end1 = endValue(1);
  method1 = real(methodType(1));
  
  if method1 >= 10
    % Call function with different parameters to get the logarithmic version
    logStartValue = log(max(1e-6, abs(startValue)));
    logEndValue = log(max(1e-6, abs(endValue)));
    % (Start and end values ought to be positive for logarithmic,
    % but do this checking just in case)
    retval = exp(interpMethods(numberOfPoints,logStartValue,logEndValue,methodType-10));
    return;
  endif
  
  diff1 = end1-start1;
  
  switch method1
    case 0
      retval = interpZero(numberOfPoints);
    case 1
      retval = interpLinear(numberOfPoints);
    case 2
      retval = interpQuadFwd(numberOfPoints);
    case 3
      retval = interpCubic(numberOfPoints);
    case 4
      retval = interpQuadBack(numberOfPoints);
    case -2
      retval = interpQuadBack(numberOfPoints);
    otherwise
      % use linear interpolation (case 1)
      retval = interpLinear(numberOfPoints);
  endswitch
  
  retval = start1 + diff1.*retval;
  
endfunction
