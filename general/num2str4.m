function output=num2str4(num)
%Turn number to string with at least 4 characters before decimal point
%
%num2str4(num)
%
%num: (matrix of) numbers, to turn into minimum 4 characters
%
%by David Ryan, UK, 2013 (davidryan1998@hotmail.com)

output=num2strN(num,4,0);

end