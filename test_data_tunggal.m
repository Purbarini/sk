if strcmp(file_data, 's1.data')
    ciri = ciri1;
elseif strcmp(file_data, 's2.data')
    ciri = ciri2;
 elseif strcmp(file_data, 's3.data')
    ciri = ciri3;   
 elseif strcmp(file_data, 's4.data')
    ciri = ciri4;
 elseif strcmp(file_data, 's5.data')
    ciri = ciri5;
 elseif strcmp(file_data, 's6.data')
    ciri = ciri6;
end

read1 = ciri(:,1:end);
datanorm = mapminmax(read1)';
ytst1 = net(datanorm);
hasil = vec2ind(ytst1);

if hasil == 1
    hasil_huruf = 'G'
elseif hasil == 2
    hasil_huruf = 'N'
elseif hasil == 3
    hasil_huruf = 'D'
elseif hasil == 4
    hasil_huruf = 'R'
elseif hasil == 5
    hasil_huruf = 'M'
elseif hasil == 6
    hasil_huruf = 'B'
elseif hasil == 7
    hasil_huruf = 'S'
elseif hasil == 8
    hasil_huruf = 'NG'
elseif hasil == 9
    hasil_huruf = 'J'
elseif hasil == 10
    hasil_huruf = 'CH'
elseif hasil == 11
    hasil_huruf = 'K'
elseif hasil == 12
    hasil_huruf = 'T'
elseif hasil == 13
    hasil_huruf = 'P'
elseif hasil == 14
    hasil_huruf = 'H'
end
