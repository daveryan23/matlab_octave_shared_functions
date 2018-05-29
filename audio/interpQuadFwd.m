## Author: David Ryan
## Created: 2016-11-02

function [retval] = interpQuadFwd(numberOfPoints)
  
  retval = interpLinear(numberOfPoints).^2;
  
endfunction
