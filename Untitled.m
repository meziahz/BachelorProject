recObj1 = audiorecorder;

recObj1 with properties:
 
          SampleRate: 96000000
       BitsPerSample: 24
    NumberOfChannels: 1
            DeviceID: -1
       CurrentSample: 1
        TotalSamples: 0
             Running: 'off'
            StartFcn: []
             StopFcn: []
            TimerFcn: []
         TimerPeriod: 0.0500
                 Tag: ''
            UserData: []
                Type: 'audiorecorder'
                
               
recObj2 with properties:

          SampleRate: 96000000;
       BitsPerSample: 24;
    NumberOfChannels: 1;
            DeviceID: -2;
       CurrentSample: 1;
        TotalSamples: 0;
             Running: 'off';
            StartFcn: [];
             StopFcn: [];
            TimerFcn: [];
         TimerPeriod: 0.0500;
                 Tag: '';
            UserData: [];
                Type: 'audiorecorder';
       
recObj3 with properties:

          SampleRate: 96000000;
       BitsPerSample: 24;
    NumberOfChannels: 1;
            DeviceID: -3;
       CurrentSample: 1;
        TotalSamples: 0;
             Running: 'off';
            StartFcn: [];
             StopFcn: [];
            TimerFcn: [];
         TimerPeriod: 0.0500;
                 Tag: '';
            UserData: [];
                Type: 'audiorecorder';
 
             
                
                
disp('Start speaking.')
recordblocking(recObj1, 5);
disp('End of Recording.');
disp('Start speaking.')
recordblocking(recObj2, 5);
disp('End of Recording.');
disp('Start speaking.')
recordblocking(recObj3, 5);
disp('End of Recording.');