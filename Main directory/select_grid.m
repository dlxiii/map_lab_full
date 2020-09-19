function varargout = select_grid(varargin)
% SELECT_GRID M-file for select_grid.fig
%      SELECT_GRID, by itself, creates a new SELECT_GRID or raises the existing
%      singleton*.
%
%      H = SELECT_GRID returns the handle to a new SELECT_GRID or the handle to
%      the existing singleton*.
%
%      SELECT_GRID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_GRID.M with the given input arguments.
%
%      SELECT_GRID('Property','Value',...) creates a new SELECT_GRID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_grid_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_grid_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_grid

% Last Modified by GUIDE v2.5 10-Aug-2016 12:24:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_grid_OpeningFcn, ...
    'gui_OutputFcn',  @select_grid_OutputFcn, ...
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


% --- Executes just before select_grid is made visible.
function select_grid_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_grid (see VARARGIN)

% Choose default command line output for select_grid
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_grid wait for user response (see UIRESUME)
% uiwait(handles.select_grid_parameters);


% --- Outputs from this function are returned to the command line.
function varargout = select_grid_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global grid_box grid_tickstyle grid_color grid_linewidth grid_fontsize grid_X_axis grid_Y_axis eval_m_grid valid_grid

%Check for wrong grid parameters
if (isnan(str2double(get(handles.edit1,'String'))) == 1) || (isnan(str2double(get(handles.edit2,'String'))) == 1)
    
    errordlg('Wrong or empty grid parameters. Please select valid parameters!','Grid Error')
    return
    
else
    
    %Get grid box
    if get(handles.radiobutton1,'Value') == 1
        
        grid_box       = '''on''';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        grid_box       = '''off''';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        grid_box       = '''fancy''';
        
    end
    
    %Get grid tickstyle
    if get(handles.radiobutton19,'Value') == 1
        
        grid_tickstyle = '''dd''';
        
    elseif get(handles.radiobutton20,'Value') == 1
        
        grid_tickstyle = '''dm''';
        
    end
    
    %Get grid color
    if get(handles.radiobutton10,'Value') == 1
        
        grid_color     = '''r''';
        
    elseif get(handles.radiobutton11,'Value') ==1
        
        grid_color     = '''g''';
        
    elseif get(handles.radiobutton12,'Value') == 1
        
        grid_color     = '''b''';
        
    elseif get(handles.radiobutton13,'Value') == 1
        
        grid_color     = '''c''';
        
    elseif get(handles.radiobutton14,'Value') == 1
        
        grid_color     = '''m''';
        
    elseif get(handles.radiobutton15,'Value') == 1
        
        grid_color     = '''y''';
        
    elseif get(handles.radiobutton16,'Value') == 1
        
        grid_color     = '''k''';
        
    elseif get(handles.radiobutton17,'Value') == 1
        
        grid_color     = '''w''';
        
    end
    
    %Get grid line width
    grid_linewidth     = str2double(get(handles.edit1,'String'));
    
    %Get grid font size
    grid_fontsize      = str2double(get(handles.edit2,'String'));
    
    %Get grid x-axis location
    if get(handles.radiobutton4,'Value') == 1
        
        grid_X_axis    = '''bottom''';
        
    elseif get(handles.radiobutton5,'Value') == 1
        
        grid_X_axis    = '''middle''';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        grid_X_axis    = '''top''';
        
    end
    
    %Get grid y-axis location
    if get(handles.radiobutton7,'Value') == 1
        
        grid_Y_axis    = '''left''';
        
    elseif get(handles.radiobutton8,'Value') == 1
        
        grid_Y_axis    = '''middle''';
        
    elseif get(handles.radiobutton9,'Value') == 1
        
        grid_Y_axis    = '''right''';
        
    end
    
    %Create the command
    eval_m_grid        = strcat('m_grid','(',...
        '''box'',',grid_box,...
        ',''tickstyle'',',grid_tickstyle,...
        ',''color'',',grid_color,...
        ',''linewidth'',',num2str(grid_linewidth),...
        ',''fontsize'',',num2str(grid_fontsize),...
        ',''XaxisLocation'',',grid_X_axis,...
        ',''YaxisLocation'',',grid_Y_axis,...
        ')');
    
    %Set boolean variables
    valid_grid         = 1;
    
    %Close Grid parameters GUI
    close select_grid
    
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
