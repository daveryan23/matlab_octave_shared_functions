function output = getRandomSubsetOfValues(numberToChoose,totalNumber,outputFormat)
  %Obtain exactly numberToChoose distinct values
  %from the vector 1:totalNumber, in increasing value
  %
  %getRandomSubsetOfValues(numberToChoose,totalNumber)
  %
  %numberToChoose is between 0 and totalNumber
  %totalNumber is 0 or greater
  %outputFormat=0 (or omitted) gives only numberToChoose selected elements
  %outputFormat=1 gives set and excluded set (concatenated)
  %outputFormat=2 gives set and excluded set (as cell structure)%
  %
  %by David Ryan, UK, 2012 (davidryan1998@hotmail.com)


  %ALLOW FOR VARIABLE NUMBER OF INPUTS
  if nargin<1
    %Random number between 1 and 10 as default
    numberToChoose=10;
  endif
  if nargin<2
    %Random number between 1 and numberToChoose as default
    totalNumber=numberToChoose;
    numberToChoose=1;
  endif
  if nargin<3
    %Default output format is numberToChoose numbers between 1 and totalNumber
    outputFormat=0;
  endif


  %CHECK INPUT VALUES
  %Make sure outputFormat is a recognised value
  if outputFormat~=1 && outputFormat~=2
    outputFormat=0;
  endif

  %Make sure both k, n are in range 0..BigNumber, integers
  fnLimit=60000;         %BigNumber
  k=uint16(max(0,min(fnLimit,numberToChoose)));
  n=uint16(max(0,min(fnLimit,totalNumber)));

  %Make sure k is not greater than n
  if k>n
    %Assume they have inputted the numbers in the wrong order!
    k0=n;
    n=k;
    k=k0;
  endif

  %Use a reverse algorithm if k is greater than half n
  if 2*k>n
    reverseAlg=1;
    k=n-k;
  else
    reverseAlg=0;
  endif


  %START ALGORITHM
  %v1 is original set of numbers from 1 to n. It will have elements taken out.
  v1=1:n;

  %v2 is starting off empty, and will have things added in to it.
  v2=v1(1:k);     %Take only k elements
  v2=v2-v2;       %Zero each element

  for c=1:k
    lenV=length(v1);       %v1 will get shorter!
    randIndex=randi(lenV); %select a random integer as index
    elt=v1(1,randIndex);   %get the random element
    v1L=[];
    v1R=[];
    if randIndex>1
      v1L=v1(1,1:randIndex-1);
    endif
    if randIndex<lenV
      v1R=v1(1,randIndex+1:lenV);
    endif
    v1=[v1L,v1R];          %exclude random element from v1
    v2(1,c)=elt;           %add random element to v2
  endfor

  v2=sort(v2);               %re-order v2 in ascending order

  if outputFormat==0
    %Only included numbers
    if reverseAlg
      output=v1;
    else
      output=v2;
    endif
  else if outputFormat==1
    %Excluded numbers given as well after included numbers
    if reverseAlg
      output=[v1,v2];
    else
      output=[v2,v1];
    endif
  else
    %outputFormat=2
    %Excluded numbers given in a second cell entry
    if reverseAlg
      output={v1,v2};
    else
      output={v2,v1};
    endif
  endif

end
