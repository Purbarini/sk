%syntax function => function [out1, out2, ...] = funname(in1, in2, ...)
function [xh] = simple(matriks)%duh ambil pixel2 8 tetangganya p gmn ya...
    objek=0;
    latar=1;
    b=0;
    if((matriks(2,3)==latar)&((matriks(3,3)==objek)|(matriks(3,2)==objek)))
        b=b+1;
    end
    if((matriks(3,2)==latar)&((matriks(3,1)==objek)|(matriks(2,1)==objek)))
        b=b+1;
    end
    if((matriks(2,1)==latar)&((matriks(1,1)==objek)|(matriks(1,2)==objek)))
        b=b+1;
    end
    if((matriks(1,2)==latar)&((matriks(1,3)==objek)|(matriks(2,3)==objek)))
        b=b+1;
    end
    xh=b;