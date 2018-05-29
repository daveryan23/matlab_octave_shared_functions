## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformBandPass(audioVect, sampleRate)
  
  if (nargin < 2)
    sampleRate = 44100;
  endif
  
  % Filter out most of the stuff below 30 Hz and approaching the Nyquist frequency sampleRate/2
  
  % Perform a quadratic (2-stage) smoothing step to remove stuff near Nyquist frequency
  % Removes the high (H) frequencies
  audioLM = average3point(average3point(audioVect(:)));
  
  % Perform a long moving average (roughly 1100 points for 44100Hz sample rate)
  % which preferentially filters out low frequencies below 30Hz
  % Isolate the low (L) frequencies)
  param1 = floor(sampleRate(1)/40);
  param2 = param1 + 10;
  audioL = (averageMoving([0;audioLM;0],param1))(2:end-1);
  audioL = (averageMoving([0;audioL;0],param2))(2:end-1);
  % This adds a zero at start and end, does a moving average, truncates the outer 2 points.
  
  % Return only the mid range (M) frequencies
  retval = audioLM - audioL;
  
endfunction
