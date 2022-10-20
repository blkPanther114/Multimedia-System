A = imread ('sparrow.jpg');
figure(1);
imshow(A);

[h,w,d]= size(A);

%exercise3
AV=im2double(A);
AV=average(AV);
figure('Name','averaging','NumberTitle','off');
imshow(AV);


H=im2double(A);
H=HVS(H);
figure('Name','HVS','NumberTitle','off');
imshow(H);


% Exercise 4: Negate/complement the image. Here the pixel values are to be flipped. For instance,
% 0 is replaced by 255 and vice versa (refer to lecture slides). Write a code snippet, display the
% image and compare with the original gray-scale image.

A_negative= 255-A; 
figure('Name','complement','NumberTitle','off');
imshow(A_negative); 


% Exercise 5: Generate a two-tone/binary image using thresholding. Set your own threshold (say,
% 150) and observe the resulting image. Increase and decrease the threshold and notice the
% resulting image. What is your observation?

RGB=imread('sparrow.jpg');   
I = rgb2gray(RGB);
A_threshold = I> 150;
B_threshold = I> 250;
% if the range is very high, e.g near the maximum value 255, then the thresholding 
% image will have more black pixels, if the range is low (<150in this
% case), the resulting image will have more white pixels.
figure('Name','threshold','NumberTitle','off');
subplot(1,2,1); imshow(A_threshold); title("x=255, if x>150");
subplot(1,2,2); imshow(B_threshold); title("x=255, if x>250");

% Exercise 6: In this exercise, the contrast of the image is to be reduced. We know that the highest
% possible grayscale level is 255, and the lowest possible level is 0. So we need to compute a new
% image by multiplying elements of the original image with an appropriate factor. Choose a
% multiplication factor such that the resulting image will have the highest possible grayscale level
% as 64, while the lowest level remains at 0. Display the resulting image and compare with the
% original grayscale image. What do you perceive?

contrast_factor = 0.250980;
% contrast factor = 64 / 255 = 0.250980
A_contrast = A*contrast_factor; 

% if the highest value doesn't reduce that much, e.g, from 255 to 220
contrast_factor = 220/255;
% 0.862745;
B_contrast = A*contrast_factor;
figure('Name','contrast factor','NumberTitle','off');
subplot(2,2,1); imshow(A); title("original image");
subplot(2,2,3); imshow(A_contrast);title("contrast factor:0.250980")
subplot(2,2,4); imshow(B_contrast);title("contrast factor:0.862745")
% % As the highest value down from 255 to 64, the image gets darker and less
% bright. 
% the greater the contrast factor, the diffrence between
% images will be smaller



