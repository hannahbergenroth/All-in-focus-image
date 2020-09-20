I = imread('bilder/IMG_4608.JPG');
I = rgb2gray(I);
I = im2double(I);

%w = [1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1 ]/256;


a = ML(I);

b = SML(a);

plot(b)

figure
imshow(a, [])
%%imshow(Is)