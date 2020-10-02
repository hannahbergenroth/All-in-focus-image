function [g_pyr] = gaussian_pyramid(I,level)
% I: input image
% level: number of levels in pyramid

g_pyr = cell( level, 1 );

% save input image in first level at the pyramid
g_pyr{1} = I;

filter = [1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1 ]/256;

for n=2:level
    I = imfilter(I, filter, 'replicate');
    I = imresize(I,0.5);
    g_pyr{n} = I;
end

end