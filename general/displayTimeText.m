% Output to the user the total time taken
%
% by David Ryan, UK, 2012 (davidryan1998@hotmail.com)

% Important: To get this to time correctly, call "tic" at the start of timed section.

function displayTimeText

  totalSeconds=toc;
  days=floor(totalSeconds/(24*60*60));
  hours=floor(totalSeconds/(60*60)-days*24);
  minutes=floor(totalSeconds/60-days*24*60-hours*60);
  seconds=floor(totalSeconds-days*24*60*60-hours*60*60-minutes*60);
  milliseconds=floor(totalSeconds*1000-days*24*60*60*1000-hours*60*60*1000-minutes*60*1000-seconds*1000);
  timeText=['Time taken: ',num2str(days),' days, ',num2str2(hours),':',num2str2(minutes),':',num2str2(seconds),' (',num2str3(milliseconds),'ms)'];
  disp(timeText);
  disp(' ');

end
