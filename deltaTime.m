%% xcorr Peak investigation
% Intended to check Matrix (value) for higher number to save,
% if no higher value is found after 200k samples since last new highest value loop breaks.
% 
% The highest value will be saved and returned as deltaTime;
%deltaTime(matrix(x),string*,int*)
%
% string* = {'samples', 'seconds'} case insensitive
% int* = {[-infinity;0[,]0;infinity]}




function m1 = deltaTime(inX,time,sampleRate)

largestSum = inX(1);
limiter = 0;
limit = 150000;
sampleStamp = 0;

    for i=2 : 1 : length(inX)
        
        
        if inX(i) > largestSum
            largestSum = inX(i);
            sampleStamp = i;
            limiter = 0;
            %disp(inX(i));
            %disp(largestSum);
            %disp(i);
        elseif limiter < limit
                limiter = limiter+1;             
        end
        if limiter > limit
            break
        end
    end
    if strcmpi(time,'samples')
        m1 = sampleStamp;
    end
    if strcmpi(time,'seconds')
        m1 = sampleStamp / sampleRate;
    end
    disp(m1);
    return 

end