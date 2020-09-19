function varargout = select_vector(varargin)
% SELECT_VECTOR M-file for select_vector.fig
%      SELECT_VECTOR, by itself, creates a new SELECT_VECTOR or raises the existing
%      singleton*.
%
%      H = SELECT_VECTOR returns the handle to a new SELECT_VECTOR or the handle to
%      the existing singleton*.
%
%      SELECT_VECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_VECTOR.M with the given input arguments.
%
%      SELECT_VECTOR('Property','Value',...) creates a new SELECT_VECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_vector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_vector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_vector

% Last Modified by GUIDE v2.5 13-Aug-2016 05:20:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_vector_OpeningFcn, ...
    'gui_OutputFcn',  @select_vector_OutputFcn, ...
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


% --- Executes just before select_vector is made visible.
function select_vector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_vector (see VARARGIN)

% Choose default command line output for select_vector
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_vector wait for user response (see UIRESUME)
% uiwait(handles.select_vector);


% --- Outputs from this function are returned to the command line.
function varargout = select_vector_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global scale_factor shaft_width line_width head_length centered_boolean color_filled color_edge eval_m_vec valid_vector

%Check for wrong vector parameters
if isnan(str2double(get(handles.edit4,'String'))) == 1 || isnan(str2double(get(handles.edit1,'String'))) == 1 || isnan(str2double(get(handles.edit2,'String'))) == 1 || isnan(str2double(get(handles.edit3,'String'))) == 1
    
    errordlg('Wrong or empty vector parameters. Please select valid vector parameters!','Vector parameters error')
    return
    
else
    
    %Get the centering
    if get(handles.radiobutton19,'Value') == 1
        
        centered_boolean = 0;
        
    elseif get(handles.radiobutton20,'Value') == 1
        
        centered_boolean = 1;
        
    end
    
    %Get the filled color
    if get(handles.radiobutton1,'Value') == 1
        
        color_filled     = '''r''';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        color_filled     = '''g''';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        color_filled     = '''b''';
        
    elseif get(handles.radiobutton4,'Value') == 1
        
        color_filled     = '''c''';
        
    elseif get(handles.radiobutton5,'Value') == 1
        
        color_filled     = '''m''';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        color_filled     = '''y''';
        
    elseif get(handles.radiobutton7,'Value') == 1
        
        color_filled     = '''k''';
        
    elseif get(handles.radiobutton8,'Value') == 1
        
        color_filled     = '''w''';
        
    end
    
    %Get the edge color
    if get(handles.radiobutton10,'Value') == 1
        
        color_edge       = '''r''';
        
    elseif get(handles.radiobutton11,'Value') == 1
        
        color_edge       = '''g''';
        
    elseif get(handles.radiobutton12,'Value') == 1
        
        color_edge       = '''b''';
        
    elseif get(handles.radiobutton13,'Value') == 1
        
        color_edge       = '''c''';
        
    elseif get(handles.radiobutton14,'Value') == 1
        
        color_edge       = '''m''';
        
    elseif get(handles.radiobutton15,'Value') == 1
        
        color_edge       = '''y''';
        
    elseif get(handles.radiobutton16,'Value') == 1
        
        color_edge       = '''k''';
        
    elseif get(handles.radiobutton17,'Value') == 1
        
        color_edge       = '''w''';
        
    end
    
    %Get the vector parameters
    scale_factor         = str2double(get(handles.edit4,'String'));
    shaft_width          = str2double(get(handles.edit1,'String'));
    line_width           = str2double(get(handles.edit2,'String'));
    head_length          = str2double(get(handles.edit3,'String'));
    
    %Create the command
    if centered_boolean == 0
        
        eval_m_vec       = strcat('m_vec','(',num2str(scale_factor),',','lamda_data',',','phi_data',',',...
            'field1',',','field2',',',color_filled,...
            ',''shaftwidth'',',num2str(shaft_width),...
            ',''headlength'',',num2str(head_length),...
            ',''linewidth'',',num2str(line_width),...
            ',''EdgeColor'',',color_edge,')');
        
    elseif centered_boolean == 1
        
        eval_m_vec       = strcat('m_vec','(',num2str(scale_factor),',','lamda_data',',','phi_data',',',...
            'field1',',','field2',',',color_filled,...
            ',''centered'',','''yes''',...
            ',''shaftwidth'',',num2str(shaft_width),...
            ',''headlength'',',num2str(head_length),...
            ',''linewidth'',',num2str(line_width),...
            ',''EdgeColor'',',color_edge,')');
        
    end
    
    %Set boolean variables
    valid_vector         = 1;
    
    %Close Vector parameters GUI
    close select_vector
    
end
