function [ z1, z2, z3, z4 ] = bagiZona( new )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[baris, kolom] = size (new);

z1 = new(1:32, 1:32);
z2 = new(1:32, 33:64);
z3 = new(33:64, 1:32);
z4 = new(33:64, 33:64);


end

