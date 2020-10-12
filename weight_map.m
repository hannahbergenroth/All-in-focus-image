function W  = weight_map( C)

W = ones(size(C));

Wc = 2;

if ( Wc > 0 )
    W = W.* C.^ Wc;
    
end
% normalize weights for each pixel
% make sure that weights sum to one
W = W + 1e-12; %avoids division by zero
W = W./repmat( sum(W,3), [1 1 size(W, 3)] );

end