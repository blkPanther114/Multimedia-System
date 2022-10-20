%% Part A
img = imread('colors.jpg');
[R,G,B] = imsplit(img);
[yRed,x1] = imhist(R);
[yGreen,x2]= imhist(G);
[yBlue,x3]=imhist(B);
figure;
plot(x1, yRed, 'Red', x2, yGreen, 'Green', x3, yBlue, 'Blue'); title('Colour Histogram');

% figure;
% subplot(1,3,1);
% imhist(R); title('Red Channel');

% subplot(1,3,2);
% imhist(G); title('Green Channel');

% subplot(1,3,3);
% imhist(B), title('Blue Channel');

%% Part B
doubleImg = im2double(img);
doubleHVS= size(doubleImg);
[h,w,d] = size(img);

for x= 1:h 
    for y=1:w
    red= doubleImg(x,y,1);
    green = doubleImg(x,y,2);
    blue = doubleImg(x,y,3);
    I= (0.299 * red + 0.587 * green + 0.114 * blue);
    doubleHVS(x,y) = I;  
    end
end
hvs = im2uint8(doubleHVS);
figure;
subplot(1,2,1);
imshow(img); title('Original Image');
subplot(1,2,2);
imshow(hvs), title('Human Visual System grayscale');

figure;
[yGray, x]=imhist(hvs);
plot(x,yGray); title('Gray Histogram');
%The gray scale histogram follows the same pattern as the colour
%hsistrogram with peaks in frequency a the same places.
%It is close to an average of the frequencies of the threee colour channels


%% Part C

%Regenerating colour histogram using 128 bins for each colour component
[yR,xR] = imhist(R, 128);
[yG,xG]= imhist(G,128);
[yB,xB]=imhist(B,128);
figure;
plot(xR, yR, 'Red', xG, yG, 'Green', xB, yB, 'Blue'); title('Colour Histogram-128 bins');

%Reading from histogram to find bin with most values
%Red- 223
%Green- 231
%Blue-237

