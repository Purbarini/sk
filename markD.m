function [ vert, horz, dig1, dig2 ] = markD( new )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
[baris, kolom] = size(new);

vert = 0;
horz = 0;
dig1 = 0;
dig2 = 0;

for i=2:baris-1
    for j=2:kolom-1
        if new(i,j) == 0
            if new(i,j)+new(i-1,j)+new(i+1,j) == 0
                if new(i-1,j-1)+new(i-1,j+1)+new(i,j-1)
                    +new(i,j+1)+new(i+1,j-1)+new(i+1,j+1)==6;
                    vert = vert + 1;
                end
            end
            if new(i,j)+new(i,j-1)+new(i,j+1) == 0
                if new(i-1, j-1)+new(i-1,j)+new(i-1, j+1)
                    +new(i+1,j-1)+new(i+1,j)+new(i+1,j+1)==6;
                    horz = horz + 1;
                end
            end
            if new(i,j)+new(i-1,j-1)+new(i+1,j+1) == 0
                if new(i-1,j)+new(i-1,j+1)+new(i,j-1)
                    +new(i,j+1)+new(i+1,j-1)+new(i+1,j)==6;
                    dig1 = dig1 + 1;
                end
            end
            if new(i,j)+new(i-1,j+1)+new(i+1,j-1)==0;
                if new(i-1,j-1)+new(i-1,j)+new(i,j-1)
                    +new(i, j+1)+new(i+1,j)+new(i+1,j+1)==6;
                    dig2 = dig2 + 1;
                end
            end
        end
    end
end                 
end

