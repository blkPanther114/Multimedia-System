%% Part A
[y,Fs] = audioread('piano2.wav');
Fs
%Fs is the sampling rate of the audio file
%Fs= 4800 samples per second

info=audioinfo('piano2.wav');
info

%Info displays informationaabout the audio file including the total number
%of samples.
%The total number of samples taken for this file is 302712 samples

%Nyquist rate is the minimum sampling rate required to sample an audio file
%Nyquist rate= Twice the highest frequency in the file

% maximum= max(y(:,:))
%max = 0.59 kHZ which means that the nyquist rate would be 1.18 KHZ or 1180 samples per second 

%This audio is samples at a hiigher rate than the nyquist rate

%% Part B
fs = 1900;     
t = 0 : 1/fs : 2; 
f = 880;            
A = 0.5;            
w = 0 * pi/180; % degrees 
y1 = A * sin( 2 * pi * f * t + w );
y1_subtract= y1-y1;
% sound( y1_subtract, fs, 16 );
figure;
plot(y1_subtract); title('Part B');

%The audio has a max frequency of 880 Hz.
%The minimum sampling rate or Nyquist rate of the file is:
%2 x 880 = 1760Hz=1.8kHz-> minimum sampling rate = 1.8 ksps
%Using a value of 1900 for accuracy

%The signal subtracted from itself leaves a rtotal overall amlitude value
%of 0.
%Therefore, you cannot hear the final audio

%% Part C
fs = 1900; % sampling frequency (Hz)
t = 0 : 1/fs : 2; % time axis (seconds)
f2 = 880;
A2 = 0.5;
w2 = 360* pi/180; % phase in degrees
y2 = A2 * sin( 2 * pi * f2 * t + w2 );
final = y1+y2;
% sound( final, fs, 16 );
figure;
plot(t,final); title ('Part C');

%A phase difference of 360 degrees is quivalent to shifting the dsignal by
%one whole cycle.
%Therefore, when the two signals are added together, tit is in effect
%making a signal which has double the frwuency of the y1 and y2.
%Therefore, the pitch of this signal is higher.

