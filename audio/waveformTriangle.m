## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformTriangle(timeVector)
  
  % Adjust phase so that final wave starts at 0 ascending
  timeVector = timeVector+0.25;
  
  % This gives a sawtooth period 1
  timeVector = timeVector - floor(timeVector);  
  
  % This gives a triangle period 1, from 0 to 0.5
  timeVector = min(timeVector,1-timeVector);
  
  % After scaling, it has mean 0 and amplitude 1
  retval = 4*timeVector - 1;
  
endfunction











