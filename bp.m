function [nilai_bp]= Bp(matriks)
objek=0;
i=2;j=2;
B=0; %syarat kedua adalah titik yang diuji tidak isolated or endpoint
if(matriks(i,j+1)==objek) B=B+1;      %x1 
end
if(matriks(i+1,j+1)==objek) B=B+1;    %x2
end
if(matriks(i+1,j)==objek) B=B+1;      %x3
end
if(matriks(i+1,j-1)==objek) B=B+1;    %x4
end
if(matriks(i,j-1)==objek) B=B+1;      %x5
end
if(matriks(i-1,j-1)==objek) B=B+1;    %x6
end
if(matriks(i-1,j)==objek) B=B+1;      %x7
end
if(matriks(i-1,j+1)==objek) B=B+1;    %x8
end
nilai_bp=B;