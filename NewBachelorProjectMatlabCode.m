info = audiodevinfo;
%running = true;

% setup
samplingFreq = 96000; % Hz
bitsPerSample = 24;
nChannels = 1;
mic1ID = 1;
mic2ID = 2;
mic3ID = 3;
timerPeriod = 0.5; % s
recordingTime = 2; % s

% initialise the recording object

s = daq.createSession('session');


recorder1 = audiorecorder(samplingFreq, bitsPerSample, nChannels, ...
    mic1ID);
%set(recorder1,'TimerPeriod',0.5,'TimerFcn',{@myawsomefunc});
recorder2 = audiorecorder(samplingFreq, bitsPerSample, nChannels, ...
    mic2ID);
recorder3 = audiorecorder(samplingFreq, bitsPerSample, nChannels, ...
    mic3ID);
recorder1.set('TimerPeriod', timerPeriod, ...
    'TimerFcn', {@processData}, ...
    'StartFcn', 'disp("Start recording ...")', ...
    'StopFcn', 'disp("... finished recording. ")');
recorder2.set('TimerPeriod', timerPeriod, ...
    'TimerFcn', {@processData}, ...
    'StartFcn', 'disp("Start recording ...")', ...
    'StopFcn', 'disp("... finished recording. ")');
recorder3.set('TimerPeriod', timerPeriod, ...
    'TimerFcn', {@processData}, ...
    'StartFcn', 'disp("Start recording ...")', ...
    'StopFcn', 'disp("... finished recording. ")');
% record some data
s.isContinous = true;
record(recorder1, recordingTime);
record(recorder2, recordingTime);
record(recorder3, recordingTime);
pause(2);
% retrieve and plot the recorded data
recData1 = getaudiodata(recorder1);
recData2 = getaudiodata(recorder2);
recData3 = getaudiodata(recorder3);
nData1 = length(recData1);
nData2 = length(recData2);
nData3 = length(recData3);

timeVectorMic1 = (0:nData1-1)/samplingFreq;
timeVectorMic2 = (0:nData2-1)/samplingFreq;
timeVectorMic3 = (0:nData3-1)/samplingFreq;
f1 = plot(timeVectorMic1, recData1);

f2 = plot(timeVectorMic2, recData2);

f3 = plot(timeVectorMic3, recData3);








%while running == true

%record(recorder1);
%record(recorder2);
%record(recorder3);
   % if input('s')
   %     running = false;
   %     break
   % else
   %     running = false;
   % end
%end
%disp("hello");
%pause(2);
%disp("end");
%load chirp.mat;
%soundsc(y,96000);
%f1 = getaudiodata(recorder1);
%f2 = getaudiodata(recorder2);
%f3= getaudiodata(recorder3);
%f1 = xcorr(recorder1,recorder2);
%plot(f1);
%play(recorder1);
%soundsc(f1,96000);
%soundsc(f2,96000);
%soundsc(f3,96000);

%x1_2 = xcorr(f1,f2);
sp1 = subplot(6,1,1);
f1;
xlabel('Time [s]')
ylabel('Recorded value [.]')
sp2 = subplot(6,1,2);
f2;
xlabel('Time [s]')
ylabel('Recorded value [.]')
sp3 = subplot(6,1,3);
f3;
xlabel('Time [s]')
ylabel('Recorded value [.]')

sp4 = subplot(6,1,4);
xc12 = xcorr(recData1,recData2);
dTimexc12 = deltaTime(xc12,'seconds',samplingFreq);
plot(xc12);

sp5 = subplot(6,1,5);
xc23 = xcorr (recData2,recData3);
dTimexc23 = deltaTime(xc23,'seconds',samplingFreq);
plot(xc23);

sp6 = subplot(6,1,6);
xc31 = xcorr (recData3,recData1);
dTimexc31 = deltaTime(xc31,'seconds',samplingFreq);
plot(xc31);

%running = true;
%% Below this line, triangulation is perfermed:

distanceMic12 = 1; %cm
distanceMic13 = 1; %cm
distanceMic23 = 1; %cm

propagationspeed = 5*10^5; %cm/s ---- just a random number i put in

theta1 = acos(distanceMic12/(dTimexc12*propagationspeed)); % angle to touch point, conceptual equation
disp(theta1);
% unfinished

