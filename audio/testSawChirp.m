## Author: David Ryan
## Created: 2016-11-02

function [retval] = testSawChirp
  
  vect1 = (-4:0.0002:16)';      % From 1/16 Hz to 65536 Hz
  vect2 = 2.^vect1;
  vect3 = waveformSawtooth (vect2);
  
  retval = [zeros(50000,1);vect3;zeros(15000,1)];
  
endfunction
