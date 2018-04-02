% Membaca file gambar huruf Hangul
[file, path] = uigetfile('*/*.jpg', 'Pilih Gambar');
read = imread([path file]);
% Mengubah citra ke Grayscale
gray = rgb2gray(read);
% Mengubah citra keabuan ke citra hitam putih
bnw = im2bw(gray);
% Mengubah 0 menjadi 1, dan 1 menjadi 0
%com = imcomplement(bnw);
% Mengubah ukuran citra menjadi 64x64
hangul = imresize(bnw, [64 64]);
% Menipiskan citra
thin = Rosenfeld(hangul);
% Membagi Zona menjadi 4 zona
[z1, z2, z3, z4] = bagiZona(thin);
imshow(z1);
imshow(z2);
imshow(z3);
imshow(z4);
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
ciri3 = [jh, dig1];
% Membuat kombinasi ciri 4
ciri4 = [jh, dig2];
% Membuat kombinasi ciri 5
ciri5 = [dig1, dig2];
% Membuat kombinasi ciri 6
ciri = [jh, dig1, dig2, horz, vert];


