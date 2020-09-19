function varargout = select_coastline(varargin)
% SELECT_COASTLINE M-file for select_coastline.fig
%      SELECT_COASTLINE, by itself, creates a new SELECT_COASTLINE or raises the existing
%      singleton*.
%
%      H = SELECT_COASTLINE returns the handle to a new SELECT_COASTLINE or the handle to
%      the existing singleton*.
%
%      SELECT_COASTLINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_COASTLINE.M with the given input arguments.
%
%      SELECT_COASTLINE('Property','Value',...) creates a new SELECT_COASTLINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_coastline_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_coastline_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_coastline

% Last Modified by GUIDE v2.5 11-Aug-2016 08:32:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_coastline_OpeningFcn, ...
    'gui_OutputFcn',  @select_coastline_OutputFcn, ...
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


% --- Executes just before select_coastline is made visible.
function select_coastline_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_coastline (see VARARGIN)

% Choose default command line output for select_coastline
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_coastline wait for user response (see UIRESUME)
% uiwait(handles.select_coastline);


% --- Outputs from this function are returned to the command line.
function varargout = select_coastline_OutputFcn(hObject, eventdata, handles)
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
global coastline_res coastline_color coastline_width coastline_patch eval_m_coast valid_coastline

%Check if any coastline or patch color has been selected
if (get(handles.radiobutton23,'Value') == 1) && (get(handles.radiobutton32,'Value') == 1)
    
    errordlg('Select one color for Coastline or Patch','Coastline Error')
    return
    
else
    
    %Check for wrong coastline parameters
    if isnan(str2double(get(handles.edit1,'String'))) == 1
        
        errordlg('Wrong or empty coastline width. Please select a valid width!','Coastline Width Error')
        return
        
    else
        
        %Get resolution
        if get(handles.radiobutton14,'Value') == 1
            
            coastline_res    = 'm_coast';
            
        elseif get(handles.radiobutton1,'Value') == 1
            
            coastline_res    = 'm_gshhs_c';
            
        elseif get(handles.radiobutton2,'Value') == 1
            
            coastline_res    = 'm_gshhs_l';
            
        elseif get(handles.radiobutton3,'Value') == 1
            
            coastline_res    = 'm_gshhs_i';
            
        elseif get(handles.radiobutton4,'Value') == 1
            
            coastline_res    = 'm_gshhs_h';
            
        elseif get(handles.radiobutton5,'Value') == 1
            
            coastline_res    = 'm_gshhs_f';
            
        end
        
        %Get coastline color
        if get(handles.radiobutton23,'Value') == 1
            
            coastline_color  = '''none''';
            
        elseif get(handles.radiobutton6,'Value') == 1
            
            coastline_color  = '''r''';
            
        elseif get(handles.radiobutton7,'Value') == 1
            
            coastline_color  = '''g''';
            
        elseif get(handles.radiobutton8,'Value') == 1
            
            coastline_color  = '''b''';
            
        elseif get(handles.radiobutton9,'Value') == 1
            
            coastline_color  = '''c''';
            
        elseif get(handles.radiobutton10,'Value') == 1
            
            coastline_color  = '''m''';
            
        elseif get(handles.radiobutton11,'Value') == 1
            
            coastline_color  = '''y''';
            
        elseif get(handles.radiobutton12,'Value') == 1
            
            coastline_color  = '''k''';
            
        elseif get(handles.radiobutton13,'Value') == 1
            
            coastline_color  = '[0.99 0.99 0.99]';
            
        end
        
        %Get patch color
        if get(handles.radiobutton32,'Value') == 1
            
            coastline_patch  = '''none''';
            
        elseif get(handles.radiobutton24,'Value') == 1
            
            coastline_patch  = '''r''';
            
        elseif get(handles.radiobutton25,'Value') == 1
            
            coastline_patch  = '''g''';
            
        elseif get(handles.radiobutton26,'Value') == 1
            
            coastline_patch  = '''b''';
            
        elseif get(handles.radiobutton27,'Value') == 1
            
            coastline_patch  = '''c''';
            
        elseif get(handles.radiobutton28,'Value') == 1
            
            coastline_patch  = '''m''';
            
        elseif get(handles.radiobutton29,'Value') == 1
            
            coastline_patch  = '''y''';
            
        elseif get(handles.radiobutton30,'Value') == 1
            
            coastline_patch  = '''k''';
            
        elseif get(handles.radiobutton31,'Value') == 1
            
            coastline_patch  = '[0.99 0.99 0.99]';
            
        end
        
        %Get coastline width
        coastline_width      = str2double(get(handles.edit1,'String'));
        
        %Create the command
        if strcmp(coastline_patch,'''none''') == 0
            
            if strcmp(coastline_color,'''none''') == 0
                
                eval_m_coast = strcat(coastline_res,'(','''patch'',',coastline_patch,',''edgecolor'',',coastline_color,',''Linewidth'',',num2str(coastline_width),')');
                
            else
                
                eval_m_coast = strcat(coastline_res,'(','''patch'',',coastline_patch,',''edgecolor'',',coastline_color,')');
                
            end
            
        else
            
            eval_m_coast     = strcat(coastline_res,'(','''color'',',coastline_color,',''Linewidth'',',num2str(coastline_width),')');
            
        end
        
        %Set boolean variables
        valid_coastline      = 1;
        
        %Close Coastline parameters GUI
        close select_coastline
        
    end
    
end
