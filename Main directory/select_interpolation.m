function varargout = select_interpolation(varargin)
% SELECT_INTERPOLATION M-file for select_interpolation.fig
%      SELECT_INTERPOLATION, by itself, creates a new SELECT_INTERPOLATION or raises the existing
%      singleton*.
%
%      H = SELECT_INTERPOLATION returns the handle to a new SELECT_INTERPOLATION or the handle to
%      the existing singleton*.
%
%      SELECT_INTERPOLATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_INTERPOLATION.M with the given input arguments.
%
%      SELECT_INTERPOLATION('Property','Value',...) creates a new SELECT_INTERPOLATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_interpolation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_interpolation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_interpolation

% Last Modified by GUIDE v2.5 11-Aug-2016 14:06:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_interpolation_OpeningFcn, ...
    'gui_OutputFcn',  @select_interpolation_OutputFcn, ...
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


% --- Executes just before select_interpolation is made visible.
function select_interpolation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_interpolation (see VARARGIN)

% Choose default command line output for select_interpolation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_interpolation wait for user response (see UIRESUME)
% uiwait(handles.select_interpolation);


% --- Outputs from this function are returned to the command line.
function varargout = select_interpolation_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global num phi_data lamda_data field1 field2 field3 LAMDA PHI FIELD_INTERP field_interp
global interp_method interp_step min_lamda_interp max_lamda_interp min_phi_interp max_phi_interp valid_interpolation

%Check for input file size
if num(1,2) == 3
    
    field_interp        = field1;
    
elseif num(1,2) == 4
    
    opt = menu('Which data set would you like to interpolate?','Data set 1','Data set 2');
    
    if opt == 1
        
        field_interp    = field1;
        
    elseif opt == 2
        
        field_interp    = field2;
        
    end
    
elseif num(1,2) == 5
    
    opt = menu('Which data set would you like to interpolate?','Data set 1','Data set 2','Data set 3');
    
    if opt == 1
        
        field_interp    = field1;
        
    elseif opt == 2
        
        field_interp    = field2;
        
    elseif opt == 3
        
        field_interp    = field3;
        
    end
    
end

%Check for wrong interpolation parameters
if isnan(str2double(get(handles.edit1,'String'))) == 1 || isnan(str2double(get(handles.edit2,'String'))) == 1 || isnan(str2double(get(handles.edit4,'String'))) == 1 || isnan(str2double(get(handles.edit3,'String'))) || isnan(str2double(get(handles.edit5,'String')))
    
    errordlg('Wrong or empty interpolation parameters. Please select valid interpolation parameters!','Interpolation parameters Error')
    return
    
else
    
    %Get the interpolation method
    if get(handles.radiobutton1,'Value') == 1
        
        interp_method   = 'linear';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        interp_method   = 'cubic';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        interp_method   = 'nearest';
        
    elseif get(handles.radiobutton4,'Value') == 1
        
        interp_method   = 'v4';
        
    end
    
    %Get the interpolation step and limits
    interp_step         = str2double(get(handles.edit1,'String'));
    min_lamda_interp    = str2double(get(handles.edit2,'String'));
    max_lamda_interp    = str2double(get(handles.edit4,'String'));
    min_phi_interp      = str2double(get(handles.edit3,'String'));
    max_phi_interp      = str2double(get(handles.edit5,'String'));
    
    %Make the interpolation
    phigrid             = (min_phi_interp:interp_step:max_phi_interp)';
    lamdagrid           = (min_lamda_interp:interp_step:max_lamda_interp)';
    [LAMDA,PHI]         = meshgrid(lamdagrid,phigrid);
    FIELD_INTERP        = griddata(lamda_data,phi_data,field_interp,LAMDA,PHI,interp_method);
    
    %Set boolean variables
    valid_interpolation = 1;
    
    %Close Interpolation parameters GUI
    close select_interpolation
    
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
    
    set(handles.edit2,'String',num2str(min(lamda_data)));
    set(handles.edit4,'String',num2str(max(lamda_data)));
    set(handles.edit3,'String',num2str(min(phi_data)));
    set(handles.edit5,'String',num2str(max(phi_data)));
    
    set(handles.edit2,'Enable','off');
    set(handles.edit4,'Enable','off');
    set(handles.edit3,'Enable','off');
    set(handles.edit5,'Enable','off');
    
elseif get(handles.checkbox1,'Value') == 0
    
    set(handles.edit2,'String','');
    set(handles.edit4,'String','');
    set(handles.edit3,'String','');
    set(handles.edit5,'String','');
    
    set(handles.edit2,'Enable','on');
    set(handles.edit4,'Enable','on');
    set(handles.edit3,'Enable','on');
    set(handles.edit5,'Enable','on');
    
end
