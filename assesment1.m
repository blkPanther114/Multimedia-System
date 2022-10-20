% 1:
% a) Download the .wav file given. Read the audio file and specify the
% sampling rate and the total number of samples. Is the sample rate the same
% as the Nyquist rate? (3 Marks)
[y,Fs]=audioread('piano2.wav');
sound(y,Fs)
display(Fs);

%  info = audioinfo(TotalSamples);
% Not exactly the same, since Nyquist Rate is a simple measure to decide what
% should be the sampling rate for a given analog audio signal, if a given audio
% signal has a frequency of 15kHz, the Nyquist rate must be at least 2*15kHz = 30 kHz
%  then the sampling rate must at least be 30ksps.


% b) Generate an audio signal “y1” with a frequency of 880 Hz and an amplitude
% of 0.5. Subtract the above audio signal from itself, playback and plot the
% signal (You need to pick a suitable sampling rate). Note down and explain
% your observations. (4 Marks)

 minSR = 880*2;
fs =40000;       
t = 0 : 1/fs : 2; 
f = 176;           
A = 0.5;           
w = 0 * pi/180; % degrees 
y1 = A * sin( 2 * pi * f * t + w );
sound( y1, fs, 16 );
plot(y1);
xlabel('Time');
ylabel('Amplitude');
% i've heard a consistant  "beep" sound this time

% c) Generate another audio signal “y2” with a frequency of 880 Hz, amplitude
% of 0.5, but with a phase difference of 360o. Add “y1” and “y2” to generate a
% new audio signal. Playback and plot the signal. Note down and explain your
% observations. (3 Marks)

fs =40000;       
t = 0 : 1/fs : 2; 
f = 176;           
A = 0.5;           
w = 0 * pi/360; % degrees 
y2 = A * sin( 2 * pi * f * t + w );
sound( y2, fs, 16 );
y = (y1+y2);
sound( y, fs, 16 );
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
%the sound is similar to the previous one

% 2:
% a) Plot the histogram of a colour image along its RGB colour channels. You
% can show them in a single plot or 3 separate plots. (3 Marks)

%Split into RGB Channels
input=imread('colors.jpg'); 
    Red = input(:,:,1);
    Green = input(:,:,2);
    Blue = input(:,:,3);
%Get histValues for each channel
    [yRed, x] = imhist(Red);
    [yGreen, x] = imhist(Green);
    [yBlue, x] = imhist(Blue);
    %Plot them together in one plot
%     plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue');

% b),Convert the image into a grayscale image and plot the histogram. Do you
% observe any correlation between the colour and grayscale histograms? (3
% Marks)

gray = rgb2gray(input);   % convert a color image to grayscale
% imhist(gray) 

figure (1);
subplot(1,2,1);imshow(input) ; title("original image");
subplot(1,2,2);imshow(gray) ; title("grayscale image");


figure (2);
subplot(1,2,1);plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue') ; title("RGB");
subplot(1,2,2);imhist(gray) ; title("grayscale");
%the histogram of an image  refers to a histogram of the pixel intensity values.
%  histogram is a graph showing the number of pixels in an image at each different intensity value found in that image.
% For an 8-bit grayscale image there are 256 different possible intensities, and so the histogram will graphically display 
% 256 numbers showing the distribution of pixels amongst those grayscale values. Histograms can also be taken of color 
% images --- % with the three axes representing the red, blue and green channels, and brightness at each point representing the pixel count. 
% comparing the two histogram, the red channel in the intensity values from
% 0-25 is higher than the one in the grayscale histogram, which indicate
% the red pixels in original image presented more obvious in the original
% image.


% c) Try to regenerate the colour histograms but with 128 bins for each colour
% component. Identify which bins have the most pixels for each RGB colour.
% (4 Marks)

% input=imread('colors.jpg'); 
Red= randn(1000,1);
nbins = 128;

% r = histogram(Red,nbins);

Green= randn(1000,1);
nbins = 128;
% figure(4);
% g = histogram(Green,nbins);

Blue= randn(1000,1);
nbins = 128;
% figure(5);
% b = histogram(Blue,nbins);

 figure(3);
subplot(1,3,1);r = histogram(Red,nbins); title("red");
subplot(1,3,2);g = histogram(Green,nbins); title("green");
subplot(1,3,3);b = histogram(Blue,nbins) ; title("blue");


