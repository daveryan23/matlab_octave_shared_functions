function textOrMatrixToFile(filename,dataToWrite,delimiter,mode)
% Writes matrix contents to file
%
% textOrMatrix2file(filename,dataToWrite,delimiter,mode)
%
% filename = Name of the file to save, i.e. 'text.csv'
% dataToWrite = Location of text or matrix variable
% delimiter = separating sign. For CSV, it is ',': this is default value
% mode = specifies the mode of opening the file. Default 'w' for overwrite,
%        also 'a' for append. Type 'doc fopen' for a detailed list
%
% by Sylvain Fiedler, KA, 2004
% modified by Rob Kohr, Rutgers, 2005 - changed to English and fixed delimiter
% modified by David Ryan, UK, 2012 (davidryan1998@hotmail.com) - changed from cell input to text/matrix input

if nargin<3
    delimiter = ',';
end
if nargin<4
    mode = 'w';
end
data = fopen(filename,mode);

if ischar(dataToWrite)
    % Writing a string to file
    fprintf(data,dataToWrite);
    fprintf(data,'\r\n');
else
    % Writing a matrix to file
    for z=1:size(dataToWrite,1)
        for s=1:size(dataToWrite,2)

            var = dataToWrite(z,s);

            if size(var,1) == 0
                var = '';
            end

            if isnumeric(var) == 1
                var = num2str(var);
            end

            fprintf(data,var);

            if s ~= size(dataToWrite,2)
                fprintf(data,delimiter);
            end
        end
        fprintf(data,'\r\n');
    end
end
fclose(data);
