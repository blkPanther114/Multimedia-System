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
% Display image range [0 255]
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
% display image range [0 255]
 S1=uint8(Temp*S);
figure,imshow(S1);title('Gamma corrected Image -> S = cr^\gamma  \gamma = 0.40 c = 1');
