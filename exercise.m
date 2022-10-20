% [y,Fs]=audioread('handel.wav');
% Not exactly the same, since Nyquist Rate is a simple measure to decide what 
% should be the sampling rate for a given analog audio signal, if a given audio
signal has a frequency of 15kHz, the Nyquist rate must be at least 2?15kHz = 30 kHz
if the Nyquist rate is 30 kHz, then the sampling rate must at least be 30ksps.

% Yes, because Nyquist rate is twice the maximum frequency of the signal , 
% and is the minimum sampling rate that can resolve the signal.

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

gray = rgb2gray(input);   % convert a color image to grayscale
% imhist(gray) 
figure (1);
subplot(1,2,1);imshow(input) ; title("original image");
subplot(1,2,2);imshow(gray) ; title("grayscale image");

figure (2);
subplot(1,2,1);plot(x, yRed, 'Red', x, yGreen, 'Green', x, yBlue, 'Blue') ; title("RGB");
subplot(1,2,2);imhist(gray) ; title("grayscale");
% In an image processing context, the histogram of an image normally refers to a histogram of the pixel intensity values.
%  histogram is a graph showing the number of pixels in an image at each different intensity value found in that image.
% For an 8-bit grayscale image there are 256 different possible intensities, and so the histogram will graphically display 
% 256 numbers showing the distribution of pixels amongst those grayscale values. Histograms can also be taken of color 
% images --- 
% with the three axes representing the red, blue and green channels, and brightness at each point representing the pixel count. 
