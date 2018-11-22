function output=openFileWithHeaders(fileToRead,delimiter,headerLines) 
%This function opens a file with headers and returns a cell array with
%output{1} = headers (text)
%output{2} = data (matrix)
%
%openFileWithHeaders(fileToRead,delimiter,headerLines)
%
%fileToRead = any file with text on the 1st line (header), numeric data below. A wide variety of files are in this format, hence the common function.
%delimiter = the file delimiter. Defaults to ','
%headerLines = the number of lines of header at the top. Defaults to 1
%
%Note - this function will not work if the number of headerlines are not specified correctly.
%
%by David Ryan, UK, 2012 (davidryan1998@hotmail.com)

%% Do parameter checks
if nargin<2
    delimiter=',';
end

if nargin<3
    headerLines=1;
end

%% Import the file
newData=importdata(fileToRead,delimiter,headerLines);

%% Extract variables
if isnumeric(newData)          %Its a matrix
    data=newData;
    headers='';
else                           %Its a struct. data accesses matrix, textdata accesses headers
    data=newData.('data');
    headers=newData.('textdata');
end

%% Provide a cell array for text then matrix output
output={headers data};

