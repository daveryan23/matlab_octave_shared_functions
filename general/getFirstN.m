function output=getFirstN(text,N)
%Return the first N letters, lower case, of a string
%
%getFirstN(text,N)
%
%text: string to find first N letters of
%N: maximum number of characters to return
%
%by David Ryan, UK, 2012 (davidryan1998@hotmail.com)

charsToUse=min(N,length(text));
output=lower(text(1:charsToUse));

end