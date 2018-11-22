## Author: David Ryan
## Created: 2018-02-23

% Extract a field from a struct, or else return a default value

function [retval] = getParam(options, field, defaultValue)

  % options is a struct
  retval = "";
  if isfield(options, field)
    retval = getfield(options, field);
  else
    retval = defaultValue;
  end

endfunction
