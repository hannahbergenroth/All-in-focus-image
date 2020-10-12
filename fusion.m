function [I_fused, pyr] = fusion( I, W, level )

[row, col, N] = size( W );

if ~exist( 'level' )
    % compute the largest number of pyramid level
    level = floor( log( min( row, col) ) / log(2) );
end
% construct pyramid from each input image
pyr = gaussian_pyramid(zeros(row, col), level);

for i = 1 : N
    % Gaussian pyramid of weighting map
    pyrW = gaussian_pyramid( W(:, :, i), level );
      
    % Laplacian pyramid of input image
    pyrI = laplacian_pyramid( gaussian_pyramid(I(:,:,i), level));
    
    % blend
    for n = 1 : level
        %w = repmat( pyrW{ n }, [1 1 3] );
        pyr{ n }  = pyr{ n } + pyrW{ n } .* pyrI{ n };
    end
end

I_fused = reconstruct_laplacian_pyramid( pyr);

end

