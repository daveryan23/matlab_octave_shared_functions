## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveform5Square(timeVector)
  
  % Copied from waveformSquare twice, to decouple two functions
  sq1 = -1+2*floor(mod(2*(0.5+timeVector),2));
  sq3 = -1+2*floor(mod(2*(0.5+3*timeVector),2));
  
  % Make a function based on the square wave but which removes
  % all harmonics a multiple of 3
  retval = 0.75*sq1-0.25*sq3;
  
endfunction
