function output=num2str3(num)
%Turn number to string with at least 3 characters before decimal point
%
%num2str3(num)
%
%num: (matrix of) numbers, to turn into minimum 3 characters
%
%by David Ryan, UK, 2013 (davidryan1998@hotmail.com)

output=num2strN(num,3,0);

end