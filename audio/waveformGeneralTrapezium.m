## Copyright (C) 2018 David Ryan
##
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {Function File} {@var{retval} =} sawtooth (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: David Ryan
## Created: 2018-03-15

function [retval] = waveformGeneralTrapezium (timeV, xV, yV, zV)

  % Outer/Public function.
  % CARRY OUT CHECKING ON INPUTS HERE!!

  % timeV should be a vector of times, e.g. for 44100Hz sample rate and
  % 441Hz frequency, use [0, 0.01, 0.02, ...]

  % xV, yV, zV are vectors of same length as timeV
  % which describe the parameters of a general trapezium wave
  % which has extreme cases of pulse, square, sawtooth and triangle.
  % (See DR mathematical notes 13th March 2018)

  % -- ERROR CHECKS --
  % ...
  % -- END OF ERROR CHECKS --

  retval = waveformGeneralTrap_Norm(timeV, xV, yV, zV);

endfunction
