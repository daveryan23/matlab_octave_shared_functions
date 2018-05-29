## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformSquare(timeVector)
  
  retval = -1+2*floor(mod(2*(0.5+timeVector),2));
  
endfunction
