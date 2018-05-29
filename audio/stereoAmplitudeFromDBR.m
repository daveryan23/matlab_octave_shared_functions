## Author: David Ryan
## Created: 2016-11-02

function [retval] = stereoAmplitudeFromDBR(dBR)
  
  % Input vector(:) of N values representing how much louder R channel is than L channel
  % Suggested range is -50 (almost full L) to +50 (almost full R)
  % Output Nx2 values representing the amplitude onto each stereo channel
  
  ampR = 2./(1+10.^(dBR(:)./20));
  ampL = 2./(1+10.^(-dBR(:)./20));
  % Previous function took square roots of these amplitudes (with a ./10 divisor)
  % This conserved power
  % However, it was thought better to not do that
  % Then the two tracks stereo combined into mono give a constant amplitude
  % In otherwords - split on constant amplitude, not constant power
  
  % Effective range of dBR is around -50 to +50, beyond that there is little difference.
  
  retval = [ampL ampR];
  
endfunction
