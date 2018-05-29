## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformTrapeziumBasic(timeVector)
  
  % Trapezium wave sloping 1/4 of the time (1 of time for triangle, 0 for square)
  retval = max(-1,min(1,4.*waveformTriangle(timeVector)));
  
endfunction











