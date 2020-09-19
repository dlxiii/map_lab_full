function varargout = select_ellipses(varargin)
% SELECT_ELLIPSES M-file for select_ellipses.fig
%      SELECT_ELLIPSES, by itself, creates a new SELECT_ELLIPSES or raises the existing
%      singleton*.
%
%      H = SELECT_ELLIPSES returns the handle to a new SELECT_ELLIPSES or the handle to
%      the existing singleton*.
%
%      SELECT_ELLIPSES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_ELLIPSES.M with the given input arguments.
%
%      SELECT_ELLIPSES('Property','Value',...) creates a new SELECT_ELLIPSES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_ellipses_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_ellipses_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_ellipses

% Last Modified by GUIDE v2.5 16-Aug-2016 03:07:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_ellipses_OpeningFcn, ...
    'gui_OutputFcn',  @select_ellipses_OutputFcn, ...
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


% --- Executes just before select_ellipses is made visible.
function select_ellipses_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_ellipses (see VARARGIN)

% Choose default command line output for select_ellipses
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_ellipses wait for user response (see UIRESUME)
% uiwait(handles.select_ellipses);


% --- Outputs from this function are returned to the command line.
function varargout = select_ellipses_OutputFcn(hObject, eventdata, handles)
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
global ellipses_scale_factor ellipses_line_width ellipses_line_style ellipses_line_color eval_ellipses
global center_ellipses center_edgecolor center_facecolor center_markertype center_markersize eval_center_ellipses valid_ellipses

%Check for wrong ellipses parameters
if isnan(str2double(get(handles.edit1,'String'))) == 1 || isnan(str2double(get(handles.edit5,'String'))) == 1
    
    errordlg('Wrong or empty ellipses parameters. Please select valid ellipses parameters!','Ellipses Parameters Error')
    return
    
else
    
    %Get the scale factor and line width
    ellipses_scale_factor     = str2double(get(handles.edit1,'String'));
    ellipses_line_width       = str2double(get(handles.edit5,'String'));
    
    %Get the line style
    if get(handles.radiobutton1,'Value') == 1
        
        ellipses_line_style   = '-';
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        ellipses_line_style   = '--';
        
    elseif get(handles.radiobutton3,'Value') == 1
        
        ellipses_line_style   = ':';
        
    elseif get(handles.radiobutton4,'Value') == 1
        
        ellipses_line_style   = '-.';
        
    end
    
    %Get the line color
    if get(handles.radiobutton5,'Value') == 1
        
        ellipses_line_color   = 'r';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        ellipses_line_color   = 'g';
        
    elseif get(handles.radiobutton7,'Value') == 1
        
        ellipses_line_color   = 'b';
        
    elseif get(handles.radiobutton8,'Value') == 1
        
        ellipses_line_color   = 'c';
        
    elseif get(handles.radiobutton9,'Value') == 1
        
        ellipses_line_color   = 'm';
        
    elseif get(handles.radiobutton10,'Value') == 1
        
        ellipses_line_color   = 'y';
        
    elseif get(handles.radiobutton11,'Value') == 1
        
        ellipses_line_color   = 'k';
        
    elseif get(handles.radiobutton12,'Value') == 1
        
        ellipses_line_color   = 'w';
        
    end
    
    %Check for wrong ellipses center parameters and if ellipses center is selected
    if get(handles.radiobutton46,'Value') == 1 && isnan(str2double(get(handles.edit4,'String'))) == 1
        
        errordlg('Wrong or empty ellipses parameters. Please select valid ellipses parameters!','Ellipses Parameters Error')
        return
        
    elseif get(handles.radiobutton46,'Value') == 1 && isnan(str2double(get(handles.edit4,'String'))) ~= 1
        
        center_ellipses       = 'yes';
        
        %Get center markersize
        center_markersize     = str2double(get(handles.edit4,'String'));
        
        %Get center edge color
        if get(handles.radiobutton47,'Value') == 1
            
            center_edgecolor  = '''r''';
            
        elseif get(handles.radiobutton48,'Value') == 1
            
            center_edgecolor  = '''g''';
            
        elseif get(handles.radiobutton49,'Value') == 1
            
            center_edgecolor  = '''b''';
            
        elseif get(handles.radiobutton50,'Value') == 1
            
            center_edgecolor  = '''c''';
            
        elseif get(handles.radiobutton51,'Value') == 1
            
            center_edgecolor  = '''m''';
            
        elseif get(handles.radiobutton52,'Value') == 1
            
            center_edgecolor  = '''y''';
            
        elseif get(handles.radiobutton53,'Value') == 1
            
            center_edgecolor  = '''k''';
            
        elseif get(handles.radiobutton54,'Value') == 1
            
            center_edgecolor  = '''w''';
            
        end
        
        %Get center facecolor
        if get(handles.radiobutton64,'Value') == 1
            
            center_facecolor  = '''none''';
            
        elseif get(handles.radiobutton56,'Value') == 1
            
            center_facecolor  = '''r''';
            
        elseif get(handles.radiobutton57,'Value') == 1
            
            center_facecolor  = '''g''';
            
        elseif get(handles.radiobutton58,'Value') == 1
            
            center_facecolor  = '''b''';
            
        elseif get(handles.radiobutton59,'Value') == 1
            
            center_facecolor  = '''c''';
            
        elseif get(handles.radiobutton60,'Value') == 1
            
            center_facecolor  = '''m''';
            
        elseif get(handles.radiobutton61,'Value') == 1
            
            center_facecolor  = '''y''';
            
        elseif get(handles.radiobutton62,'Value') == 1
            
            center_facecolor  = '''k''';
            
        elseif get(handles.radiobutton63,'Value') == 1
            
            center_facecolor  = '''w''';
            
        end
        
        %Get center markertype
        if get(handles.radiobutton73,'Value') == 1
            
            center_markertype = '''+''';
            
        elseif get(handles.radiobutton65,'Value') == 1
            
            center_markertype = '''o''';
            
        elseif get(handles.radiobutton66,'Value') == 1
            
            center_markertype = '''*''';
            
        elseif get(handles.radiobutton67,'Value') == 1
            
            center_markertype = '''.''';
            
        elseif get(handles.radiobutton68,'Value') == 1
            
            center_markertype = '''x''';
            
        elseif get(handles.radiobutton69,'Value') == 1
            
            center_markertype = '''s''';
            
        elseif get(handles.radiobutton70,'Value') == 1
            
            center_markertype = '''d''';
            
        elseif get(handles.radiobutton71,'Value') == 1
            
            center_markertype = '''^''';
            
        elseif get(handles.radiobutton72,'Value') == 1
            
            center_markertype = '''v''';
            
        elseif get(handles.radiobutton74,'Value') == 1
            
            center_markertype = '''>''';
            
        elseif get(handles.radiobutton75,'Value') == 1
            
            center_markertype = '''<''';
            
        elseif get(handles.radiobutton76,'Value') == 1
            
            center_markertype = '''p''';
            
        elseif get(handles.radiobutton77,'Value') == 1
            
            center_markertype = '''h''';
            
        end
        
        %Create the command (ellipses centers)
        eval_center_ellipses  = strcat('m_line','(','lamda_data(i,1),phi_data(i,1)',',''marker'',',center_markertype,',''markersize'',',num2str(center_markersize),',''markerfacecolor'',',center_facecolor,',''color'',',center_edgecolor,')');
        
    else
        
        center_ellipses       = 'no';
        
    end
    
    %Create the command (ellipses)
    eval_ellipses             = strcat('plot(XX(:,:,i),YY(:,:,i),','''',ellipses_line_style,ellipses_line_color,'''',',''LineWidth'',',num2str(ellipses_line_width),')');
    
    %Set boolean variables
    valid_ellipses            = 1;
    
    %Close Error Ellipses parameters GUI
    close select_ellipses
    
end


% Hint: get(hObject,'Value') returns toggle state of radiobutton45
% --- Executes on button press in radiobutton45.
function radiobutton45_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton45

set(handles.radiobutton45,'Value',1)
set(handles.radiobutton46,'Value',0)
set(handles.radiobutton47,'Enable','off')
set(handles.radiobutton48,'Enable','off')
set(handles.radiobutton49,'Enable','off')
set(handles.radiobutton50,'Enable','off')
set(handles.radiobutton51,'Enable','off')
set(handles.radiobutton52,'Enable','off')
set(handles.radiobutton53,'Enable','off')
set(handles.radiobutton54,'Enable','off')

set(handles.radiobutton56,'Enable','off')
set(handles.radiobutton57,'Enable','off')
set(handles.radiobutton58,'Enable','off')
set(handles.radiobutton59,'Enable','off')
set(handles.radiobutton60,'Enable','off')
set(handles.radiobutton61,'Enable','off')
set(handles.radiobutton62,'Enable','off')
set(handles.radiobutton63,'Enable','off')
set(handles.radiobutton64,'Enable','off')

set(handles.radiobutton65,'Enable','off')
set(handles.radiobutton66,'Enable','off')
set(handles.radiobutton67,'Enable','off')
set(handles.radiobutton68,'Enable','off')
set(handles.radiobutton69,'Enable','off')
set(handles.radiobutton70,'Enable','off')
set(handles.radiobutton71,'Enable','off')
set(handles.radiobutton72,'Enable','off')
set(handles.radiobutton73,'Enable','off')
set(handles.radiobutton74,'Enable','off')
set(handles.radiobutton75,'Enable','off')
set(handles.radiobutton76,'Enable','off')
set(handles.radiobutton77,'Enable','off')
set(handles.edit4,'Enable','off')
set(handles.text5,'Enable','off')


% --- Executes on button press in radiobutton46.
function radiobutton46_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton46

set(handles.radiobutton45,'Value',0)
set(handles.radiobutton46,'Value',1)
set(handles.radiobutton47,'Enable','on')
set(handles.radiobutton48,'Enable','on')
set(handles.radiobutton49,'Enable','on')
set(handles.radiobutton50,'Enable','on')
set(handles.radiobutton51,'Enable','on')
set(handles.radiobutton52,'Enable','on')
set(handles.radiobutton53,'Enable','on')
set(handles.radiobutton54,'Enable','on')

set(handles.radiobutton56,'Enable','on')
set(handles.radiobutton57,'Enable','on')
set(handles.radiobutton58,'Enable','on')
set(handles.radiobutton59,'Enable','on')
set(handles.radiobutton60,'Enable','on')
set(handles.radiobutton61,'Enable','on')
set(handles.radiobutton62,'Enable','on')
set(handles.radiobutton63,'Enable','on')
set(handles.radiobutton64,'Enable','on')

set(handles.radiobutton65,'Enable','on')
set(handles.radiobutton66,'Enable','on')
set(handles.radiobutton67,'Enable','on')
set(handles.radiobutton68,'Enable','on')
set(handles.radiobutton69,'Enable','on')
set(handles.radiobutton70,'Enable','on')
set(handles.radiobutton71,'Enable','on')
set(handles.radiobutton72,'Enable','on')
set(handles.radiobutton73,'Enable','on')
set(handles.radiobutton74,'Enable','on')
set(handles.radiobutton75,'Enable','on')
set(handles.radiobutton76,'Enable','on')
set(handles.radiobutton77,'Enable','on')
set(handles.edit4,'Enable','on')
set(handles.text5,'Enable','on')


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


% --- Executes when selected object is changed in uipanel11.
function uipanel11_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel11
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

if (get(handles.radiobutton73,'Value') == 1) || (get(handles.radiobutton66,'Value') == 1) || (get(handles.radiobutton67,'Value') == 1) || (get(handles.radiobutton68,'Value') == 1)
    
    set(handles.radiobutton56,'Enable','off')
    set(handles.radiobutton57,'Enable','off')
    set(handles.radiobutton58,'Enable','off')
    set(handles.radiobutton59,'Enable','off')
    set(handles.radiobutton60,'Enable','off')
    set(handles.radiobutton61,'Enable','off')
    set(handles.radiobutton62,'Enable','off')
    set(handles.radiobutton63,'Enable','off')
    set(handles.radiobutton64,'Enable','off')
    
else
    
    set(handles.radiobutton56,'Enable','on')
    set(handles.radiobutton57,'Enable','on')
    set(handles.radiobutton58,'Enable','on')
    set(handles.radiobutton59,'Enable','on')
    set(handles.radiobutton60,'Enable','on')
    set(handles.radiobutton61,'Enable','on')
    set(handles.radiobutton62,'Enable','on')
    set(handles.radiobutton63,'Enable','on')
    set(handles.radiobutton64,'Enable','on')
    
end
