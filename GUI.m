function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 13-Dec-2017 18:27:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1

% --- Executes when entered data in editable cell(s) in tabelCiri.
function tabelCiri_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tabelCiri (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in loadCiri.
function loadCiri_Callback(hObject, eventdata, handles)
myData = load('datatrain43.data');
set(handles.tabelCiri,'Data',myData);
assignin('base','datanormal', myData);
msgbox('Load Data Success');

% hObject    handle to loadCiri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function hslAkurasi_Callback(hObject, eventdata, handles)
% hObject    handle to hslAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hslAkurasi as text
%        str2double(get(hObject,'String')) returns contents of hslAkurasi as a double


% --- Executes during object creation, after setting all properties.
function hslAkurasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hslAkurasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in trainingBtn.
function trainingBtn_Callback(hObject, eventdata, handles)
targetData;
label = targetData;
assignin('base','label',label);
dataCiri = load('datatrain43.data');
data_seion = dataCiri(:,1:end);
datanormal = mapminmax(data_seion)';

[O, N] = size(label);
labelData = vec2ind(label);
id1=find(labelData==1);
id2=find(labelData==2);
id3=find(labelData==3);
id4=find(labelData==4);
id5=find(labelData==5);
id6=find(labelData==6);
id7=find(labelData==7);
id8=find(labelData==8);
id9=find(labelData==9);
id10=find(labelData==10);
id11=find(labelData==11);
id12=find(labelData==12);
id13=find(labelData==13);
id14=find(labelData==14);
ind0 = 1:N;

M = 15;
rng(0)
hiddenLayer1 = str2double(get(handles.l1, 'String'));
assignin('base','hiddenLayer1',hiddenLayer1);

hiddenLayer2 = str2double(get(handles.l2, 'String'));
assignin('base','hiddenLayer2',hiddenLayer2);


if hiddenLayer2 ~= 0
    net = newff(minmax(datanormal),[hiddenLayer1 hiddenLayer2 14],{'logsig','logsig','logsig'}, 'trainscg');
elseif hiddenLayer2 == 0
    net = newff(minmax(datanormal), [hiddenLayer1 14],{'logsig','logsig'}, 'trainscg');
end

% net = newff(minmax(datanormal), [hiddenLayer1 hiddenLayer2 14],{'logsig','logsig'}, 'trainscg');
net.trainParam.epochs = 600;
net.divideFcn = 'divideind';
net = init(net);
net.trainParam.lr = 0.01;

tstind = 1:M;
trnind = tstind(end)+1:N/14;

trnInd = [ind0(:,id1(trnind)) ind0(:,id2(trnind))...
    ind0(:,id3(trnind)) ind0(:,id4(trnind)) ind0(:,id5(trnind))...
    ind0(:,id6(trnind)) ind0(:,id7(trnind)) ind0(:,id8(trnind))...
    ind0(:,id9(trnind)) ind0(:,id10(trnind)) ind0(:,id11(trnind))...
    ind0(:,id12(trnind)) ind0(:,id13(trnind)) ind0(:,id14(trnind))];

tstInd = [ind0(:,id1(tstind)) ind0(:,id2(tstind))...
    ind0(:,id3(tstind)) ind0(:,id4(tstind)) ind0(:,id5(tstind))...
    ind0(:,id6(tstind)) ind0(:,id7(tstind)) ind0(:,id8(tstind))...
    ind0(:,id9(tstind)) ind0(:,id10(tstind)) ind0(:,id11(tstind))...
    ind0(:,id12(tstind)) ind0(:,id13(tstind)) ind0(:,id14(tstind))];

net.divideParam.trainInd = trnInd;
net.divideParam.testInd = tstInd;

[net, tr] = train(net, datanormal, label);

ytst = net(datanormal(:,tr.testInd));
ttst = label(:,tr.testInd);

[c,cm,idn,per] = confusion(ttst,ytst);
benar = sum(diag(cm));
totaldata = sum(sum(cm));
akurasi = (benar/totaldata)*100;
set(handles.hslAkurasi,'String',akurasi);

assignin('base','cm',cm);
assignin('base','akurasi',akurasi);

% hObject    handle to trainingBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function l1_Callback(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l1 as text
%        str2double(get(hObject,'String')) returns contents of l1 as a double


% --- Executes during object creation, after setting all properties.
function l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l2_Callback(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l2 as text
%        str2double(get(hObject,'String')) returns contents of l2 as a double


% --- Executes during object creation, after setting all properties.
function l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)

axes(hObject);
imshow('logo-USD.jpg');

% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2

function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
currentDir = pwd;
dirName = uigetdir(currentDir, 'Pilih Folder');
handles.foldName = strcat(dirName,'\');
if ~isequal(dirName,0)
    set(handles.edit4, 'String', dirName);
else
    return
end
guidata(hObject, handles);
assignin('base','dirName',dirName);

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
[file_data,nama_path] = uigetfile({'*.*'});

if ~isequal(file_data,0)
    I = imread(fullfile(nama_path,file_data));
    axes(handles.axes4)
    imshow(I)
    handles.I = I;
    guidata(hObject,handles)
else
    return
end
set(handles.edit5,'String',file_data);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

I = handles.I;
assignin('base','hasil',I);
% Mengubah citra ke Grayscale
gray = rgb2gray(I);
% Mengubah citra keabuan ke citra hitam putih
bnw = im2bw(gray);

% Mengubah 0 menjadi 1, dan 1 menjadi 0
%com = imcomplement(bnw);
% Mengubah ukuran citra menjadi 64x64
hangul = imresize(bnw, [64 64]);
% Menipiskan citra
thin = Rosenfeld(hangul);
%imshow(hangul);
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
ciri3 = [jh, dig1];
% Membuat kombinasi ciri 4
ciri4 = [jh, dig2];
% Membuat kombinasi ciri 5
ciri5 = [dig1, dig2];
% Membuat kombinasi ciri 6
ciri = [jh, dig1, dig2, horz, vert];

if strcmp(I, 's1.data')
    ciri = ciri1;
elseif strcmp(I, 's2.data')
    ciri = ciri2;
 elseif strcmp(I, 's3.data')
    ciri = ciri3;   
 elseif strcmp(I, 's4.data')
    ciri = ciri4;
 elseif strcmp(I, 's5.data')
    ciri = ciri5;
 elseif strcmp(I, 's6.data')
    ciri = ciri6;
end

assignin('base','ciri', ciri);

load net.mat;
read1 = ciri(:,1:end);
data = mapminmax(read1)';
ytst1 = net(data);
hasil = vec2ind(ytst1);

assignin('base','out',hasil);

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

assignin('base','hasil_huruf',hasil_huruf);
set(handles.edit6,'String',hasil_huruf);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axes(hObject);
imshow('logo-USD.jpg');
% Hint: place code in OpeningFcn to populate axes5

