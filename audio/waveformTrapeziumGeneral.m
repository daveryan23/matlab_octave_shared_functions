function [retval] = waveformTrapeziumGeneral (timeV, pulseV, squareV, sawtoothV, triangleV)
  
  % Make variables, if they don't exist
  if nargin<1
    timeV = (0:0.1:1)';
  endif
  if nargin<2
    pulseV = 0;
  endif
  if nargin<3
    squareV = 0;
  endif
  if nargin<4
    sawtoothV = 0;
  endif
  if nargin<5
    triangleV = 0;
  endif
  
  % Make all 5 inputs into column vectors (positive for last four)
  timeV = timeV(:);
  pulseV = abs(pulseV(:));
  squareV = abs(squareV(:));
  sawtoothV = abs(sawtoothV(:));
  triangleV = abs(triangleV(:));
  unitV = 1 + 0*timeV;
    
  % Make all 5 inputs the same length, discarding info if necessary
  if length(timeV) != length(pulseV)
    pulseV = pulseV(1)*unitV;
  endif
  if length(timeV) != length(squareV)
    squareV = squareV(1)*unitV;
  endif
  if length(timeV) != length(sawtoothV)
    sawtoothV = sawtoothV(1)*unitV;
  endif
  if length(timeV) != length(triangleV)
    triangleV = triangleV(1)*unitV;
  endif
  
  % Normalise the shape coords
  invnorm = 1 ./ (pulseV + squareV + sawtoothV + triangleV + 4*eps);
  %pulseV = invnorm .* (pulseV + eps);      % Not subsequently used!
  squareV = invnorm .* (squareV + eps);
  sawtoothV = invnorm .* (sawtoothV + eps);
  triangleV = invnorm .* (triangleV + eps);
  
  % Calculate the a, b, c, d coords
  %aV = pulseV + 0.5*squareV;               % Not subsequently used!
  bV = 0.5*triangleV;
  cV = 0.5*squareV;
  dV = 0.5*triangleV + sawtoothV;
  
  % Then calculate M parameters
  bdV = bV + dV;
  m1V = cV + 0.5*bdV;
  m2V = cV + bdV/3;
  mdV = (m2V - (m1V .* m1V)) .^ 0.5;
  
  % Then calculate linear constants const0 and const1, also phase parameters
  const1V = 1 ./ max((1/6), mdV);
  const0V = 0 - (const1V .* m1V);
  phaseV = bV .* m1V;
  
  % Use an inner function to calculate the trapezium wave between 0 and 1
  fV = waveformTrapeziumGeneral_private(timeV + phaseV, bV, cV, dV);
  
  % Final calculation - use scaling constants for a
  % trapezium function with average 0 and sumsq 1
  retval = const0V + (const1V .* fV);

endfunction











