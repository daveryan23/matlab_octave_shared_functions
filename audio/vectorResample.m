## Author: David Ryan
## Created: 2018-01-01

function [retval] = vectorResample(vectorToResample, samplePoints)
  
  % Take a vector and resample it using linear interpolation to have samplePoints points.
  % e.g. fn([1 4 9 16], 7) should return [1 2.5 4 6.5 9 12.5 16]
  
  samplePoints = max(1, round(abs(samplePoints(1))));      % Make a positive integer
  sP1 = samplePoints - 1;
  
  % Shortcut: if only 1 sample point is needed, return it straight away.
  if samplePoints < 2
    retval = vectorToResample(1);
    return
  endif

  colVect = (size(vectorToResample, 2) > size(vectorToResample, 1));
  vectorToResample = vectorToResample(:);
  lV1 = length(vectorToResample)-1;

  % Shortcut: if vector has single element, return a row or col vector of that element
  if lV1 < 1
    retval = vectorToResample(1) * ones(samplePoints, 1);
    if colVect
      retval = retval';
    endif
    return
  endif
  
  index = 1 + (0:sP1)' * (lV1/sP1);
  
  indexLo = floor(index);
  indexHi = ceil(index);
  
  amountHi = index - indexLo;
  amountLo = 1 - amountHi;
  
  retval = amountLo .* vectorToResample(indexLo) + amountHi .* vectorToResample(indexHi);
  if colVect
    retval = retval';
  endif
  
endfunction
