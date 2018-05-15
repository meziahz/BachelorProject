info = audiodevinfo;


recorder1 = audiorecorder(96000,24,1,1);
recorder2 = audiorecorder(96000,24,1,5);
recorder3 = audiorecorder(96000,24,1,2);

record(recorder1);
record(recorder2);
record(recorder3);

disp("hello");
pause(5);
disp("end");
%load chirp.mat;
%soundsc(y,96000);
f1 = getaudiodata(recorder1);
f2 = getaudiodata(recorder2);
f3 = getaudiodata(recorder3);
%f1 = xcorr(recorder1,recorder2);
%plot(f1);
%play(recorder1);
soundsc(f1,96000);
soundsc(f2,96000);
soundsc(f3,96000);

%x1_2 = xcorr(f1,f2);
sp1 = subplot(4,1,1);
plot(f1);
sp2 = subplot(4,1,2);
plot(f2);
sp3 = subplot(4,1,3);
plot(f3);

sp4 = subplot(4,1,4);
xc1 = xcorr(f1,f2);
plot(xc1);