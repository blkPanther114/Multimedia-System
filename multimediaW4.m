%Exercise 1
A = imread ('sparrow.jpg');
figure(1);
imshow(A);

%Exercise 2
[h,w,d]=size(A);

%Exercise 3;
A_gray = 0.299*(A(:,:,1))+0.587*(A(:,:,2))+0.114*(A(:,:,3));
A_gray=uint8(A_gray); 
%Convert back to unsigned integer
figure(2);
subplot(1,2,1); imshow(A_gray); 

% For comparision to the formula given in the class
doubleA = rgb2gray(A);
subplot(1,2,2); imshow(doubleA); title("rgb2gray");

% According to figure 2, the averaging value for value green is bigger, 
% in this case, the difference between using the averaging formula and the 
% built-in function rgb2gray will be more obvious when applying to the
% image which contains more green color, the image that applying the
% averaging formula will be darker than the pic using rgb2gray
% For example, using the tree.jpg, the color on the leaves area will be
% darker


%Exercise 4
% A(A==255)=0;
% A(A==0)=255;
% imshow(A);
% Negate 0 to 255, 255 to 0, 1 to 254, 2 to 253, 3 to 252
% can be achieved using 255-x, for example, x=3, 255-3=252
% which simply means change the color white to black, black to white
% using the sparrow.jpg will have a better observation
% the bird's eye change from black to white
A_negative= 255-A_gray;  %Negate the pixel values
figure(3); %Open window titled figure 2, draw the image
imshow(A_negative); % Render the image in the above titled window


%Exercise 5
% Thresholding, the picture either contains black or white pixels
% using the below function, the image have to first convert the image from color to gray image
% by giving a range x to the formula, if the pixel value greater than x
% than increse it to 255(white), if it is less than 255 then convert to 0(black)
% go through every single pixel in the image
A_threshold = A_gray > 150;
% A_gray > 250 or A)gray <250 means if any of this requirements satisfy,
% then make these range to 255(white), all get to 255 for the requirements
B_threshold = A_gray > 250;
% if the range x is big enough ,like 250 (the highest value of a 8-bits image is 255) and most of the pixels cannot
% reach this value, then the thresholding image will contains mostly black
% pixels(color), vice versa
figure (4);
subplot(1,2,1); imshow(A_threshold); title("x=255, if x>150");
subplot(1,2,2); imshow(B_threshold); title("x=255, if x>250");

%Exercise 6
% From range 0-255 to range 0-64, reduce contrast
% contrast factor = 64 / 255 = 0.250980
contrast_factor = 0.250980;
% A_contrast = A_gray*contrast_factor; 
A_contrast = A*contrast_factor; 
% using a color image is more easier for observation, on a gray-scale image
% which either black or with is hard for observation
% As the highest value down from 255 to 64, the image become dark and the
% brightness reduce

% if the highest value reduce not than much, from 255 to 200
% contrast factor = 200/255 = 0.784313
text_contrast_factor = 0.784313;
B_contrast = A*text_contrast_factor;

% According to the observation on fugure 5, we can see that as the value of
% the contrast get closer to 1, the difference of the brightness on the
% picture will be ignored, but anyway, the brightness will be reduced, just
% more harder to distinguish
% the greater the contrast factor (the more reduction of the range, such asm from 255 to 64), the bigger the diffence between images

figure(5);
subplot(2,2,1); imshow(A); title("original image");
subplot(2,2,3); imshow(A_contrast); title("contrast factor:0.250980, from 255 to 64");
subplot(2,2,4); imshow(B_contrast); title("contrast factor:0.784313, from 255 to 250");
