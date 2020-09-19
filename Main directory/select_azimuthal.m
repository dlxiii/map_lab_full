function varargout = select_azimuthal(varargin)
% SELECT_AZIMUTHAL M-file for select_azimuthal.fig
%      SELECT_AZIMUTHAL, by itself, creates a new SELECT_AZIMUTHAL or raises the existing
%      singleton*.
%
%      H = SELECT_AZIMUTHAL returns the handle to a new SELECT_AZIMUTHAL or the handle to
%      the existing singleton*.
%
%      SELECT_AZIMUTHAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_AZIMUTHAL.M with the given input arguments.
%
%      SELECT_AZIMUTHAL('Property','Value',...) creates a new SELECT_AZIMUTHAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_azimuthal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_azimuthal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_azimuthal

% Last Modified by GUIDE v2.5 08-Aug-2016 05:51:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_azimuthal_OpeningFcn, ...
    'gui_OutputFcn',  @select_azimuthal_OutputFcn, ...
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


% --- Executes just before select_azimuthal is made visible.
function select_azimuthal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_azimuthal (see VARARGIN)

% Choose default command line output for select_azimuthal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_azimuthal wait for user response (see UIRESUME)
% uiwait(handles.select_azimuthal);


% --- Outputs from this function are returned to the command line.
function varargout = select_azimuthal_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global proj_name center_long center_lat radius_value eval_m_proj valid_projection
global is_azimuthal is_cylindrical is_conic is_miscellaneous

%Check for wrong projection parameters
if isnan(str2double(get(handles.edit1,'String'))) == 1 || isnan(str2double(get(handles.edit2,'String'))) == 1 || isnan(str2double(get(handles.edit3,'String'))) == 1
    
    errordlg('Wrong or empty projection parameters. Please select valid parameters!','Projection Error')
    return
    
else
    
    %Get the projection name
    if get(handles.radiobutton1,'Value') == 1
        
        proj_name    = '''Stereographic''';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        proj_name    = '''Orthographic''';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        proj_name    = '''Azimuthal Equal-Area''';
        
    elseif get(handles.radiobutton4,'Value') == 1
        
        proj_name    = '''Azimuthal Equidistant''';
        
    elseif get(handles.radiobutton5,'Value') == 1
        
        proj_name    = '''Gnomonic''';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        proj_name    = '''Satellite''';
        
    end
    
    %Get the projection parameters
    center_long      = str2double(get(handles.edit1,'String'));
    center_lat       = str2double(get(handles.edit2,'String'));
    radius_value     = str2double(get(handles.edit3,'String'));
    
    %Create the command
    eval_m_proj      = strcat('m_proj(',proj_name,',''long'',',num2str(center_long),',''lat'',',num2str(center_lat),',''radius'',',num2str(radius_value),')');
    
    %Set boolean variables
    valid_projection = 1;
    is_azimuthal     = 1;
    is_cylindrical   = 0;
    is_conic         = 0;
    is_miscellaneous = 0;
    
    %Close Azimuthal projection GUI
    close select_azimuthal
    
end
