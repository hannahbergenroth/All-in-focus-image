function [images, N] = load_images()

%files = dir('images/*.jpg');
files = dir('bilder/*.JPG');
N = length(files);
%[row, col, channels] = size(imread(['images/' files(1).name]));
[row, col, channels] = size(imread(['bilder/' files(1).name]));
images = zeros( row, col, N );

for i = 1:N
    %name = ['images/' files(i).name ];
    name = ['bilder/' files(i).name ];
    
    I = double(imread(name))/255;
    if channels > 1
        images(:,:,i) = rgb2gray(I);
    else
        images(:,:,i) = I;
    end
   
    disp(strcat('Loading Image Number ', num2str(i), '/', num2str(N)));
end
end