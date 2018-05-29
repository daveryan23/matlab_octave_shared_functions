## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformNormalise(audioVect)
  
  % There should be either 1 (mono) or 2 (stereo) columns,
  % and many rows.
  % If there are more columns than rows, transpose audio
  if (size(audioVect,1) < size(audioVect,2))
    audioVect=audioVect';
  endif
  
  % Allow amplitudes between -max and max.
  % Must be within -1 to 1.
  maxAmp = 0.9999;
  
  % Minimum amplitude to increase to maxAmp - must be greater than 0
  minAmp = 0.000001;
  
  % Find the maximum value in both columns, suitably bounded.
  colsMult = max(minAmp,max(max(abs(audioVect))));
  
  retval = maxAmp * (audioVect./colsMult);
  % Note - doing it this way maps a zero to a zero. Probably a good thing.
  
endfunction
