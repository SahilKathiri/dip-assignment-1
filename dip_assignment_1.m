function varargout = dip_assignment_1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dip_assignment_1_OpeningFcn, ...
                   'gui_OutputFcn',  @dip_assignment_1_OutputFcn, ...
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


function dip_assignment_1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = dip_assignment_1_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function listbox1_Callback(hObject, eventdata, handles)
    global img;
    List = get(hObject, 'String')
    Val = get(hObject, 'Value')
    path = pwd
    path = strcat(path, '\images\')
    name = List(Val)
    name = char(name)
    name = deblank(name)
    filename = strcat(path, name)
    img = imread(filename)

    axes(handles.axes1)
    imshow(img)

function listbox1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
global img;
global img_1;
f = fspecial('laplacian');
img_1 = imfilter(img, f);
axes(handles.axes2);
imshow(img_1);


function pushbutton2_Callback(hObject, eventdata, handles)
global img;
global img_1;
global img_2;
img_2 = img - img_1;
axes(handles.axes3);
imshow(img_2);

function pushbutton3_Callback(hObject, eventdata, handles)
global img;
global img_3;
img_3 = edge(img, 'Sobel');
img_3 = im2uint8(img_3);
img_3 = img - img_3;
axes(handles.axes4);
imshow(img_3);

function pushbutton4_Callback(hObject, eventdata, handles)
global img_3;
global img_4;
f = fspecial('average', 5);
img_4 = imfilter(img_3, f);
axes(handles.axes5);
imshow(img_4);

function pushbutton5_Callback(hObject, eventdata, handles)
global img_1;
global img_4;
global img_5;
img_5 = imadd(img_1, img_4);
axes(handles.axes6);
imshow(img_5);

function pushbutton6_Callback(hObject, eventdata, handles)
global img;
global img_5;
global img_6;
img_6 = img + img_5;
axes(handles.axes7);
imshow(img_6);

function pushbutton7_Callback(hObject, eventdata, handles)
global img_6;
global img_7;
img_7 = double(img_6)/255;
img_7 = img_7.^0.65;
axes(handles.axes8);
imshow(img_7);


function slider1_Callback(hObject, eventdata, handles)
global slider_value1;
slider_value1 = get(handles.slider1, 'value');
data1=num2str(slider_value1);
set(handles.text10,'String',data1);

global img_6;
global img_7;
img_7 = double(img_6)/255;
img_7 = img_7.^slider_value1;
axes(handles.axes8);
imshow(img_7);


function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function slider1_KeyPressFcn(hObject, eventdata, handles)
