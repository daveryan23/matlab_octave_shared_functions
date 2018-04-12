function [retval] = waveformTrapeziumGeneral (timeV, pulseDbV, squareDbV, sawtoothDbV, triangleDbV)
  
  % timeV: Vector of discrete times to sample trapezium wave at
  % pulseV, squareV, sawtoothV, triangleV:
  % Shape vectors, in dB
  % Minimum dB is -100, recommend assigning -20 to +40 to control the shape
  
  % Defaults
  minDb = -100;
  maxDb = 100;
  
  % Make variables, if they don't exist
  if nargin<1
    timeV = (0:0.1:1)';
  endif
  if nargin<2
    pulseDbV = minDB;
  endif
  if nargin<3
    squareDbV = minDB;
  endif
  if nargin<4
    sawtoothDbV = minDB;
  endif
  if nargin<5
    triangleDbV = minDB;
  endif
  
  % Make all 5 inputs into column vectors (positive for last four)
  % Record shape of time vector to make output same shape
  colVect = (size(timeV, 2) > size(timeV, 1));
  
  % Straighten time vector into column
  timeV = timeV(:);
  
  % Straighten shape dB vectors, and bound them above and below
  pulseDbV = max(minDb, min(maxDb, pulseDbV(:)));
  squareDbV = max(minDb, min(maxDb, squareDbV(:)));
  sawtoothDbV = max(minDb, min(maxDb, sawtoothDbV(:)));
  triangleDbV = max(minDb, min(maxDb, triangleDbV(:)));
    
  % Make all 5 inputs the same length, using linear interpolation on shape info
  timeLen = length(timeV);
  if length(timeV) != length(pulseDbV)
    pulseDbV = vectorResample(pulseDbV, timeLen);
  endif
  if length(timeV) != length(squareDbV)
    squareDbV = vectorResample(squareDbV, timeLen);
  endif
  if length(timeV) != length(sawtoothDbV)
    sawtoothDbV = vectorResample(sawtoothDbV, timeLen);
  endif
  if length(timeV) != length(triangleDbV)
    triangleDbV = vectorResample(triangleDbV, timeLen);
  endif
  
  % Convert shape vectors from dB to amplitude
  pulseV = 10.^(pulseDbV/20);
  squareV = 10.^(squareDbV/20);
  sawtoothV = 10.^(sawtoothDbV/20);
  triangleV = 10.^(triangleDbV/20);
  
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
    
  % Use eps to prevent division by zero if b or d are zero
  % Note at this stage we should have:
  % 0 <= a, b, c, d <= 1  and
  % a + b + c + d = 1
  timeV = mod(timeV + phaseV, 1);
  ascLineV = timeV./max(eps, bV);
  descLineV = (bV+cV+dV-timeV)./max(eps, dV);
  
  % Trapezium wave has: ascending section, level at 1, descending section, level at 0
  retval = min(min(ascLineV, 1), max(descLineV, 0));
  % This function is now a trapezium wave between 0 and 1
  
  % Final calculation - use scaling constants for a
  % trapezium function with average 0 and sumsq 1
  retval = const0V + (const1V .* retval);
  
  % Make sure retval is same shape as original time vector
  if colVect
    retval = retval';
  endif

endfunction











