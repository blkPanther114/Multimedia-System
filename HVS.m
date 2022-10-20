function h = HVS(img)
R=img(:,:,1) ;
G=img(:,:,2);
B=img(:,:,3);
h = 0.299*R + 0.587 *G + 0.114 *B;
end