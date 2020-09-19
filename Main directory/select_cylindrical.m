function varargout = select_cylindrical(varargin)
% SELECT_CYLINDRICAL M-file for select_cylindrical.fig
%      SELECT_CYLINDRICAL, by itself, creates a new SELECT_CYLINDRICAL or raises the existing
%      singleton*.
%
%      H = SELECT_CYLINDRICAL returns the handle to a new SELECT_CYLINDRICAL or the handle to
%      the existing singleton*.
%
%      SELECT_CYLINDRICAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_CYLINDRICAL.M with the given input arguments.
%
%      SELECT_CYLINDRICAL('Property','Value',...) creates a new SELECT_CYLINDRICAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_cylindrical_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_cylindrical_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_cylindrical

% Last Modified by GUIDE v2.5 09-Aug-2016 13:36:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_cylindrical_OpeningFcn, ...
    'gui_OutputFcn',  @select_cylindrical_OutputFcn, ...
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


% --- Executes just before select_cylindrical is made visible.
function select_cylindrical_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_cylindrical (see VARARGIN)

% Choose default command line output for select_cylindrical
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_cylindrical wait for user response (see UIRESUME)
% uiwait(handles.select_cylindrical);


% --- Outputs from this function are returned to the command line.
function varargout = select_cylindrical_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global proj_name long_min long_max lat_min lat_max eval_m_proj valid_projection
global is_azimuthal is_cylindrical is_conic is_miscellaneous

%Check for wrong projection parameters
if isnan(str2double(get(handles.edit1,'String'))) == 1 || isnan(str2double(get(handles.edit4,'String'))) == 1 || isnan(str2double(get(handles.edit2,'String'))) == 1 || isnan(str2double(get(handles.edit5,'String'))) == 1
    
    errordlg('Wrong or empty projection parameters. Please select valid parameters!','Projection Error')
    return
    
else
    
    %Get the projection name
    if get(handles.radiobutton1,'Value') == 1
        
        proj_name    = '''Mercator''';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        proj_name    = '''Miller Cylindrical''';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        proj_name    = '''Equidistant Cylindrical''';
        
    elseif get(handles.radiobutton4,'Value') == 1
        
        proj_name    = '''Oblique Mercator''';
        
    elseif get(handles.radiobutton5,'Value') == 1
        
        proj_name    = '''Transverse Mercator''';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        proj_name    = '''UTM''';
        
    elseif get(handles.radiobutton7,'Value') == 1
        
        proj_name    = '''Sinusoidal''';
        
    elseif get(handles.radiobutton8,'Value') == 1
        
        proj_name    = '''Gall-Peters''';
        
    end
    
    %Get the projection parameters
    long_min         = str2double(get(handles.edit1,'String'));
    long_max         = str2double(get(handles.edit4,'String'));
    long_final       = strcat('[',num2str(long_min),',',num2str(long_max),']');
    lat_min          = str2double(get(handles.edit2,'String'));
    lat_max          = str2double(get(handles.edit5,'String'));
    lat_final        = strcat('[',num2str(lat_min),',',num2str(lat_max),']');
    
    %Create the command
    eval_m_proj      = strcat('m_proj(',proj_name,',''long'',',long_final,',''lat'',',lat_final,')');
    
    %Set boolean variables
    valid_projection = 1;
    is_azimuthal     = 0;
    is_cylindrical   = 1;
    is_conic         = 0;
    is_miscellaneous = 0;
    
    %Close Cylindrical projection GUI
    close select_cylindrical
    
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



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

%Set global variables
global phi_data lamda_data

if get(handles.checkbox1,'Value') == 1
    
    set(handles.edit1,'String',num2str(min(lamda_data)));
    set(handles.edit4,'String',num2str(max(lamda_data)));
    set(handles.edit2,'String',num2str(min(phi_data)));
    set(handles.edit5,'String',num2str(max(phi_data)));
    
    set(handles.edit1,'Enable','off');
    set(handles.edit4,'Enable','off');
    set(handles.edit2,'Enable','off');
    set(handles.edit5,'Enable','off');
    
elseif get(handles.checkbox1,'Value') == 0
    
    set(handles.edit1,'String','');
    set(handles.edit4,'String','');
    set(handles.edit2,'String','');
    set(handles.edit5,'String','');
    
    set(handles.edit1,'Enable','on');
    set(handles.edit4,'Enable','on');
    set(handles.edit2,'Enable','on');
    set(handles.edit5,'Enable','on');
    
end
