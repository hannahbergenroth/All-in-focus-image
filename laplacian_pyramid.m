function [ l_pyr ] = laplacian_pyramid( g_pyr )
%g_pyr: gaussian pyramid 

% allocate memory to the pyramid
l_pyr = cell(size(g_pyr,1),1);

l_pyr{level} = g_pyr{level};

for n = level:-1:2
    odd = 2 * size(g_pyr{n}) - size(g_pyr{n-1}); 
    l_pyr{n-1} = g_pyr{n-1} - UpSize(g_pyr{n},odd);  
end