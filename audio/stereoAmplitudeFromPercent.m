## Author: David Ryan
## Created: 2016-11-02

function [retval] = stereoAmplitudeFromPercent(percentValueVect)
  
  % Input vector(:) of N values in the range -100 (L) to 0 (M) to +100 (R)
  
  percentPos = max(-1, min(1, percentValueVect(:)./100));
  ampR = 1 + percentPos;
  ampL = 1 - percentPos;
  
  retval = [ampL ampR];
  
endfunction
