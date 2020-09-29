function [images] = load_images()

files = dir('bilder/*.JPG');
N = length(files);
[row, col, ~] = size(imread(['bilder/' files(1).name]));
images = zeros( row, col, N );

for i = 1:N
    name = ['bilder/' files(i).name ];
    I = double(imread(name))/255;
    I = rgb2gray(I);
    images(:,:,i) = I;
end


end

