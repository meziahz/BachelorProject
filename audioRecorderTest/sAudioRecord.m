clear
clc
close all

% setup
samplingFreq = 44100; % Hz
bitsPerSample = 16;
nChannels = 1;
deviceId = 0; % use audiodevinfo to find a relavant one
timerPeriod = 0.5; % s
recordingTime = 2; % s

% initialise the recording object
AudioRecObj = audiorecorder(samplingFreq, bitsPerSample, nChannels, ...
    deviceId);
AudioRecObj.set('TimerPeriod', timerPeriod, ...
    'TimerFcn', {@processData}, ...
    'StartFcn', 'disp("Start recording ...")', ...
    'StopFcn', 'disp("... finished recording. ")');
% record some data
recordblocking(AudioRecObj, recordingTime);

% retrieve and plot the recorded data
recData = getaudiodata(AudioRecObj);
nData = length(recData);
timeVector = (0:nData-1)/samplingFreq;
plot(timeVector, recData);
xlabel('Time [s]')
ylabel('Recorded value [.]')



