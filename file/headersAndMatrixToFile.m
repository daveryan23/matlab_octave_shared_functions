function headersAndMatrixToFile(outputFilename,outputHeaders,outputMatrix,delimiter)
%Writes one line of text to file, then writes a matrix to file, all in delimited format
%
%headerAndMatrix2file(outputFilename,outputHeaders,output,delimiter)
%
%outputFilename = filename to write to
%outputHeaders = one line of text to put at top
%output = a matrix to write to file
%delimiter = the delimiter used in headers (default is ',')
%
%by David Ryan, UK, 2012 (davidryan1998@hotmail.com)

if nargin<4
    delimiter=',';
end

% Write headers as 1 line of text
textOrMatrixToFile(outputFilename,outputHeaders,delimiter,'w');

% Append output as a (default comma separated) matrix
textOrMatrixToFile(outputFilename,outputMatrix,delimiter,'a');
