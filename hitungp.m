function [ jh ] = hitungp( new )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

baris = size(new, 1);
kolom = size(new, 2);
jh = 0;

for i = 1:baris
    for j = 1:kolom
        if new(i,j)== 1
        jh = jh + 1;
        end
    end
end
end

