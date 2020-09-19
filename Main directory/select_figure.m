function varargout = select_figure(varargin)
% SELECT_FIGURE M-file for select_figure.fig
%      SELECT_FIGURE, by itself, creates a new SELECT_FIGURE or raises the existing
%      singleton*.
%
%      H = SELECT_FIGURE returns the handle to a new SELECT_FIGURE or the handle to
%      the existing singleton*.
%
%      SELECT_FIGURE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_FIGURE.M with the given input arguments.
%
%      SELECT_FIGURE('Property','Value',...) creates a new SELECT_FIGURE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_figure_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_figure_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_figure

% Last Modified by GUIDE v2.5 17-Aug-2016 04:52:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_figure_OpeningFcn, ...
    'gui_OutputFcn',  @select_figure_OutputFcn, ...
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


% --- Executes just before select_figure is made visible.
function select_figure_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_figure (see VARARGIN)

% Choose default command line output for select_figure
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_figure wait for user response (see UIRESUME)
% uiwait(handles.select_figure);


% --- Outputs from this function are returned to the command line.
function varargout = select_figure_OutputFcn(hObject, eventdata, handles)
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
global figure_window save_figure figure_name figure_dpi eval_save is_figure

%Get figure window
if get(handles.radiobutton1,'Value') == 1
    
    figure_window   = 'Default Size';
    
elseif get(handles.radiobutton2,'Value') == 1
    
    figure_window   = 'Maximized';
    
end

%Get figure saving option
if get(handles.radiobutton4,'Value') == 1
    
    save_figure     = 'No';
    
elseif get(handles.radiobutton5,'Value') == 1
    
    %Check for wrong figure parameters
    if isnan(str2double(get(handles.edit4,'String'))) == 1 || isempty(get(handles.edit5,'String')) == 1
        
        errordlg('Wrong or empty print parameters. Please select valid print parameters!','Print Error')
        return
        
    else
        
        save_figure = 'Yes';
        
        %Get figure name and resolution
        figure_dpi  = str2double(get(handles.edit4,'String'));
        figure_name = get(handles.edit5,'String');
        
        %Create the command
        eval_save   = strcat('print(ff,','''-dpng'',','''-r',num2str(figure_dpi),''',','''',figure_name,'.png','''',')');
        
    end
    
end

%Set boolean variables
is_figure           = 1;

%Close Figure parameters GUI
close select_figure


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4

set(handles.radiobutton4,'Value',1)
set(handles.radiobutton5,'Value',0)
set(handles.text5,'Enable','off')
set(handles.text6,'Enable','off')
set(handles.edit4,'Enable','off')
set(handles.edit5,'Enable','off')


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5

set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',1)
set(handles.text5,'Enable','on')
set(handles.text6,'Enable','on')
set(handles.edit4,'Enable','on')
set(handles.edit5,'Enable','on')


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
