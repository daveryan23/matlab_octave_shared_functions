function output=millisecondDateAndTimeStamp
%Get a timestamp of high accuracy to be used in automatic naming of files
%
%millisecondDateAndTimeStamp
%
%(no inputs)
%
%by David Ryan, UK, 2013 (davidryan1998@hotmail.com)

%Get time and date
dateAndTime=clock;        %clock is an internal variable

%Get individual components
year=dateAndTime(1);
month=dateAndTime(2);
day=dateAndTime(3);
hour=dateAndTime(4);
minute=dateAndTime(5);
second=floor(dateAndTime(6));
millisecond=floor(1000*(dateAndTime(6)-second));

output=[...
    num2str4(year),'-',...
    num2str2(month),'-',...
    num2str2(day),'_',...
    num2str2(hour),'-',...
    num2str2(minute),'-',...
    num2str2(second),'_',...
    num2str3(millisecond)];

end
