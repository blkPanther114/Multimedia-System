% Section 1: Audio
% 1. Playback the audio file
[y,Fs]=audioread('handel.wav');
sound(y,Fs)

[x,fs]=audioread('horn11short.wav');
sound(x,fs)

% 2. Increase the volume by 50%
SampleSound =y;
SampleSoundVup=SampleSound*10;
sound(SampleSoundVup, Fs);
% 
% 3. Decrease the volume by 50%
SampleSoundVdown=SampleSound*1.5;
sound(SampleSoundVdown, Fs);

% 4. Concatenate two audio files and play them back

    [a1, b1] = audioread('handel.wav');
    [a2, b2] = audioread('horn11short.wav');
    [a3, b3] = audioread('chickens.wav');

sound([a1;a2],b1);

% 5. Prompt the user asking for the value of an amplitude A and frequency, f. Use those values
% to generate a 3 sine wave audio signals with values (A, f), (A/2, 2f) and (A/3, 3f). Create a
% tone by combining them (they can be combined in various ways).
[y,F]=audioread('handel.wav');
plot(y);
xlabel('Time');
ylabel('Amplitude');

% y = A * sin( 2 * pi * f * t + w );
% y(t) : the sound signal is a function of time t
% A = Amplitude of the signal
% f = frequency of the audio signal
% w= how much does the signal shift

% signals with values (A, f),(A/2, 2f) and (A/3, 3f).
fs = 44100;       
t = 0 : 1/fs : 2; 
f = 200;           
A = 0.2;

A2=A/2;
f2=f*2;

A3=A/3;
f3=f*3;
w = 0 * pi/180; % degrees 
y1 = A * sin( 2 * pi * f * t + w );
y2 = A2 * sin( 2 * pi * f2 * t + w * pi/181 );
y3 = A3 * sin( 2 * pi * f3 * t + w * pi/181 );
sound( y, fs, 16 );
y=y1+y2+y3;
plot(t,y);
