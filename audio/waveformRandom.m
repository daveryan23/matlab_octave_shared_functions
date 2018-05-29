## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformRandom(timeVector, randSample)
  
  % ASSUMING THAT randSample is between 0 and 1
  
  % Input randSample to allow re-use of the same (long-ish) random vector
  % Too small = sounds periodic
  % Too long = computationally expensive
  % Use an input vector of maybe 20000 (roughly half a second at 44100Hz sample rate)
  
  randSample = randSample(:);
  % Straighten any input matrix into column vector here.
  
  lenSample = length(randSample);
  timeVector = floor(mod(timeVector + lenSample*rand,lenSample)+1);
  % Can now use vector2 to resample (at a random position) from the random sample
  
  retval = -1 + 2*randSample(timeVector);
  % Return a random wave between -1 and 1
  
endfunction
