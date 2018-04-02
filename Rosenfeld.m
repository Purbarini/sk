function [thin,runningTime]=Rosenfeld(newImage)
%Modul untuk penipisan dengan metode NWG
citra=newImage;
 
citras=citra;%citras adalah citra yang dibuang pixel2nya,kmudian akan dijadikan masukkan pada iterasi berikutnya
[baris,kolom]=size(citra);
objek=0;    %objek=hitam=0
latar=1;    %latar=putih=1
bantu_point_dihapus=0;
tic
N = 1;    %var N merupakan var bantu untuk memutuskan apakah iterasi tetap dilakukan, jika ada pixel yang diubah dari hitam ke putih maka nilai n akan bertambah, maka jika n=0 iterasi dihentikan
while(N>0)
    N=0;
    bantu_point_dihapus=bantu_point_dihapus+1;
    for i=1+1:baris-1
        for j=1+1:kolom-1
            if (citra(i,j)==objek & citra(i-1,j)==latar)%north, first subiteration
                xhp=0;    %nilai dari perhitungan xhp
                b=0;
                mat_xh(2,2)=citra(i,j);       %p
                mat_xh(2,3)=citra(i,j+1);     %x1
                mat_xh(3,3)=citra(i+1,j+1);   %x2
                mat_xh(3,2)=citra(i+1,j);     %x3
                mat_xh(3,1)=citra(i+1,j-1);   %x4
                mat_xh(2,1)=citra(i,j-1);     %x5
                mat_xh(1,1)=citra(i-1,j-1);   %x6
                mat_xh(1,2)=citra(i-1,j);     %x7
                mat_xh(1,3)=citra(i-1,j+1);   %x8
                xhp=simple(mat_xh);
                b=bp(mat_xh);
                if(b>1 & xhp==1)
                    citras(i,j)=latar;
                    N=N+1;
                end
            end
        end
    end
 
    citra=citras;%isi citra kemudian diganti dengan citras yaitu citra yang udah dibuang north bordernya, jadi inputan iterasi pada east border merupakan hasil dari iterasi north border
   
    for i=1+1:baris-1
        for j=1+1:kolom-1
            if (citra(i,j)==objek & citra(i,j+1)==latar)%east, second subiteration
                xhp=0;    %nilai dari perhitungan xhp
                b=0;
                mat_xh(2,2)=citra(i,j);       %p
                mat_xh(2,3)=citra(i,j+1);     %x1
                mat_xh(3,3)=citra(i+1,j+1);   %x2
                mat_xh(3,2)=citra(i+1,j);     %x3
                mat_xh(3,1)=citra(i+1,j-1);   %x4
                mat_xh(2,1)=citra(i,j-1);     %x5
                mat_xh(1,1)=citra(i-1,j-1);   %x6
                mat_xh(1,2)=citra(i-1,j);     %x7
                mat_xh(1,3)=citra(i-1,j+1);   %x8
                xhp=simple(mat_xh);
                b=bp(mat_xh);
                if(b>1 & xhp==1)
                    citras(i,j)=latar;
                    N=N+1;
                end
            end
        end
    end
 
    citra=citras;%isi citra kemudian diganti dengan citras yaitu citra yang udah dibuang north+east bordernya, jadi inputan iterasi pada south border merupakan hasil dari iterasi north+east border
  
     for i=1+1:baris-1
        for j=1+1:kolom-1
            if (citra(i,j)==objek & citra(i+1,j)==latar)%south, third subiteration
                xhp=0;    %nilai dari perhitungan xhp
                b=0;
                mat_xh(2,2)=citra(i,j);       %p
                mat_xh(2,3)=citra(i,j+1);     %x1
                mat_xh(3,3)=citra(i+1,j+1);   %x2
                mat_xh(3,2)=citra(i+1,j);     %x3
                mat_xh(3,1)=citra(i+1,j-1);   %x4
                mat_xh(2,1)=citra(i,j-1);     %x5
                mat_xh(1,1)=citra(i-1,j-1);   %x6
                mat_xh(1,2)=citra(i-1,j);     %x7
                mat_xh(1,3)=citra(i-1,j+1);   %x8
                xhp=simple(mat_xh);
                b=bp(mat_xh);
                if(b>1 & xhp==1)
                    citras(i,j)=latar;
                    N=N+1;
                end
            end
        end
    end
 
    citra=citras;%isi citra kemudian diganti dengan citras yaitu citra yang udah dibuang north+east+west bordernya, jadi inputan iterasi pada south border merupakan hasil dari iterasi north+east+west border
 
    for i=1+1:baris-1
        for j=1+1:kolom-1
            if (citra(i,j)==objek & citra(i,j-1)==latar)%west, fourth subiteration
                xhp=0;    %nilai dari perhitungan xhp
                b=0;
                mat_xh(2,2)=citra(i,j);       %p
                mat_xh(2,3)=citra(i,j+1);     %x1
                mat_xh(3,3)=citra(i+1,j+1);   %x2
                mat_xh(3,2)=citra(i+1,j);     %x3
                mat_xh(3,1)=citra(i+1,j-1);   %x4
                mat_xh(2,1)=citra(i,j-1);     %x5
                mat_xh(1,1)=citra(i-1,j-1);   %x6
                mat_xh(1,2)=citra(i-1,j);     %x7
                mat_xh(1,3)=citra(i-1,j+1);   %x8
                xhp=simple(mat_xh);
                b=bp(mat_xh);
                if(b>1 & xhp==1)
                    citras(i,j)=latar;
                    N=N+1;
                end
            end
        end
    end
 
    citra=citras;%isi citra kemudian diganti dengan citras yaitu citra yang udah dibuang north+east+west bordernya, jadi inputan iterasi pada south border merupakan hasil dari iterasi north+east+west border
   
    total_N(bantu_point_dihapus)=N;
end
toc
waktu=toc;
hapus=cumsum(total_N);
point_dihapus=hapus(end);
thin=citras;
runningTime=waktu;
