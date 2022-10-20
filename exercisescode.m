% % Section 1: Audio
% % 1. Playback the audio file
% [y,Fs]=audioread('handel.wav');
% sound(y,Fs)

[x,fs]=audioread('horn11short.wav');
sound(x,fs)

% 2. Increase the volume by 50%
SampleSound =y;
SampleSoundVup=SampleSound*10;
sound(SampleSoundVup, Fs);
% 
% 3. Decrease the volume by 50%
SampleSoundVdown=SampleSound*0.5;
sound(SampleSoundVdown, Fs);

% 4. Concatenate two audio files and play them back

    [a1 b1] = audioread('handel.wav');
    [a2 b2] = audioread('horn11short.wav');
    [a3 b3] = audioread('chickens.wav');

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
y2 = A2 * sin( 2 * pi * f2 * t + w1 * pi/181 );
y3 = A3 * sin( 2 * pi * f3 * t + w2 * pi/181 );
sound( y, fs, 16 );
y=y1+y2+y3;
plot(t,y);

% Section 2: Images
% 1. Display the red, green and blue channels of the image individually.
RGB=reshape(ones(200,1)*reshape(jet(200),1,600),[200,200,3]);
imshow(RGB)
title('Original RGB Image')
[R,G,B] = imsplit(RGB);
subplot(2,2,1)
imshow(R)
title('Red Channel')

subplot(2,2,2)
imshow(G)
title('Green Channel')

subplot(2,2,3)
imshow(B)
title('Blue Channel')

subplot(2,2,4)
imshow(RGB)
title('Original Image')

% 2. Convert the image into grayscale and increase the overall brightness of the image by a userdefined
% value. Prompt the user for a value (usually between 0-255, think about what to do
% if the final intensity value exceeds 255) and then use that value to increase the overall
% brightness by that amount.
coloured=imread('cat.jpg');   
I = rgb2gray(coloured);
x=input('a value between 0-255/n');
In=I+x;
In(In>=255)=255;
figure()
subplot(1,2,1)
imshow(I)
title('Original')

subplot(1,2,2)
imshow(In)
title('New')

% 3. Cut out a rectangular section from the chosen image, save it and display it as a new image.
% Set the red channel to 0 and display the new image
I=imread('cat.jpg'); 
x1=20;
y1=20;
x2=300;
y2=400;
Ic=I(x1:x2,y1:y2,:);
figure()
subplot(1,3,1)
imshow(I)
title('Original')

subplot(1,3,2)
imshow(Ic)
title('Cut')

subplot(1,3,3)
Icnr=Ic;
Icnr(:,:,1)=0;
imshow(Icnr)
title('Without Red')



% 4. Apply the log the transformation as a contrast enhancement technique on a chosen image
% (do not use MATLAB’s built-in imadjust function). Pick an appropriate value for the
% constant c (refer to lecture slides).
A = imread('cat.jpg');
r=double(A);
C=1;
S=C*log(1+r);
Temp=255/(C*log(256));
%Display image range [0 255]
B=uint8(Temp*S);
figure,imshow(B);title('Log Transformation -> S = clog(1+r)');

% 5. Apply Gamma correction to a chosen image. Make sure you pick an appropriate value of
% c and g (refer to lecture slides).
A = imread('cat.jpg');
r=double(A);
C=1;
G=0.40;%Gamma =0.40
S=C*(r.^G);
Temp=255/(C*(255.^G));
%display image range [0 255]
S1=uint8(Temp*S);
figure,imshow(S1);title('Gamma corrected Image -> S = cr^\gamma  \gamma = 0.40 c = 1');


% Section 3: Video
% Implement features that displays information about the video clip such as:

v = VideoReader('video.MOV');
The duration of the video clip
D = v.Duration;
display(D);
% 
% The pixel dimension of every frame
H = v.Height;
W = v.Width;
display(H);
display(W);

% The dimensionality of the array per frame
% do not understand what required to show
% 
% · Number of bits per pixel
Bpp=v.BitsPerPixel;
display(Bpp);

% · Number of frames per second
Rate=v.FrameRate;
display(Rate);

% · The number of frames within the video clip
NoFrames=v.CurrentTime;
display(NoFrames);

% Implement a feature that allows the video clip to be played back. Within this feature, include a
% code snippet that starts playback from a specified time. The starting time could either be userspecified
% or hard-coded within the code.


