function varargout = dip_assignment_1(varargin)
% DIP_ASSIGNMENT_1 MATLAB code for dip_assignment_1.fig
%      DIP_ASSIGNMENT_1, by itself, creates a new DIP_ASSIGNMENT_1 or raises the existing
%      singleton*.
%
%      H = DIP_ASSIGNMENT_1 returns the handle to a new DIP_ASSIGNMENT_1 or the handle to
%      the existing singleton*.
%
%      DIP_ASSIGNMENT_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP_ASSIGNMENT_1.M with the given input arguments.
%
%      DIP_ASSIGNMENT_1('Property','Value',...) creates a new DIP_ASSIGNMENT_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dip_assignment_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dip_assignment_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dip_assignment_1

% Last Modified by GUIDE v2.5 01-Nov-2017 07:37:16

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT


% --- Executes just before dip_assignment_1 is made visible.
function dip_assignment_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dip_assignment_1 (see VARARGIN)

% Choose default command line output for dip_assignment_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dip_assignment_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dip_assignment_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
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


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global img_1;
f = fspecial('laplacian');
img_1 = imfilter(img, f);
axes(handles.axes2);
imshow(img_1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global img_1;
global img_2;
img_2 = img - img_1;
axes(handles.axes3);
imshow(img_2);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global img_3;
img_3 = edge(img, 'Sobel');
img_3 = im2uint8(img_3);
img_3 = img - img_3;
axes(handles.axes4);
imshow(img_3);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_3;
global img_4;
f = fspecial('average', 5);
img_4 = imfilter(img_3, f);
axes(handles.axes5);
imshow(img_4);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_1;
global img_4;
global img_5;
img_5 = imadd(img_1, img_4);
axes(handles.axes6);
imshow(img_5);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
global img_5;
global img_6;
img_6 = img + img_5;
axes(handles.axes7);
imshow(img_6);

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img_6;
global img_7;
img_7 = double(img_6)/255;
img_7 = img_7.^0.65;
axes(handles.axes8);
imshow(img_7);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global slider_value1;
slider_value1 = get(handles.slider1, 'value');
% slider_value1=floor(slider_value1);
data1=num2str(slider_value1);
set(handles.text10,'String',data1);

global img_6;
global img_7;
img_7 = double(img_6)/255;
img_7 = img_7.^slider_value1;
axes(handles.axes8);
imshow(img_7);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
