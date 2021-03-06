
[images, N] = load_images();

I = images(:,:,1);
[r, c] = size(I);

%%

fm = zeros(r, c, N);
%fValue is image global focus measure
fValue = zeros(N);

for i = 1:N
    fm(:,:,i) = SML(ML(images(:,:,i)));
    fValue(i) = mean2(fm(:,:,i));
    %disp(strcat('Calculating fValue for ', num2str(i), '/', num2str(N), fValue(i,1)));
    figure
    imagesc(fm(:,:,i));
    figure
    %mesh(fm(:,:,i));
    %title('Focus Map')
end

%%

weightmap = weight_map(fm);


%%

[maximumFocusValues, maximumFocusIdx] = max(weightmap, [], 3);

%figure
%imagesc(maximumFocusIdx)

[fs_pyramid, pyr] = fusion(images, weightmap, 9);

test = zeros(r,c);

for i = 1:c
    for j = 1:r
        test(j,i) = images(j,i,maximumFocusIdx(j,i));
    end
 
end

    

figure
imshow(test)
figure
imshow(fs_pyramid)
title('Focus Stacked Image')
