function [ SML ] = SML( ML )
%Calculate SML

[y,x] = size(ML);

SML = zeros(y,x);

t = 7/256;

for i = 2:y-1
    for j = 2:x-1
        if(ML(i,j) >= t)
            SML(i,j) = sum(sum(ML(i-1:i+1,j-1:j+1)));
        end
    end
end

SML = SML(2:y-1,2:x-1);

end

