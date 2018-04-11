function [retval] = waveformGeneralTrap_Norm (timeV, xV, yV, zV)
 
  % THIS IS AN INNER/PRIVATE FUNCTION!
  % DO ALL ERROR CHECKING ON OUTER FUNCTION
  
  % First, calculate a, b, c, d vectors, the parameters of the trapezium
  bV = (0.5 * yV) .* zV;
  cV = (0.5 * xV) .* (1 - zV);
  dV = (0.5 * zV) .* (2 - yV);
  % aV = 1 - (bV + cV + dV);   % Commented out - redundant variable!
  
  % Then calculate M parameters
  m1V = (0.5 * zV) + cV;
  m2V = ((1/3) * zV) + cV;
  mdV = (m2V - (m1V .* m1V)) .^ 0.5;
  
  % Then calculate linear constants const0 and const1, also phase parameters
  const1V = 1 ./ max((1/6), mdV);
  const0V = 0 - (const1V .* m1V);
  phaseV = bV .* m1V;
  
  % Use an inner function to calculate the trapezium wave between 0 and 1
  fV = waveformGeneralTrap_Inner(timeV + phaseV, bV, cV, dV);
  
  % Final calculation - use scaling constants for a
  % trapezium function with average 0 and sumsq 1
  retval = const0V + (const1V .* fV);
  
endfunction











