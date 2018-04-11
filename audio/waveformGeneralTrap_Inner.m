function [retval] = waveformGeneralTrap_Inner (timeV, bV, cV, dV)
 
  % Use eps to prevent division by zero if b or d are zero
  % Note we should have:
  % 0 <= a, b, c, d <= 1  and
  % a + b + c + d = 1
  timeV = mod(timeV, 1);
  ascLineV = timeV./max(eps, bV);
  descLineV = (bV+cV+dV-timeV)./max(eps, dV);
  
  % Trapezium wave has: ascending section, level at 1, descending section, level at 0
  retval = min(min(ascLineV, 1), max(descLineV, 0));
  
endfunction











