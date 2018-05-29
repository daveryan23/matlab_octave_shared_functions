## Author: David Ryan
## Created: 2016-11-02

function [retval] = waveformSawtooth(timeVector)

retval = 1 - 2 * (timeVector - floor(timeVector));
% Return a sawtooth wave between -1 and 1

% Note: in May 2017 this was inverted, previously -1 + 2 * ...
% This was in order to make the waveform agree with the natural sawtooth
% which is s1 + (1/2)s2 + (1/3)s3... (sN is sin(2*pi*N*t))
% This aids additive processing with sawtooths / squares of different frequencies.

endfunction
