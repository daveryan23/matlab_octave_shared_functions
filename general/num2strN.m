function output=num2strN(num,N,k)
%Turn number to string, returning at least N characters before decimal point, and k decimal places
%
%num2strN(num,N,k)
%
%num: (matrix of) numbers, to turn into minimum N characters
%N: integer, minimum number of characters to return before decimal point
%k: maximum number of decimal places (set to 0 for integer, -1 for all decimal places)
%
%by David Ryan, UK, 2013 (davidryan1998@hotmail.com)

%WOULD BE NICE to check whether inputs are numeric
%WOULD BE NICE to allow 'num' to be a vector or matrix
%SOME ROUNDING ERROR to sort out, but OK for file labels.

N=max(1,floor(N));     %Positive integer
k=max(-1,floor(k));     %Non-negative integer, -1 means 'all decimal places'
k10=10.^k;

num=real(num);         %Only want to deal with real numbers

numSgn=sign(num);      %1 for positive, 0 for zero, -1 for negative
numAbs=abs(num);       %always positive or zero

numAbsInt=fix(numAbs);       %Round positive or negative numbers towards zero - could have used 'floor' for positive numbers
numAbsDec=numAbs-numAbsInt;     %Decimal places only
if k==-1
    numAbsDecRounded=numAbsDec;
else
    numAbsDecRounded=round(numAbsDec*k10)/k10;
end

text1=num2str(numAbsInt);
zerosNeeded=max(0,N-length(text1));

%Deal with sign
if numSgn==-1
    output='-';
else
    output='';
end

%Deal with text before decimal place
output=[output,repmat('0',1,zerosNeeded),num2str(numAbsInt)];

%Deal with text after decimal place
if k==0 || numAbsDecRounded==0
    %If number of decimal places is zero, or rounded dec places are zero, do nothing else
else
    text2=num2str(numAbsDecRounded);
    output=[output,text2(2:end)];    %Insert all rounded decimal places except for initial 0
end

end