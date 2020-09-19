function varargout = select_labels(varargin)
% SELECT_LABELS M-file for select_labels.fig
%      SELECT_LABELS, by itself, creates a new SELECT_LABELS or raises the existing
%      singleton*.
%
%      H = SELECT_LABELS returns the handle to a new SELECT_LABELS or the handle to
%      the existing singleton*.
%
%      SELECT_LABELS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_LABELS.M with the given input arguments.
%
%      SELECT_LABELS('Property','Value',...) creates a new SELECT_LABELS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_labels_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_labels_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_labels

% Last Modified by GUIDE v2.5 16-Aug-2016 16:04:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_labels_OpeningFcn, ...
    'gui_OutputFcn',  @select_labels_OutputFcn, ...
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


% --- Executes just before select_labels is made visible.
function select_labels_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_labels (see VARARGIN)

% Choose default command line output for select_labels
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_labels wait for user response (see UIRESUME)
% uiwait(handles.select_labels);


% --- Outputs from this function are returned to the command line.
function varargout = select_labels_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global title_label x_axis_label y_axis_label colorbar_label title_fontsize x_axis_fontsize y_axis_fontsize colorbar_fontsize
global title_color x_axis_color y_axis_color colorbar_color title_fontweight x_axis_fontweight y_axis_fontweight colorbar_fontweight
global eval_title eval_x_axis eval_y_axis eval_colorbar1 eval_colorbar2 valid_labels

%Get label values
title_label               = get(handles.edit1,'String');
x_axis_label              = get(handles.edit7,'String');
y_axis_label              = get(handles.edit9,'String');
colorbar_label            = get(handles.edit11,'String');

%Get fontsize values
title_fontsize              = get(handles.edit2,'String');
x_axis_fontsize             = get(handles.edit8,'String');
y_axis_fontsize             = get(handles.edit10,'String');
colorbar_fontsize           = get(handles.edit12,'String');

%Check for empty labels
if isempty(title_label) == 1
    
    title_fontsize          = 10;
    
else
    
    title_fontsize          = str2double(title_fontsize);
    
end

if isempty(x_axis_label) == 1
    
    x_axis_fontsize         = 10;
    
else
    
    x_axis_fontsize         = str2double(x_axis_fontsize);
    
end

if isempty(y_axis_label) == 1
    
    y_axis_fontsize         = 10;
    
else
    
    y_axis_fontsize         = str2double(y_axis_fontsize);
    
end

if isempty(colorbar_label) == 1 && isempty(colorbar_fontsize) == 1
    
    colorbar_fontsize       = 10;
    
else
    
    colorbar_fontsize       = str2double(colorbar_fontsize);
    
end

%Check for wrong label parameters
if isnan(title_fontsize) == 1 || isnan(x_axis_fontsize) == 1 || isnan(y_axis_fontsize) == 1 || isnan(colorbar_fontsize) == 1
    
    errordlg('Wrong or empty label fontsizes. Please select valid fontsizes!','Font Size Error')
    return
    
else
    
    %Get title color
    if get(handles.radiobutton5,'Value') == 1
        
        title_color         = '''r''';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        title_color         = '''g''';
        
    elseif get(handles.radiobutton7,'Value') == 1
        
        title_color         = '''b''';
        
    elseif get(handles.radiobutton8,'Value') == 1
        
        title_color         = '''c''';
        
    elseif get(handles.radiobutton9,'Value') == 1
        
        title_color         = '''m''';
        
    elseif get(handles.radiobutton10,'Value') == 1
        
        title_color         = '''y''';
        
    elseif get(handles.radiobutton11,'Value') == 1
        
        title_color         = '''k''';
        
    elseif get(handles.radiobutton12,'Value') == 1
        
        title_color         = '''w''';
        
    end
    
    %Get x-axis color
    if get(handles.radiobutton38,'Value') == 1
        
        x_axis_color        = '''r''';
        
    elseif get(handles.radiobutton39,'Value') == 1
        
        x_axis_color        = '''g''';
        
    elseif get(handles.radiobutton40,'Value') == 1
        
        x_axis_color        = '''b''';
        
    elseif get(handles.radiobutton41,'Value') == 1
        
        x_axis_color        = '''c''';
        
    elseif get(handles.radiobutton42,'Value') == 1
        
        x_axis_color        = '''m''';
        
    elseif get(handles.radiobutton43,'Value') == 1
        
        x_axis_color        = '''y''';
        
    elseif get(handles.radiobutton44,'Value') == 1
        
        x_axis_color        = '''k''';
        
    elseif get(handles.radiobutton45,'Value') == 1
        
        x_axis_color        = '''w''';
        
    end
    
    %Get y-axis color
    if get(handles.radiobutton50,'Value') == 1
        
        y_axis_color        = '''r''';
        
    elseif get(handles.radiobutton51,'Value') == 1
        
        y_axis_color        = '''g''';
        
    elseif get(handles.radiobutton52,'Value') == 1
        
        y_axis_color        = '''b''';
        
    elseif get(handles.radiobutton53,'Value') == 1
        
        y_axis_color        = '''c''';
        
    elseif get(handles.radiobutton54,'Value') == 1
        
        y_axis_color        = '''m''';
        
    elseif get(handles.radiobutton55,'Value') == 1
        
        y_axis_color        = '''y''';
        
    elseif get(handles.radiobutton56,'Value') == 1
        
        y_axis_color        = '''k''';
        
    elseif get(handles.radiobutton57,'Value') == 1
        
        y_axis_color        = '''w''';
        
    end
    
    %Get colorbar color
    if get(handles.radiobutton62,'Value') == 1
        
        colorbar_color      = '''r''';
        
    elseif get(handles.radiobutton63,'Value') == 1
        
        colorbar_color      = '''g''';
        
    elseif get(handles.radiobutton64,'Value') == 1
        
        colorbar_color      = '''b''';
        
    elseif get(handles.radiobutton65,'Value') == 1
        
        colorbar_color      = '''c''';
        
    elseif get(handles.radiobutton66,'Value') == 1
        
        colorbar_color      = '''m''';
        
    elseif get(handles.radiobutton67,'Value') == 1
        
        colorbar_color      = '''y''';
        
    elseif get(handles.radiobutton68,'Value') == 1
        
        colorbar_color      = '''k''';
        
    elseif get(handles.radiobutton69,'Value')==1
        
        colorbar_color      = '''w''';
        
    end
    
    %Get title font weight
    if get(handles.radiobutton1,'Value') == 1
        
        title_fontweight    = '''normal''';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        title_fontweight    = '''bold''';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        title_fontweight    = '''light''';
        
    elseif get(handles.radiobutton4,'Value') == 1
        
        title_fontweight    = '''demi''';
        
    end
    
    %Get x-axis font weight
    if get(handles.radiobutton46,'Value') == 1
        
        x_axis_fontweight   = '''normal''';
        
    elseif get(handles.radiobutton47,'Value') == 1
        
        x_axis_fontweight   = '''bold''';
        
    elseif get(handles.radiobutton48,'Value') == 1
        
        x_axis_fontweight   = '''light''';
        
    elseif get(handles.radiobutton49,'Value') == 1
        
        x_axis_fontweight   = '''demi''';
        
    end
    
    %Get y-axis font weight
    if get(handles.radiobutton58,'Value') == 1
        
        y_axis_fontweight   = '''normal''';
        
    elseif get(handles.radiobutton59,'Value') == 1
        
        y_axis_fontweight   = '''bold''';
        
    elseif get(handles.radiobutton60,'Value') == 1
        
        y_axis_fontweight   = '''light''';
        
    elseif get(handles.radiobutton61,'Value') == 1
        
        y_axis_fontweight   = '''demi''';
        
    end
    
    %Get colorbar font weight
    if get(handles.radiobutton70,'Value') == 1
        
        colorbar_fontweight = '''normal''';
        
    elseif get(handles.radiobutton71,'Value') == 1
        
        colorbar_fontweight = '''bold''';
        
    elseif get(handles.radiobutton72,'Value') == 1
        
        colorbar_fontweight = '''light''';
        
    elseif get(handles.radiobutton73,'Value') == 1
        
        colorbar_fontweight = '''demi''';
        
    end
    
    %Create the commands
    eval_title              = strcat('title(','''',title_label,'''',',''fontsize'',',num2str(title_fontsize),',''fontweight'',',title_fontweight,',''color'',',title_color,')');
    eval_x_axis             = strcat('xlabel(','''',x_axis_label,'''',',''fontsize'',',num2str(x_axis_fontsize),',''fontweight'',',x_axis_fontweight,',''color'',',x_axis_color,')');
    eval_y_axis             = strcat('ylabel(','''',y_axis_label,'''',',''fontsize'',',num2str(y_axis_fontsize),',''fontweight'',',y_axis_fontweight,',''color'',',y_axis_color,')');
    eval_colorbar1          = strcat('set(get(h,''title'')',',''string'',','''',colorbar_label,'''',',''fontsize'',',num2str(colorbar_fontsize),',''fontweight'',',colorbar_fontweight,',''color'',',colorbar_color,')');
    eval_colorbar2          = strcat('set(h',',''fontsize'',',num2str(colorbar_fontsize),')');
    
    %Set boolean variables
    valid_labels          = 1;
    
    %Close Captions parameters GUI
    close select_labels
    
end


function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
