## Author: David Ryan
## Created: 2018-02-17

function [retval] = waveformWhiteNoise(timeVector)
  
  % Ignores the input completely, except to obtain a size vector for the output!
  
  retval = -1 + 2 * rand(size(timeVector,1), size(timeVector,2));
  % Return white noise between -1 and 1 of the same size as input
  
endfunction
