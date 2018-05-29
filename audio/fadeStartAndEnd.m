## Author: David Ryan
## Created: 2017-05-03

function [retval] = fadeStartAndEnd(waveform, samplesAtStart, samplesAtEnd, dBReduce)
  
  % Fade the start and end of a track by a certain number of dB
  % dBReduce should be a negative number, e.g. -30
  
  % Check input
  samplesAtStart = round(abs(samplesAtStart(1)));
  samplesAtEnd = round(abs(samplesAtEnd(1)));
  samplesBoth = samplesAtStart+samplesAtEnd;
  dBReduce = max(-200,min(-1,-abs(dBReduce(1))));
  lenWave = length(waveform);
  
  if samplesBoth>lenWave
    samplesAtStart = round(samplesAtStart./samplesBoth);
    samplesAtEnd = round(samplesAtEnd./samplesBoth);
  endif
  
  % Fade from 0 to 1 at start
  tempPadAmp = dBReduce.*(1-interpLinear(samplesAtStart));
  tempPadAmp = 10.^(tempPadAmp./20);
  tempRange = 1:samplesAtStart;
  waveform(tempRange) = waveform(tempRange).*tempPadAmp;
  
  % Fade from 1 to 0 at end
  tempPadAmp = dBReduce.*(interpLinear(samplesAtEnd));
  tempPadAmp = 10.^(tempPadAmp./20);
  tempRange = (lenWave-samplesAtEnd+1):lenWave;
  waveform(tempRange) = waveform(tempRange).*tempPadAmp;
  
  retval = waveform;
  
endfunction
