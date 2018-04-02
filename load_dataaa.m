[file_data, path_data] = uigetfile('*/*.data', 'Pilih Gambar');
read = load([path_data file_data]);
data_seion = read(:,1:end);
datanormal = mapminmax(data_seion)';
