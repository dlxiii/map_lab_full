function varargout = select_distribution(varargin)
% SELECT_DISTRIBUTION M-file for select_distribution.fig
%      SELECT_DISTRIBUTION, by itself, creates a new SELECT_DISTRIBUTION or raises the existing
%      singleton*.
%
%      H = SELECT_DISTRIBUTION returns the handle to a new SELECT_DISTRIBUTION or the handle to
%      the existing singleton*.
%
%      SELECT_DISTRIBUTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_DISTRIBUTION.M with the given input arguments.
%
%      SELECT_DISTRIBUTION('Property','Value',...) creates a new SELECT_DISTRIBUTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_distribution_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_distribution_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_distribution

% Last Modified by GUIDE v2.5 08-Apr-2014 13:17:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_distribution_OpeningFcn, ...
    'gui_OutputFcn',  @select_distribution_OutputFcn, ...
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


% --- Executes just before select_distribution is made visible.
function select_distribution_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_distribution (see VARARGIN)

% Choose default command line output for select_distribution
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_distribution wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = select_distribution_OutputFcn(hObject, eventdata, handles)
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
global num eval_m_proj eval_m_coast eval_m_grid eval_plot_function2 eval_colormap phi_data lamda_data field1 field2 field3 field_interp i X Y
global plot_function2 point_edgecolor point_facecolor point_markertype point_markersize is_figure valid_captions figure_window save_figure eval_save
global eval_title eval_x_axis eval_y_axis eval_colorbar1 eval_colorbar2 country_include valid_country states_include valid_states eval_country eval_states

%Add all directories
addpath(genpath(cd))
addpath(genpath('./m_map'))

%Check for wrong input parameters
if isnan(str2double(get(handles.edit1,'String'))) == 1
    
    errordlg('Wrong or empty marker size parameters. Please select a valid marker size!')
    return
    
end

if (get(handles.radiobutton90,'Value') == 1) && (strcmp(get(handles.radiobutton90,'Enable'),'off') == 1) && (strcmp(get(handles.radiobutton20,'Enable'),'on') == 1)
    
    errordlg('Please select a different Facecolor','Facecolor Error')
    return
    
else
    
    %Get the marker size
    point_markersize = str2double(get(handles.edit1,'String'));
    
    %Select the data to plot
    if get(handles.radiobutton1,'Value') == 1
        
        plot_function2 = 'm_line';
        field_interp   = field1;
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        plot_function2 = 'scatter';
        
        if num(1,2) == 3
            
            field_interp = field1;
            
        elseif num(1,2) == 4
            
            opt = menu('Which collumn would you like to use?','Collumn 3','Collumn 4');
            
            if opt == 1
                
                field_interp = field1;
                
            elseif opt == 2
                
                field_interp = field2;
                
            end
            
        elseif num(1,2) == 5
            
            opt = menu('Which collumn would you like to use?','Collumn 3','Collumn 4','Collumn 5');
            
            if opt == 1
                
                field_interp = field1;
                
            elseif opt == 2
                
                field_interp = field2;
                
            elseif opt == 3
                
                field_interp = field3;
                
            end
            
        end
        
    end
    
    %Get the edge color
    if get(handles.radiobutton4,'Value') == 1
        
        point_edgecolor = '''r''';
        
    elseif get(handles.radiobutton5,'Value') == 1
        
        point_edgecolor = '''g''';
        
    elseif get(handles.radiobutton6,'Value') == 1
        
        point_edgecolor = '''b''';
        
    elseif get(handles.radiobutton7,'Value') == 1
        
        point_edgecolor = '''c''';
        
    elseif get(handles.radiobutton8,'Value') == 1
        
        point_edgecolor = '''m''';
        
    elseif get(handles.radiobutton9,'Value') == 1
        
        point_edgecolor = '''y''';
        
    elseif get(handles.radiobutton10,'Value') == 1
        
        point_edgecolor = '''k''';
        
    elseif get(handles.radiobutton11,'Value') == 1
        
        point_edgecolor = '[0.99 0.99 0.99]';
        
    end
    
    %Get the face color
    if get(handles.radiobutton12,'Value') == 1
        
        point_facecolor = '''none''';
        
    elseif get(handles.radiobutton13,'Value') == 1
        
        point_facecolor = '''r''';
        
    elseif get(handles.radiobutton14,'Value') == 1
        
        point_facecolor = '''g''';
        
    elseif get(handles.radiobutton15,'Value') == 1
        
        point_facecolor = '''b''';
        
    elseif get(handles.radiobutton16,'Value') == 1
        
        point_facecolor = '''c''';
        
    elseif get(handles.radiobutton17,'Value') == 1
        
        point_facecolor = '''m''';
        
    elseif get(handles.radiobutton18,'Value') == 1
        
        point_facecolor = '''y''';
        
    elseif get(handles.radiobutton19,'Value') == 1
        
        point_facecolor = '''k''';
        
    elseif get(handles.radiobutton20,'Value') == 1
        
        point_facecolor = '''w''';
        
    end
    
    %Get the markertype
    if get(handles.radiobutton21,'Value') == 1
        
        point_markertype = '''+''';
        
    elseif get(handles.radiobutton22,'Value') == 1
        
        point_markertype = '''o''';
        
    elseif get(handles.radiobutton23,'Value') == 1
        
        point_markertype = '''*''';
        
    elseif get(handles.radiobutton24,'Value') == 1
        
        point_markertype = '''.''';
        
    elseif get(handles.radiobutton25,'Value') == 1
        
        point_markertype = '''x''';
        
    elseif get(handles.radiobutton26,'Value') == 1
        
        point_markertype = '''s''';
        
    elseif get(handles.radiobutton27,'Value') == 1
        
        point_markertype = '''d''';
        
    elseif get(handles.radiobutton28,'Value') == 1
        
        point_markertype = '''^''';
        
    elseif get(handles.radiobutton29,'Value') == 1
        
        point_markertype = '''v''';
        
    elseif get(handles.radiobutton30,'Value') == 1
        
        point_markertype = '''>''';
        
    elseif get(handles.radiobutton31,'Value') == 1
        
        point_markertype = '''<''';
        
    elseif get(handles.radiobutton32,'Value') == 1
        
        point_markertype = '''p''';
        
    elseif get(handles.radiobutton33,'Value') == 1
        
        point_markertype = '''h''';
        
    end
    
    %Create the command
    if get(handles.radiobutton1,'Value') == 1
        
        eval_plot_function2 = strcat(plot_function2,'(','lamda_data(i,1),phi_data(i,1)',',','''marker''',',',point_markertype,',','''markersize''',',',num2str(point_markersize),',','''markerfacecolor''',',',point_facecolor,',','''color''',',',point_edgecolor,')');
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        if (get(handles.radiobutton90,'Value') == 1) && (strcmp(get(handles.radiobutton90,'Enable'),'on') == 1)
            
            eval_plot_function2 = strcat(plot_function2,'(','X,Y',',',num2str(point_markersize),',','field_interp',',','''filled''',')');
            
        else
            
            eval_plot_function2 = strcat(plot_function2,'(','X,Y',',',num2str(point_markersize),',','field_interp',',','''marker''',',',point_markertype,',','''markerfacecolor''',',',point_facecolor,')');
            
        end
        
    end
    
    %Evaluate the figure size
    if is_figure == 1
        
        if strcmp(figure_window,'Default Size') == 1
            
            ff = figure;
            
        elseif strcmp(figure_window,'Maximized') == 1
            
            ff = figure;
            set(gcf, 'Position', get(0,'Screensize'),'PaperPositionMode','auto')
            
        end
        
    else
        
        ff = figure;
        set(gcf, 'Position', get(0,'Screensize'),'PaperPositionMode','auto')
        
    end
    
    %Evaluate the projection
    eval(eval_m_proj)
    
    %Evaluate the coastline
    eval(eval_m_coast)
    
    hold on
    
    %Evaluate the country boundaries
    if country_include == 1 & valid_country == 1
        
        A           = shaperead('ne_10m_admin_0_boundary_lines_land');
        X_country   = extractfield(A,'X');
        Y_country   = extractfield(A,'Y');
        
        eval(eval_country)
        
    end
    
    %Evaluate the states boundaries
    if states_include == 1 & valid_states == 1
        
        B           = shaperead('ne_10m_admin_1_states_provinces_lines');
        X_states    = extractfield(B,'X');
        Y_states    = extractfield(B,'Y');
        
        eval(eval_states)
        
    end
    
    if get(handles.radiobutton1,'Value') == 1
        
        for i = 1:length(phi_data)
            
            eval(eval_plot_function2)
            
        end
        
    elseif get(handles.radiobutton2,'Value') == 1
        
        X     = zeros(size(phi_data));
        Y     = zeros(size(phi_data));
        [X Y] = m_ll2xy(lamda_data,phi_data);
        eval(eval_plot_function2)
        
    end
    
    %Evaluate the grid
    eval(eval_m_grid)
    
    set(gcf, 'Position', get(0,'Screensize'),'PaperPositionMode','auto')
    
    %Evaluate the colormap
    if get(handles.radiobutton2,'Value') == 1
        
        h = colorbar;
        
        if valid_captions == 1
            
            eval(eval_colorbar1)
            eval(eval_colorbar2)
            
        end
        
        if isempty(eval_colormap) == 1
            
            colormap jet
            
        else
            
            eval(eval_colormap)
            
        end
        
        caxis([min(field_interp) max(field_interp)])
        
    end
    
    %Evaluate the captions
    if valid_captions == 1
        
        eval(eval_title)
        eval(eval_x_axis)
        eval(eval_y_axis)
        
    end
    
    hold off
    
    %Evaluate the figure save
    if strcmp(save_figure,'Yes') == 1
        
        eval(eval_save)
        
    end
    
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


% --- Executes on button press in radiobutton39.
function radiobutton21_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton39

set(handles.radiobutton21,'Value',1);
set(handles.radiobutton12,'Enable','off');
set(handles.radiobutton13,'Enable','off');
set(handles.radiobutton14,'Enable','off');
set(handles.radiobutton15,'Enable','off');
set(handles.radiobutton16,'Enable','off');
set(handles.radiobutton17,'Enable','off');
set(handles.radiobutton18,'Enable','off');
set(handles.radiobutton19,'Enable','off');
set(handles.radiobutton20,'Enable','off');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton22.
function radiobutton22_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton22

set(handles.radiobutton22,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','on');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton23.
function radiobutton23_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton23

set(handles.radiobutton23,'Value',1);
set(handles.radiobutton12,'Enable','off');
set(handles.radiobutton13,'Enable','off');
set(handles.radiobutton14,'Enable','off');
set(handles.radiobutton15,'Enable','off');
set(handles.radiobutton16,'Enable','off');
set(handles.radiobutton17,'Enable','off');
set(handles.radiobutton18,'Enable','off');
set(handles.radiobutton19,'Enable','off');
set(handles.radiobutton20,'Enable','off');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton24.
function radiobutton24_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton24

set(handles.radiobutton24,'Value',1);
set(handles.radiobutton12,'Enable','off');
set(handles.radiobutton13,'Enable','off');
set(handles.radiobutton14,'Enable','off');
set(handles.radiobutton15,'Enable','off');
set(handles.radiobutton16,'Enable','off');
set(handles.radiobutton17,'Enable','off');
set(handles.radiobutton18,'Enable','off');
set(handles.radiobutton19,'Enable','off');
set(handles.radiobutton20,'Enable','off');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton25.
function radiobutton25_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton25

set(handles.radiobutton25,'Value',1);
set(handles.radiobutton12,'Enable','off');
set(handles.radiobutton13,'Enable','off');
set(handles.radiobutton14,'Enable','off');
set(handles.radiobutton15,'Enable','off');
set(handles.radiobutton16,'Enable','off');
set(handles.radiobutton17,'Enable','off');
set(handles.radiobutton18,'Enable','off');
set(handles.radiobutton19,'Enable','off');
set(handles.radiobutton20,'Enable','off');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton26.
function radiobutton26_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton26

set(handles.radiobutton26,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton27.
function radiobutton27_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton27

set(handles.radiobutton27,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton28.
function radiobutton28_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton28

set(handles.radiobutton28,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton29.
function radiobutton29_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton29

set(handles.radiobutton29,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton30.
function radiobutton30_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton30

set(handles.radiobutton30,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton31.
function radiobutton31_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton31

set(handles.radiobutton31,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton32,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton32.
function radiobutton32_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton32

set(handles.radiobutton32,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton33,'Value',0);


% --- Executes on button press in radiobutton33.
function radiobutton33_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton33

set(handles.radiobutton33,'Value',1);
set(handles.radiobutton12,'Enable','on');
set(handles.radiobutton13,'Enable','on');
set(handles.radiobutton14,'Enable','on');
set(handles.radiobutton15,'Enable','on');
set(handles.radiobutton16,'Enable','on');
set(handles.radiobutton17,'Enable','on');
set(handles.radiobutton18,'Enable','on');
set(handles.radiobutton19,'Enable','on');
set(handles.radiobutton20,'Enable','on');
set(handles.radiobutton90,'Enable','off');
set(handles.radiobutton21,'Value',0);
set(handles.radiobutton22,'Value',0);
set(handles.radiobutton23,'Value',0);
set(handles.radiobutton24,'Value',0);
set(handles.radiobutton25,'Value',0);
set(handles.radiobutton26,'Value',0);
set(handles.radiobutton27,'Value',0);
set(handles.radiobutton28,'Value',0);
set(handles.radiobutton29,'Value',0);
set(handles.radiobutton30,'Value',0);
set(handles.radiobutton31,'Value',0);
set(handles.radiobutton32,'Value',0);


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

set(handles.radiobutton1,'Value',1)
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton4,'Enable','on');
set(handles.radiobutton5,'Enable','on');
set(handles.radiobutton6,'Enable','on');
set(handles.radiobutton7,'Enable','on');
set(handles.radiobutton8,'Enable','on');
set(handles.radiobutton9,'Enable','on');
set(handles.radiobutton10,'Enable','on');
set(handles.radiobutton11,'Enable','on');

if get(handles.radiobutton22,'Value') == 0
    
    set(handles.radiobutton90,'Enable','off');
    
end

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

set(handles.radiobutton2,'Value',1)
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton4,'Enable','off');
set(handles.radiobutton5,'Enable','off');
set(handles.radiobutton6,'Enable','off');
set(handles.radiobutton7,'Enable','off');
set(handles.radiobutton8,'Enable','off');
set(handles.radiobutton9,'Enable','off');
set(handles.radiobutton10,'Enable','off');
set(handles.radiobutton11,'Enable','off');

if get(handles.radiobutton22,'Value') == 1
    
    set(handles.radiobutton90,'Enable','on');
    
end
