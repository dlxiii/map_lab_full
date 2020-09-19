function varargout = select_political(varargin)
% SELECT_POLITICAL MATLAB code for select_political.fig
%      SELECT_POLITICAL, by itself, creates a new SELECT_POLITICAL or raises the existing
%      singleton*.
%
%      H = SELECT_POLITICAL returns the handle to a new SELECT_POLITICAL or the handle to
%      the existing singleton*.
%
%      SELECT_POLITICAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_POLITICAL.M with the given input arguments.
%
%      SELECT_POLITICAL('Property','Value',...) creates a new SELECT_POLITICAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_political_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_political_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_political

% Last Modified by GUIDE v2.5 17-Aug-2016 09:39:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_political_OpeningFcn, ...
    'gui_OutputFcn',  @select_political_OutputFcn, ...
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


% --- Executes just before select_political is made visible.
function select_political_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_political (see VARARGIN)

% Choose default command line output for select_political
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_political wait for user response (see UIRESUME)
% uiwait(handles.select_political);


% --- Outputs from this function are returned to the command line.
function varargout = select_political_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2

if get(handles.checkbox2,'Value') == 0
    
    set(handles.radiobutton13,'Enable','off')
    set(handles.radiobutton14,'Enable','off')
    set(handles.radiobutton15,'Enable','off')
    set(handles.radiobutton16,'Enable','off')
    set(handles.radiobutton17,'Enable','off')
    set(handles.radiobutton18,'Enable','off')
    set(handles.radiobutton19,'Enable','off')
    set(handles.radiobutton20,'Enable','off')
    set(handles.radiobutton21,'Enable','off')
    set(handles.radiobutton22,'Enable','off')
    set(handles.radiobutton23,'Enable','off')
    set(handles.radiobutton24,'Enable','off')
    set(handles.edit2,'Enable','off')
    
else
    
    set(handles.radiobutton13,'Enable','on')
    set(handles.radiobutton14,'Enable','on')
    set(handles.radiobutton15,'Enable','on')
    set(handles.radiobutton16,'Enable','on')
    set(handles.radiobutton17,'Enable','on')
    set(handles.radiobutton18,'Enable','on')
    set(handles.radiobutton19,'Enable','on')
    set(handles.radiobutton20,'Enable','on')
    set(handles.radiobutton21,'Enable','on')
    set(handles.radiobutton22,'Enable','on')
    set(handles.radiobutton23,'Enable','on')
    set(handles.radiobutton24,'Enable','on')
    set(handles.edit2,'Enable','on')
    
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

if get(handles.checkbox1,'Value') == 0
    
    set(handles.radiobutton1,'Enable','off')
    set(handles.radiobutton2,'Enable','off')
    set(handles.radiobutton3,'Enable','off')
    set(handles.radiobutton4,'Enable','off')
    set(handles.radiobutton5,'Enable','off')
    set(handles.radiobutton6,'Enable','off')
    set(handles.radiobutton7,'Enable','off')
    set(handles.radiobutton8,'Enable','off')
    set(handles.radiobutton9,'Enable','off')
    set(handles.radiobutton10,'Enable','off')
    set(handles.radiobutton11,'Enable','off')
    set(handles.radiobutton12,'Enable','off')
    set(handles.edit1,'Enable','off')
    
else
    
    set(handles.radiobutton1,'Enable','on')
    set(handles.radiobutton2,'Enable','on')
    set(handles.radiobutton3,'Enable','on')
    set(handles.radiobutton4,'Enable','on')
    set(handles.radiobutton5,'Enable','on')
    set(handles.radiobutton6,'Enable','on')
    set(handles.radiobutton7,'Enable','on')
    set(handles.radiobutton8,'Enable','on')
    set(handles.radiobutton9,'Enable','on')
    set(handles.radiobutton10,'Enable','on')
    set(handles.radiobutton11,'Enable','on')
    set(handles.radiobutton12,'Enable','on')
    set(handles.edit1,'Enable','on')
    
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global country_include country_line_width country_line_style country_line_color eval_country valid_country
global states_include states_line_width states_line_style states_line_color eval_states valid_states

country_include                = get(handles.checkbox1,'Value');
states_include                 = get(handles.checkbox2,'Value');

%Check if Country boundaries are selected
if country_include == 1
    
    %Check for wrong boundaries parameteres
    if isnan(str2double(get(handles.edit1,'String'))) == 1
        
        errordlg('Wrong or empty country land boundaries parameters. Please select valid country land boundaries parameters!','Country Land Boundaries Parameters Error')
        return
        
    else
        
        %Get line style
        if get(handles.radiobutton1,'Value') == 1
            
            country_line_style = '''-''';
            
        elseif get(handles.radiobutton2,'Value') == 1
            
            country_line_style = '''--''';
            
        elseif get(handles.radiobutton3,'Value') == 1
            
            country_line_style = ''':''';
            
        elseif get(handles.radiobutton4,'Value') == 1
            
            country_line_style = '''-.''';
            
        end
        
        %Get line color
        if get(handles.radiobutton5,'Value') == 1
            
            country_line_color = '''r''';
            
        elseif get(handles.radiobutton6,'Value') == 1
            
            country_line_color = '''g''';
            
        elseif get(handles.radiobutton7,'Value') == 1
            
            country_line_color = '''b''';
            
        elseif get(handles.radiobutton8,'Value') == 1
            
            country_line_color = '''c''';
            
        elseif get(handles.radiobutton9,'Value') == 1
            
            country_line_color = '''m''';
            
        elseif get(handles.radiobutton10,'Value') == 1
            
            country_line_color = '''y''';
            
        elseif get(handles.radiobutton11,'Value') == 1
            
            country_line_color = '''k''';
            
        elseif get(handles.radiobutton12,'Value') == 1
            
            country_line_color = '[0.99 0.99 0.99]';
            
        end
        
        %Get line width
        country_line_width     = str2double(get(handles.edit1,'String'));
        
        %Create the command
        eval_country           = strcat('m_line','(','X_country,Y_country',...
            ',''Color'',',country_line_color,...
            ',''LineStyle'',',country_line_style,...
            ',''LineWidth'',',num2str(country_line_width),')');
        
        %Set boolean variables
        valid_country          = 1;
        
    end
    
end

%Check if States boundaries are selected
if states_include == 1
    
    %Check for wrong states parameteres
    if isnan(str2double(get(handles.edit2,'String'))) == 1
        
        errordlg('Wrong or empty states boundaries parameters. Please select valid states boundaries parameters!','States Boundaries Parameters Error')
        return
        
    else
        
        %Get line style
        if get(handles.radiobutton13,'Value') == 1
            
            states_line_style = '''-''';
            
        elseif get(handles.radiobutton14,'Value') == 1
            
            states_line_style = '''--''';
            
        elseif get(handles.radiobutton15,'Value') == 1
            
            states_line_style = ''':''';
            
        elseif get(handles.radiobutton16,'Value') == 1
            
            states_line_style = '''-.''';
            
        end
        
        %Get line color
        if get(handles.radiobutton17,'Value') == 1
            
            states_line_color = '''r''';
            
        elseif get(handles.radiobutton18,'Value') == 1
            
            states_line_color = '''g''';
            
        elseif get(handles.radiobutton19,'Value') == 1
            
            states_line_color = '''b''';
            
        elseif get(handles.radiobutton20,'Value') == 1
            
            states_line_color = '''c''';
            
        elseif get(handles.radiobutton21,'Value') == 1
            
            states_line_color = '''m''';
            
        elseif get(handles.radiobutton22,'Value') == 1
            
            states_line_color = '''y''';
            
        elseif get(handles.radiobutton23,'Value') == 1
            
            states_line_color = '''k''';
            
        elseif get(handles.radiobutton24,'Value') == 1
            
            states_line_color = '[0.99 0.99 0.99]';
            
        end
        
        %Get line width
        states_line_width     = str2double(get(handles.edit2,'String'));
        
        %Create the command
        eval_states           = strcat('m_line','(','X_states,Y_states',',',...
            '''Color''',',',states_line_color,',',...
            '''LineStyle''',',',states_line_style,',',...
            '''LineWidth''',',',num2str(states_line_width),')');
        
        %Set boolean variables
        valid_states          = 1;
        
    end
    
end

%Close Political boundaries GUI
close select_political
