% Membaca file gambar huruf Hangul
[file, path] = uigetfile('*/*.jpg', 'Pilih Gambar');
read = imread([path file]);
% Mengubah citra ke Grayscale
gray = rgb2gray(read);
% Mengubah citra keabuan ke citra hitam putih
bnw = im2bw(gray);
% Mengubah 0 menjadi 1, dan 1 menjadi 0
com = imcomplement(bnw);
% Mengubah ukuran citra menjadi 64x64
hangul = imresize(com, [64 64]);
% Membagi Zona menjadi 4 zona
[z1, z2, z3, z4] = bagiZona(hangul);
% Mengeksrak ciri dengan Intensity of Character
[jh_1] = hitungp(z1);
[jh_2] = hitungp(z2);
[jh_3] = hitungp(z3);
[jh_4] = hitungp(z4);
% Memasukkan ciri jh ke array jh
jh = [jh_1, jh_2, jh_3, jh_4];
% Mengesktrak ciri dengan Mark Direction Technique
[vert_1, horz_1, dig1_1, dig2_1] = markD(z1);
[vert_2, horz_2, dig1_2, dig2_2] = markD(z2);
[vert_3, horz_3, dig1_3, dig2_3] = markD(z3);
[vert_4, horz_4, dig1_4, dig2_4] = markD(z4);
% Memasukkan ciri horz ke array horz
horz = [horz_1, horz_2, horz_3, horz_4];
% Memasukkan ciri vert ke array vert
vert = [vert_1, vert_2, vert_3, vert_4];
% Memasukkan ciri dig1 ke array dig1
dig1 = [dig1_1, dig1_2, dig1_3, dig1_4];
% Memasukkan ciri dig2 ke array dig2
dig2 = [dig2_1,dig2_2, dig2_3, dig2_4];

% Membuat kombinasi ciri 1
ciri1 = [jh];
% Membuat kombinasi ciri 2
ciri2 = [dig1];
% Membuat kombinasi ciri 3
ciri3 = [dig2];
% Membuat kombinasi ciri 4
ciri4 = [horz];
% Membuat kombinasi ciri 5
ciri5 = [vert];
% Membuat kombinasi ciri 6
ciri6 = [jh, dig1];
% Membuat kombinasi ciri 7
ciri7 = [jh, dig2];
% Membuat kombinasi ciri 8
ciri8 = [jh, horz];
% Membuat kombinasi ciri 9
ciri9 = [jh, vert];
% Membuat kombinasi ciri 10
ciri10 = [dig1, dig2];
% Membuat kombinasi ciri 11
ciri11 = [dig1, horz];
% Membuat kombinasi ciri 12
ciri12 = [dig1, vert];
% Membuat kombinasi ciri 13
ciri13 = [dig2, horz];
% Membuat kombinasi ciri 14
ciri14 = [dig2, vert];
% Membuat kombinasi ciri 15
ciri15 = [horz, vert];
% Membuat kombinasi ciri 16
ciri16 = [jh, dig1, dig2];
% Membuat kombinasi ciri 17
ciri17 = [jh, dig1, horz];
% Membuat kombinasi ciri 18
ciri18 = [jh, dig1, vert];
% Membuat kombinasi ciri 19
ciri19 = [jh, dig2, horz];
% Membuat kombinasi ciri 20
ciri20 = [jh, dig2, vert];
% Membuat kombinasi ciri 21
ciri21 = [jh, horz, vert];
% Membuat kombinasi ciri 22
ciri22 = [dig1, dig2, horz];
% Membuat kombinasi ciri 23
ciri23 = [dig1, dig2, vert];
% Membuat kombinasi ciri 24
ciri24 = [dig2, horz, vert];
% Membuat kombinasi ciri 25
ciri25 = [jh, dig1, dig2, horz];
% Membuat kombinasi ciri 26
ciri26 = [jh, dig1, dig2, vert];
% Membuat kombinasi ciri 27
ciri27 = [jh, dig2, horz, vert];
% Membuat kombinasi ciri 28
ciri28 = [dig1, dig2, horz, vert];
% Membuat kombinasi ciri 29
ciri29 = [jh, dig1, dig2, horz, vert];
%total semua ciri
tciri = [ciri1, ciri2, ciri3, ciri4, ciri5, ciri6, ciri7, ciri8, ciri9, ciri10,...
    ciri11, ciri12, ciri13, ciri14, ciri15, ciri16, ciri17, ciri18, ciri19, ciri20,...
    ciri21, ciri22, ciri23, ciri24, ciri25, ciri26, ciri27, ciri28, ciri29];