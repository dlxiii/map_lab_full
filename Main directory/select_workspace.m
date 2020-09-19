function varargout = select_workspace(varargin)
% SELECT_WORKSPACE MATLAB code for select_workspace.fig
%      SELECT_WORKSPACE, by itself, creates a new SELECT_WORKSPACE or raises the existing
%      singleton*.
%
%      H = SELECT_WORKSPACE returns the handle to a new SELECT_WORKSPACE or the handle to
%      the existing singleton*.
%
%      SELECT_WORKSPACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_WORKSPACE.M with the given input arguments.
%
%      SELECT_WORKSPACE('Property','Value',...) creates a new SELECT_WORKSPACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_workspace_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_workspace_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_workspace

% Last Modified by GUIDE v2.5 15-Aug-2016 08:26:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_workspace_OpeningFcn, ...
    'gui_OutputFcn',  @select_workspace_OutputFcn, ...
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


% --- Executes just before select_workspace is made visible.
function select_workspace_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_workspace (see VARARGIN)

% Choose default command line output for select_workspace
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_workspace wait for user response (see UIRESUME)
% uiwait(handles.select_workspace);


% --- Outputs from this function are returned to the command line.
function varargout = select_workspace_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%Get the names of all variales in the base workspace
workspace_var = evalin('base','who');

%Set all the variable names to the popup menus
set(handles.popupmenu1,'String',['none';workspace_var])
set(handles.popupmenu2,'String',['none';workspace_var])
set(handles.popupmenu3,'String',['none';workspace_var])
set(handles.popupmenu4,'String',['none';workspace_var])
set(handles.popupmenu5,'String',['none';workspace_var])


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

if get(handles.popupmenu1,'Value') ~= 1 && get(handles.popupmenu2,'Value') ~= 1
    
    set(handles.popupmenu3,'Enable','on')
    
else
    
    set(handles.popupmenu3,'Value',1)
    set(handles.popupmenu3,'Enable','off')
    
    set(handles.popupmenu4,'Value',1)
    set(handles.popupmenu4,'Enable','off')
    
    set(handles.popupmenu5,'Value',1)
    set(handles.popupmenu5,'Enable','off')
    
end


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2

if get(handles.popupmenu1,'Value') ~= 1 && get(handles.popupmenu2,'Value') ~= 1
    
    set(handles.popupmenu3,'Enable','on')
    
else
    
    set(handles.popupmenu3,'Value',1)
    set(handles.popupmenu3,'Enable','off')
    
    set(handles.popupmenu4,'Value',1)
    set(handles.popupmenu4,'Enable','off')
    
    set(handles.popupmenu5,'Value',1)
    set(handles.popupmenu5,'Enable','off')
    
end


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3

if get(handles.popupmenu3,'Value') ~= 1
    
    set(handles.popupmenu4,'Enable','on')
    
else
    
    set(handles.popupmenu4,'Value',1)
    set(handles.popupmenu4,'Enable','off')
    
    set(handles.popupmenu5,'Value',1)
    set(handles.popupmenu5,'Enable','off')
    
end


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4

if get(handles.popupmenu4,'Value') ~= 1
    
    set(handles.popupmenu5,'Enable','on')
    
else
    
    set(handles.popupmenu5,'Value',1)
    set(handles.popupmenu5,'Enable','off')
    
end


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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
global phi_data lamda_data field1 field2 field3 num valid_filename is_workspace is_file
global var_value_phi var_value_lamda var_value_field1 var_value_field2 var_value_field3

%Get the variable names
var_names              = get(handles.popupmenu1,'String');

%Get the variables for every popupmenu
var_value_phi          = get(handles.popupmenu1,'Value');
var_value_lamda        = get(handles.popupmenu2,'Value');
var_value_field1       = get(handles.popupmenu3,'Value');
var_value_field2       = get(handles.popupmenu4,'Value');
var_value_field3       = get(handles.popupmenu5,'Value');

var_name_phi           = cell2mat(var_names(var_value_phi));
var_name_lamda         = cell2mat(var_names(var_value_lamda));
var_name_field1        = cell2mat(var_names(var_value_field1));
var_name_field2        = cell2mat(var_names(var_value_field2));
var_name_field3        = cell2mat(var_names(var_value_field3));

%Initialize number of selected data
num(1,2)               = 0;

%Check if latitude data are selected
if strcmp(var_name_phi,'none') == 0
    
    num(1,2)           = num(1,2) + 1;
    
else
    
    errordlg('Please select more data.','Data Error');
    return
    
end

%Check if longitude data are selected
if strcmp(var_name_lamda,'none') == 0
    
    num(1,2)           = num(1,2) + 1;
    
else
    
    errordlg('Please select more data.','Data Error');
    return
    
end

%Check if Data set 1 is selected
if strcmp(var_name_field1,'none') == 0
    
    num(1,2)           = num(1,2) + 1;
    
else
    
    errordlg('Please select more data.','Data Error');
    return
    
end

%Check if Data set 2 is selected
if strcmp(var_name_field2,'none') == 0
    
    num(1,2)           = num(1,2) + 1;
    
end

%Check if Data set 3 is selected
if strcmp(var_name_field3,'none') == 0
    
    num(1,2)           = num(1,2) + 1;
    
end

%Get the latitude and longitude data
phi_data               = evalin('base',var_name_phi);
lamda_data             = evalin('base',var_name_lamda);
phi_data               = phi_data(:);
lamda_data             = lamda_data(:);

if size(phi_data,1) == size(lamda_data,1)
    
    num(1,1)           = size(phi_data,1);
    
else
    
    errordlg('Wrong dimensions of input data.','Data Error');
    return
    
end

start_h                = findobj('Tag','start');
start_gui              = guidata(start_h);

if num(1,2) == 3
    
    %Get Data set 1
    field1             = evalin('base',var_name_field1);
    field1             = field1(:);
    field2             = [];
    field3             = [];
    
    if size(phi_data,1) == size(field1,1)
        
        set(start_gui.text26,'String',min(field1));
        set(start_gui.text31,'String',max(field1));
        set(start_gui.text37,'String',mean(field1));
        set(start_gui.text41,'String',std(field1));
        
        set(start_gui.text27,'String','-');
        set(start_gui.text32,'String','-');
        set(start_gui.text38,'String','-');
        set(start_gui.text42,'String','-');
        
        set(start_gui.text34,'String','-');
        set(start_gui.text35,'String','-');
        set(start_gui.text39,'String','-');
        set(start_gui.text43,'String','-');
        
        set(start_gui.text24,'Enable','off');
        set(start_gui.text27,'Enable','off');
        set(start_gui.text32,'Enable','off');
        set(start_gui.text38,'Enable','off');
        set(start_gui.text42,'Enable','off');
        
        set(start_gui.text33,'Enable','off');
        set(start_gui.text34,'Enable','off');
        set(start_gui.text35,'Enable','off');
        set(start_gui.text39,'Enable','off');
        set(start_gui.text43,'Enable','off');
        
    else
        
        errordlg('Wrong dimensions of input data.','Data Error');
        return
        
    end
    
elseif num(1,2) == 4
    
    %Get Data set 1 and 2
    field1             = evalin('base',var_name_field1);
    field2             = evalin('base',var_name_field2);
    field1             = field1(:);
    field2             = field2(:);
    field3             = [];
    
    if size(phi_data,1) == size(field1,1) && size(phi_data,1) == size(field2,1)
        
        set(start_gui.text26,'String',min(field1));
        set(start_gui.text31,'String',max(field1));
        set(start_gui.text37,'String',mean(field1));
        set(start_gui.text41,'String',std(field1));
        
        set(start_gui.text27,'String',min(field2));
        set(start_gui.text32,'String',max(field2));
        set(start_gui.text38,'String',mean(field2));
        set(start_gui.text42,'String',std(field2));
        
        set(start_gui.text34,'String','-');
        set(start_gui.text35,'String','-');
        set(start_gui.text39,'String','-');
        set(start_gui.text43,'String','-');
        
        set(start_gui.text24,'Enable','on');
        set(start_gui.text27,'Enable','on');
        set(start_gui.text32,'Enable','on');
        set(start_gui.text38,'Enable','on');
        set(start_gui.text42,'Enable','on');
        
        set(start_gui.text33,'Enable','off');
        set(start_gui.text34,'Enable','off');
        set(start_gui.text35,'Enable','off');
        set(start_gui.text39,'Enable','off');
        set(start_gui.text43,'Enable','off');
        
    else
        
        errordlg('Wrong dimensions of input data.','Data Error');
        return
        
    end
    
elseif num(1,2) == 5
    
    %Get Data set 1, 2 and 3
    field1             = evalin('base',var_name_field1);
    field2             = evalin('base',var_name_field2);
    field3             = evalin('base',var_name_field3);
    field1             = field1(:);
    field2             = field2(:);
    field3             = field3(:);
    
    if size(phi_data,1) == size(field1,1) && size(phi_data,1) == size(field2,1) && size(phi_data,1) == size(field3,1)
        
        set(start_gui.text26,'String',min(field1));
        set(start_gui.text31,'String',max(field1));
        set(start_gui.text37,'String',mean(field1));
        set(start_gui.text41,'String',std(field1));
        
        set(start_gui.text27,'String',min(field2));
        set(start_gui.text32,'String',max(field2));
        set(start_gui.text38,'String',mean(field2));
        set(start_gui.text42,'String',std(field2));
        
        set(start_gui.text34,'String',min(field3));
        set(start_gui.text35,'String',max(field3));
        set(start_gui.text39,'String',mean(field3));
        set(start_gui.text43,'String',std(field3));
        
        set(start_gui.text24,'Enable','on');
        set(start_gui.text27,'Enable','on');
        set(start_gui.text32,'Enable','on');
        set(start_gui.text38,'Enable','on');
        set(start_gui.text42,'Enable','on');
        
        set(start_gui.text33,'Enable','on');
        set(start_gui.text34,'Enable','on');
        set(start_gui.text35,'Enable','on');
        set(start_gui.text39,'Enable','on');
        set(start_gui.text43,'Enable','on');
        
    else
        
        errordlg('Wrong dimensions of input data.','Data Error');
        return
        
    end
    
end

set(start_gui.edit1,'String','MATLAB Workspace');
set(start_gui.text16,'String',min(phi_data));
set(start_gui.text17,'String',max(phi_data));
set(start_gui.text9,'String',min(lamda_data));
set(start_gui.text10,'String',max(lamda_data));
set(start_gui.text11,'String',num(1,1));

%Set boolean variables
valid_filename         = 1;
is_workspace           = 1;
is_file                = 0;

%Close Workspace GUI
close select_workspace
