function [ ML ] = ML( Image )
%Calculate Modified Laplacian

[y,x] = size(Image);

padImage = padarray(Image,[1,1],'replicate','both');

ML = zeros(y+2,x+2);

for i = 2:y+1
    for j = 2:x+1
        ML(i,j) = (abs((2 * padImage(i,j)) - padImage(i,j-1) - padImage(i,j+1)) + abs((2 * padImage(i,j)) - padImage(i-1,j) - padImage(i+1,j)));
        
    end
end

end

