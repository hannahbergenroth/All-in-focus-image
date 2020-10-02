function Up = UpSize( I, odd )
% I: input image
% odd: 2-vector of binary values, indicates whether the upsampled image should
% have odd size for the respective dimensions

I = padarray( I, [ 1 1 0 ], 'replicate' );

filter = [1 4 6 4 1; 4 16 24 16 4; 6 24 36 24 6; 4 16 24 16 4; 1 4 6 4 1 ]/256;

row = 2 * size( I, 1 );
col = 2 * size( I, 2 );
k = size( I, 3 );

Up = zeros( row, col, k );

% fill the original image into the odd position of the up sampled image
% make sure to increase the original image by 4 times for interpolation 
Up( 1: 2: row, 1: 2: col, : ) = 4 * I; 

% Gaussian interpolation to up sample using the same filter for blurring
Up = imfilter( Up, filter );      

% remove the border
Up = Up( 3 : row - 2 - odd(1), 3 : col - 2 - odd(2), : );