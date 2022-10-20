function a =average(img)
R=img(:,:,1) ;
G=img(:,:,2);
B=img(:,:,3);
a = (R + G + B)/3;
end