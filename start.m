function varargout = start(varargin)
% START M-file for start.fig
%      START, by itself, creates a new START or raises the existing
%      singleton*.
%
%      H = START returns the handle to a new START or the handle to
%      the existing singleton*.
%
%      START('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in START.M with the given input arguments.
%
%      START('Property','Value',...) creates a new START or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before start_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to start_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help start

% Last Modified by GUIDE v2.5 23-Aug-2016 11:06:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @start_OpeningFcn, ...
    'gui_OutputFcn',  @start_OutputFcn, ...
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


% --- Executes just before start is made visible.
function start_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to start (see VARARGIN)

% Choose default command line output for start
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes start wait for user response (see UIRESUME)
% uiwait(handles.start);


% --- Outputs from this function are returned to the command line.
function varargout = start_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

clearvars -global

MAP_LAB_dir                     = which('start.m');
MAP_LAB_dir                     = MAP_LAB_dir(1:end-8);

addpath(genpath(MAP_LAB_dir))

%Initialize variables
is_m_map                         = 0;
is_coastline                     = 0;
is_political                     = 0;

%Get all files from the current directory
file                             = dir(MAP_LAB_dir);
file_names                       = extractfield(file,'name');
file_names                       = file_names(:);

%Check if M_Map is installed
for i = 1:size(file_names,1)
    
    if strcmp(file_names{i,1},'m_map') == 1
        
        m_map_file               = dir([MAP_LAB_dir '\m_map']);
        m_map_file_names         = extractfield(m_map_file,'name');
        m_map_file_names         = m_map_file_names(:);
        
        if size(m_map_file_names,1) > 3
            
            is_m_map             = 1;
            
        end
        
    end
    
end

%If M_Map is not installed, ask to download m_map
if is_m_map == 0
    
    m_map_download               = questdlg('There is no M_Map installed in MAP-LAB directory. Do you want to download M_Map?','M_Map Warning','Yes','No','Yes');
    
    %Download M_Map
    if strcmp(m_map_download,'Yes') == 1
        
        w                        = waitbar(0,'Initializing Process');
        
        %Download zip files
        urlwrite('http://dimitriospiretzidis.com/m_map1.4.zip','m_map1.4.zip'); waitbar(1/3,w,'Download M\_Map')
        
        %Unzip zip files
        unzip('m_map1.4.zip',MAP_LAB_dir)                                     ; waitbar(2/3,w,'Unzip M\_Map')
        
        %Delete zip files
        delete('m_map1.4.zip')                                                ; waitbar(3/3,w,'Delete M\_Map')
        
        close(w)
        
    end
    
end

addpath(genpath(MAP_LAB_dir))

%Get all files from the current directory
file                             = dir(MAP_LAB_dir);
file_names                       = extractfield(file,'name');
file_names                       = file_names(:);

%Check if GSHHS coastlines are installed
for i = 1:size(file_names,1)
    
    if strcmp(file_names{i,1},'m_map') == 1
        
        is_m_map                 = 1 ;
        
        coastline_file           = dir([MAP_LAB_dir '\m_map\private\*.b']);
        
        if min(size(coastline_file)) ~= 0
            
            coastline_file_names = extractfield(coastline_file,'name');
            coastline_file_names = coastline_file_names(:);
            
            if size(coastline_file_names,1) > 4
                
                is_coastline     = 1;
                
            end
            
        end
        
    end
    
end

%If GSHHS coastlines are not installed, ask to download GSHHS coastlines
if is_m_map == 1 && is_coastline == 0
    
    coastline_download           = questdlg('There are no GSHHS coastlines installed in MAP-LAB directory. Do you want to download GSHHS coastlines?','GSHHS coastlines Warning','Yes','No','Yes');
    
    %Download GSHHS coastlines
    if strcmp(coastline_download,'Yes') == 1
        
        w                        = waitbar(0,'Initializing Process');
        
        %Download gz files
        urlwrite('https://www.ngdc.noaa.gov/mgg/shorelines/data/gshhg/oldversions/version1.2/gshhs_c.b.gz','gshhs_c.b.gz'); waitbar(1/20,w,'Download coastlines (1/5)')
        urlwrite('https://www.ngdc.noaa.gov/mgg/shorelines/data/gshhg/oldversions/version1.2/gshhs_l.b.gz','gshhs_l.b.gz'); waitbar(2/20,w,'Download coastlines (2/5)')
        urlwrite('https://www.ngdc.noaa.gov/mgg/shorelines/data/gshhg/oldversions/version1.2/gshhs_i.b.gz','gshhs_i.b.gz'); waitbar(3/20,w,'Download coastlines (3/5)')
        urlwrite('https://www.ngdc.noaa.gov/mgg/shorelines/data/gshhg/oldversions/version1.2/gshhs_h.b.gz','gshhs_h.b.gz'); waitbar(4/20,w,'Download coastlines (4/5). Please wait...')
        urlwrite('https://www.ngdc.noaa.gov/mgg/shorelines/data/gshhg/oldversions/version1.2/gshhs_f.b.gz','gshhs_f.b.gz'); waitbar(5/20,w,'Download coastlines (5/5)')
        
        %Unzip gz files
        gunzip('gshhs_c.b.gz'); waitbar(6/20,w,'Unzip coastlines (1/5)')
        gunzip('gshhs_l.b.gz'); waitbar(7/20,w,'Unzip coastlines (2/5)')
        gunzip('gshhs_i.b.gz'); waitbar(8/20,w,'Unzip coastlines (3/5)')
        gunzip('gshhs_h.b.gz'); waitbar(9/20,w,'Unzip coastlines (4/5)')
        gunzip('gshhs_f.b.gz'); waitbar(10/20,w,'Unzip coastlines (5/5)')
        
        %Move unzipped files to GSHHS coastlines folder
        movefile([cd '\gshhs_c.b'],[MAP_LAB_dir '\m_map\private\gshhs_c.b']); waitbar(11/20,w,'Move coastlines (1/5)')
        movefile([cd '\gshhs_l.b'],[MAP_LAB_dir '\m_map\private\gshhs_l.b']); waitbar(12/20,w,'Move coastlines (2/5)')
        movefile([cd '\gshhs_i.b'],[MAP_LAB_dir '\m_map\private\gshhs_i.b']); waitbar(13/20,w,'Move coastlines (3/5)')
        movefile([cd '\gshhs_h.b'],[MAP_LAB_dir '\m_map\private\gshhs_h.b']); waitbar(14/20,w,'Move coastlines (4/5)')
        movefile([cd '\gshhs_f.b'],[MAP_LAB_dir '\m_map\private\gshhs_f.b']); waitbar(15/20,w,'Move coastlines (5/5)')
        
        %Delete gz files
        delete('gshhs_c.b.gz'); waitbar(16/20,w,'Delete coastlines (1/5)')
        delete('gshhs_l.b.gz'); waitbar(17/20,w,'Delete coastlines (2/5)')
        delete('gshhs_i.b.gz'); waitbar(18/20,w,'Delete coastlines (3/5)')
        delete('gshhs_h.b.gz'); waitbar(19/20,w,'Delete coastlines (4/5)')
        delete('gshhs_f.b.gz'); waitbar(20/20,w,'Delete coastlines (5/5)')
        
        close(w)
        
    end
    
end

addpath(genpath(MAP_LAB_dir))

%Check if political boundaries are installed
for i = 1:size(file_names,1)
    
    if strcmp(file_names{i,1},'Political boundaries') == 1
        
        political_file           = dir([MAP_LAB_dir '\Political boundaries']);
        political_file_names     = extractfield(political_file,'name');
        political_file_names     = political_file_names(:);
        
        if size(political_file_names,1) > 3
            
            is_political         = 1;
            
        end
        
    end
    
end

%If political boundaries are not installed, ask to download political boundaries
if is_political == 0
    
    political_download           = questdlg('There are no political boundaries installed in MAP-LAB directory. Do you want to download political boundaries?','Political boundaries Warning','Yes','No','Yes');
    
    %Download GSHHS coastlines
    if strcmp(political_download,'Yes') == 1
        
        w                        = waitbar(0,'Initializing Process');
        
        %Download zip files
        urlwrite('http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_boundary_lines_land.zip','ne_10m_admin_0_boundary_lines_land.zip'); waitbar(1/6,w,'Download political boundaries (1/2). Please wait...')
        urlwrite('http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_1_states_provinces_lines.zip','ne_10m_admin_1_states_provinces_lines.zip'); waitbar(2/6,w,'Download political boundaries (2/2)')
        
        %Unzip zip files
        unzip('ne_10m_admin_0_boundary_lines_land.zip',[MAP_LAB_dir '\Political boundaries\ne_10m_admin_0_boundary_lines_land'])      ; waitbar(3/6,w,'Unzip political boundaries (1/2)')
        unzip('ne_10m_admin_1_states_provinces_lines.zip',[MAP_LAB_dir '\Political boundaries\ne_10m_admin_1_states_provinces_lines']); waitbar(4/6,w,'Unzip political boundaries (2/2)')
        
        %Delete zip files
        delete('ne_10m_admin_0_boundary_lines_land.zip')   ; waitbar(5/6,w,'Delete political boundaries (1/2)')
        delete('ne_10m_admin_1_states_provinces_lines.zip'); waitbar(6/6,w,'Delete political boundaries (2/2)')
        
        close(w)
        
    end
    
end

addpath(genpath(MAP_LAB_dir))

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


% --------------------------------------------------------------------
function Menu_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_1_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global phi_data lamda_data field1 field2 field3 num valid_filename filename1
global is_workspace is_file

%Open File Selector GUI
[filename1, pathname1]                                   = uigetfile('*.*','File Selector');

%Check if file has been selected
if (filename1 ~= 0)
    
    datafile1                                            = fullfile(pathname1,filename1);
    data                                                 = importdata(datafile1);
    num                                                  = size(data);
    
    set(handles.edit1,'String',datafile1);
    
    %Check if selected file has 3, 4 or 5 columns
    if ismember(num(1,2),[3,4,5]) == 1
        
        %Get the latitude and longitude data
        phi_data                                         = data(:,1);
        lamda_data                                       = data(:,2);
        
        set(handles.text16,'String',min(phi_data));
        set(handles.text17,'String',max(phi_data));
        set(handles.text9,'String',min(lamda_data));
        set(handles.text10,'String',max(lamda_data));
        set(handles.text11,'String',num(1,1));
        
        if num(1,2) == 3
            
            %Get Data set 1
            field1                                       = data(:,3);
            field2                                       = [];
            field3                                       = [];
            
            set(handles.text26,'String',min(field1));
            set(handles.text31,'String',max(field1));
            set(handles.text37,'String',nanmean(field1));
            set(handles.text41,'String',nanstd(field1));
            
            set(handles.text27,'String','-');
            set(handles.text32,'String','-');
            set(handles.text38,'String','-');
            set(handles.text42,'String','-');
            
            set(handles.text34,'String','-');
            set(handles.text35,'String','-');
            set(handles.text39,'String','-');
            set(handles.text43,'String','-');
            
            set(handles.text24,'Enable','off');
            set(handles.text27,'Enable','off');
            set(handles.text32,'Enable','off');
            set(handles.text38,'Enable','off');
            set(handles.text42,'Enable','off');
            
            set(handles.text33,'Enable','off');
            set(handles.text34,'Enable','off');
            set(handles.text35,'Enable','off');
            set(handles.text39,'Enable','off');
            set(handles.text43,'Enable','off');
            
        elseif num(1,2) == 4
            
            %Get Data set 1 and 2
            field1                                       = data(:,3);
            field2                                       = data(:,4);
            field3                                       = [];
            
            set(handles.text26,'String',min(field1));
            set(handles.text31,'String',max(field1));
            set(handles.text37,'String',nanmean(field1));
            set(handles.text41,'String',nanstd(field1));
            
            set(handles.text27,'String',min(field2));
            set(handles.text32,'String',max(field2));
            set(handles.text38,'String',nanmean(field2));
            set(handles.text42,'String',nanstd(field2));
            
            set(handles.text34,'String','-');
            set(handles.text35,'String','-');
            set(handles.text39,'String','-');
            set(handles.text43,'String','-');
            
            set(handles.text24,'Enable','on');
            set(handles.text27,'Enable','on');
            set(handles.text32,'Enable','on');
            set(handles.text38,'Enable','on');
            set(handles.text42,'Enable','on');
            
            set(handles.text33,'Enable','off');
            set(handles.text34,'Enable','off');
            set(handles.text35,'Enable','off');
            set(handles.text39,'Enable','off');
            set(handles.text43,'Enable','off');
            
        elseif num(1,2) == 5
            
            %Get Data set 1, 2 and 3
            field1                                       = data(:,3);
            field2                                       = data(:,4);
            field3                                       = data(:,5);
            
            set(handles.text26,'String',min(field1));
            set(handles.text31,'String',max(field1));
            set(handles.text37,'String',nanmean(field1));
            set(handles.text41,'String',nanstd(field1));
            
            set(handles.text27,'String',min(field2));
            set(handles.text32,'String',max(field2));
            set(handles.text38,'String',nanmean(field2));
            set(handles.text42,'String',nanstd(field2));
            
            set(handles.text34,'String',min(field3));
            set(handles.text35,'String',max(field3));
            set(handles.text39,'String',nanmean(field3));
            set(handles.text43,'String',nanstd(field3));
            
            set(handles.text24,'Enable','on');
            set(handles.text27,'Enable','on');
            set(handles.text32,'Enable','on');
            set(handles.text38,'Enable','on');
            set(handles.text42,'Enable','on');
            
            set(handles.text33,'Enable','on');
            set(handles.text34,'Enable','on');
            set(handles.text35,'Enable','on');
            set(handles.text39,'Enable','on');
            set(handles.text43,'Enable','on');
            
        end
        
        %Set boolean variables
        valid_filename                                   = 1;
        is_workspace                                     = 0;
        is_file                                          = 1;
        
    else
        
        errordlg('Wrong data file dimensions. Please use a data file with 3, 4 or 5 collumns.','Data File Error');
        return
        
    end
    
end


% --------------------------------------------------------------------
function Menu_1_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global var_value_phi var_value_lamda var_value_field1 var_value_field2 var_value_field3
global is_workspace valid_filename

%Open Workspace GUI
select_workspace

if is_workspace == 1 & valid_filename == 1
    
    select_workspace_h   = findobj('Tag','select_workspace');
    select_workspace_gui = guidata(select_workspace_h);
    
    set(select_workspace_gui.popupmenu1,'Value',var_value_phi)
    set(select_workspace_gui.popupmenu2,'Value',var_value_lamda)
    set(select_workspace_gui.popupmenu3,'Value',var_value_field1)
    set(select_workspace_gui.popupmenu4,'Value',var_value_field2)
    set(select_workspace_gui.popupmenu5,'Value',var_value_field3)
    
    set(select_workspace_gui.popupmenu3,'Enable','on')
    set(select_workspace_gui.popupmenu4,'Enable','on')
    
    if var_value_field2 ~= 1
        
        set(select_workspace_gui.popupmenu5,'Enable','on')
        
    end
    
end

% --------------------------------------------------------------------
function Menu_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_2_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_2_1_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global proj_name center_long center_lat radius_value
global is_azimuthal

%Open Azimuthal Projection GUI
select_azimuthal

%Set the saved projection parameters into the GUI
if is_azimuthal == 1
    
    select_azimuthal_h   = findobj('Tag','select_azimuthal');
    select_azimuthal_gui = guidata(select_azimuthal_h);
    
    %Set the projection name
    if strcmp(proj_name,'''Stereographic''') == 1
        
        set(select_azimuthal_gui.radiobutton1,'Value',1)
        
    elseif strcmp(proj_name,'''Orthographic''') == 1
        
        set(select_azimuthal_gui.radiobutton2,'Value',1)
        
    elseif strcmp(proj_name,'''Azimuthal Equal-Area''') == 1
        
        set(select_azimuthal_gui.radiobutton3,'Value',1)
        
    elseif strcmp(proj_name,'''Azimuthal Equidistant''') == 1
        
        set(select_azimuthal_gui.radiobutton4,'Value',1)
        
    elseif strcmp(proj_name,'''Gnomonic''') == 1
        
        set(select_azimuthal_gui.radiobutton5,'Value',1)
        
    elseif strcmp(proj_name,'''Satellite''') == 1
        
        set(select_azimuthal_gui.radiobutton6,'Value',1)
        
    end
    
    %Set center longitude, latitude and radius
    if isempty(center_long) == 0
        
        set(select_azimuthal_gui.edit1,'String',center_long)
        
    end
    
    if isempty(center_lat) == 0
        
        set(select_azimuthal_gui.edit2,'String',center_lat)
        
    end
    
    if isempty(radius_value) == 0
        
        set(select_azimuthal_gui.edit3,'String',radius_value)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_1_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global proj_name long_min long_max lat_min lat_max
global is_cylindrical

%Open Cylindrical Projection GUI
select_cylindrical

%Set the saved projection parameters into the GUI
if is_cylindrical == 1
    
    select_cylindrical_h   = findobj('Tag','select_cylindrical');
    select_cylindrical_gui = guidata(select_cylindrical_h);
    
    %Set projection name
    if strcmp(proj_name,'''Mercator''') == 1
        
        set(select_cylindrical_gui.radiobutton1,'Value',1)
        
    elseif strcmp(proj_name,'''Miller Cylindrical''') == 1
        
        set(select_cylindrical_gui.radiobutton2,'Value',1)
        
    elseif strcmp(proj_name,'''Equidistant Cylindrical''') == 1
        
        set(select_cylindrical_gui.radiobutton3,'Value',1)
        
    elseif strcmp(proj_name,'''Oblique Mercator''') == 1
        
        set(select_cylindrical_gui.radiobutton4,'Value',1)
        
    elseif strcmp(proj_name,'''Transverse Mercator''') == 1
        
        set(select_cylindrical_gui.radiobutton5,'Value',1)
        
    elseif strcmp(proj_name,'''UTM''') == 1
        
        set(select_cylindrical_gui.radiobutton6,'Value',1)
        
    elseif strcmp(proj_name,'''Sinusoidal''') == 1
        
        set(select_cylindrical_gui.radiobutton7,'Value',1)
        
    elseif strcmp(proj_name,'''Gall-Peters''') == 1
        
        set(select_cylindrical_gui.radiobutton8,'Value',1)
        
    end
    
    %Set projection limits
    if isempty(long_min) == 0
        
        set(select_cylindrical_gui.edit1,'String',long_min)
        
    end
    
    if isempty(long_max) == 0
        
        set(select_cylindrical_gui.edit4,'String',long_max)
        
    end
    
    if isempty(lat_min) == 0
        
        set(select_cylindrical_gui.edit2,'String',lat_min)
        
    end
    
    if isempty(lat_max) == 0
        
        set(select_cylindrical_gui.edit5,'String',lat_max)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_1_3_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global proj_name long_min long_max lat_min lat_max eval_m_proj valid_projection
global is_conic

%Open Conic Projection GUI
select_conic

%Set the saved projection parameters into the GUI
if is_conic == 1
    
    select_conic_h   = findobj('Tag','select_conic');
    select_conic_gui = guidata(select_conic_h);
    
    %Set projection name
    if strcmp(proj_name,'''Albers''') == 1
        
        set(select_conic_gui.radiobutton1,'Value',1)
        
    elseif strcmp(proj_name,'''Lambert''') == 1
        
        set(select_conic_gui.radiobutton2,'Value',1)
        
    end
    
    %Set projection limits
    if isempty(long_min) == 0
        
        set(select_conic_gui.edit1,'String',long_min)
        
    end
    
    if isempty(long_max) == 0
        
        set(select_conic_gui.edit3,'String',long_max)
        
    end
    
    if isempty(lat_min) == 0
        
        set(select_conic_gui.edit2,'String',lat_min)
        
    end
    
    if isempty(lat_max) == 0
        
        set(select_conic_gui.edit4,'String',lat_max)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_1_4_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_1_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global proj_name long_min long_max lat_min lat_max
global is_miscellaneous

%Open Miscellaneous Projection GUI
select_miscellaneous

%Set the saved projection parameters into the GUI
if is_miscellaneous == 1
    
    select_miscellaneous_h   = findobj('Tag','select_miscellaneous');
    select_miscellaneous_gui = guidata(select_miscellaneous_h);
    
    %Set projection name
    if strcmp(proj_name,'''Hammer-Aitoff''') == 1
        
        set(select_miscellaneous_gui.radiobutton1,'Value',1)
        
    elseif strcmp(proj_name,'''Mollweide''') == 1
        
        set(select_miscellaneous_gui.radiobutton2,'Value',1)
        
    elseif strcmp(proj_name,'''Robinson''') == 1
        
        set(select_miscellaneous_gui.radiobutton3,'Value',1)
        
    end
    
    %Set projection limits
    if isempty(long_min) == 0
        
        set(select_miscellaneous_gui.edit1,'String',long_min)
        
    end
    
    if isempty(long_max) == 0
        
        set(select_miscellaneous_gui.edit3,'String',long_max)
        
    end
    
    if isempty(lat_min) == 0
        
        set(select_miscellaneous_gui.edit2,'String',lat_min)
        
    end
    
    if isempty(lat_max) == 0
        
        set(select_miscellaneous_gui.edit4,'String',lat_max)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global coastline_res coastline_color coastline_width coastline_patch valid_coastline

%Open Coastline Parameters GUI
select_coastline

%Set the saved coastline parameters into the GUI
if valid_coastline == 1
    
    select_coastline_h   = findobj('Tag','select_coastline');
    select_coastline_gui = guidata(select_coastline_h);
    
    %Set coastline resolution
    if strcmp(coastline_res,'m_coast') == 1
        
        set(select_coastline_gui.radiobutton14,'Value',1)
        
    elseif strcmp(coastline_res,'m_gshhs_c') == 1
        
        set(select_coastline_gui.radiobutton1,'Value',1)
        
    elseif strcmp(coastline_res,'m_gshhs_l') == 1
        
        set(select_coastline_gui.radiobutton2,'Value',1)
        
    elseif strcmp(coastline_res,'m_gshhs_i') == 1
        
        set(select_coastline_gui.radiobutton3,'Value',1)
        
    elseif strcmp(coastline_res,'m_gshhs_h') == 1
        
        set(select_coastline_gui.radiobutton4,'Value',1)
        
    elseif strcmp(coastline_res,'m_gshhs_f') == 1
        
        set(select_coastline_gui.radiobutton5,'Value',1)
        
    end
    
    %Set coastline color
    if strcmp(coastline_color,'''none''') == 1
        
        set(select_coastline_gui.radiobutton23,'Value',1)
        
    elseif strcmp(coastline_color,'''r''') == 1
        
        set(select_coastline_gui.radiobutton6,'Value',1)
        
    elseif strcmp(coastline_color,'''g''') == 1
        
        set(select_coastline_gui.radiobutton7,'Value',1)
        
    elseif strcmp(coastline_color,'''b''') == 1
        
        set(select_coastline_gui.radiobutton8,'Value',1)
        
    elseif strcmp(coastline_color,'''c''') == 1
        
        set(select_coastline_gui.radiobutton9,'Value',1)
        
    elseif strcmp(coastline_color,'''m''') == 1
        
        set(select_coastline_gui.radiobutton10,'Value',1)
        
    elseif strcmp(coastline_color,'''y''') == 1
        
        set(select_coastline_gui.radiobutton11,'Value',1)
        
    elseif strcmp(coastline_color,'''k''') == 1
        
        set(select_coastline_gui.radiobutton12,'Value',1)
        
    elseif strcmp(coastline_color,'[0.99 0.99 0.99]') == 1
        
        set(select_coastline_gui.radiobutton13,'Value',1)
        
    end
    
    %Set patch color
    if strcmp(coastline_patch,'''none''') == 1
        
        set(select_coastline_gui.radiobutton32,'Value',1)
        
    elseif strcmp(coastline_patch,'''r''') == 1
        
        set(select_coastline_gui.radiobutton24,'Value',1)
        
    elseif strcmp(coastline_patch,'''g''') == 1
        
        set(select_coastline_gui.radiobutton25,'Value',1)
        
    elseif strcmp(coastline_patch,'''b''') == 1
        
        set(select_coastline_gui.radiobutton26,'Value',1)
        
    elseif strcmp(coastline_patch,'''c''') == 1
        
        set(select_coastline_gui.radiobutton27,'Value',1)
        
    elseif strcmp(coastline_patch,'''m''') == 1
        
        set(select_coastline_gui.radiobutton28,'Value',1)
        
    elseif strcmp(coastline_patch,'''y''') == 1
        
        set(select_coastline_gui.radiobutton29,'Value',1)
        
    elseif strcmp(coastline_patch,'''k''') == 1
        
        set(select_coastline_gui.radiobutton30,'Value',1)
        
    elseif strcmp(coastline_patch,'[0.99 0.99 0.99]') == 1
        
        set(select_coastline_gui.radiobutton31,'Value',1)
        
    end
    
    %Set coastline width
    if isempty(coastline_width) == 0
        
        set(select_coastline_gui.edit1,'String',coastline_width)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_3_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global country_include country_line_width country_line_style country_line_color valid_country
global states_include states_line_width states_line_style states_line_color valid_states

%Open Political Boundaries Parameters GUI
select_political

%Set the saved political boundaries parameters into the GUI
if country_include == 1 & valid_country == 1
    
    select_political_h   = findobj('Tag','select_political');
    select_political_gui = guidata(select_political_h);
    
    set(select_political_gui.radiobutton1,'Enable','on')
    set(select_political_gui.radiobutton2,'Enable','on')
    set(select_political_gui.radiobutton3,'Enable','on')
    set(select_political_gui.radiobutton4,'Enable','on')
    set(select_political_gui.radiobutton5,'Enable','on')
    set(select_political_gui.radiobutton6,'Enable','on')
    set(select_political_gui.radiobutton7,'Enable','on')
    set(select_political_gui.radiobutton8,'Enable','on')
    set(select_political_gui.radiobutton9,'Enable','on')
    set(select_political_gui.radiobutton10,'Enable','on')
    set(select_political_gui.radiobutton11,'Enable','on')
    set(select_political_gui.radiobutton12,'Enable','on')
    set(select_political_gui.edit1,'Enable','on')
    
    %Set checkbox
    if isempty(country_include) == 0
        
        set(select_political_gui.checkbox1,'Value',1);
        
    end
    
    %Set line style
    if strcmp(country_line_style,'''-''') == 1
        
        set(select_political_gui.radiobutton1,'Value',1);
        
    elseif strcmp(country_line_style,'''--''') == 1
        
        set(select_political_gui.radiobutton2,'Value',1);
        
    elseif strcmp(country_line_style,''':''') == 1
        
        set(select_political_gui.radiobutton3,'Value',1);
        
    elseif strcmp(country_line_style,'''-.''') == 1
        
        set(select_political_gui.radiobutton4,'Value',1);
        
    end
    
    %Set line color
    if  strcmp(country_line_color,'''r''') == 1
        
        set(select_political_gui.radiobutton5,'Value',1);
        
    elseif strcmp(country_line_color,'''g''') == 1
        
        set(select_political_gui.radiobutton6,'Value',1);
        
    elseif strcmp(country_line_color,'''b''') == 1
        
        set(select_political_gui.radiobutton7,'Value',1);
        
    elseif strcmp(country_line_color,'''c''') == 1
        
        set(select_political_gui.radiobutton8,'Value',1);
        
    elseif strcmp(country_line_color,'''m''') == 1
        
        set(select_political_gui.radiobutton9,'Value',1);
        
    elseif strcmp(country_line_color,'''y''') == 1
        
        set(select_political_gui.radiobutton10,'Value',1);
        
    elseif strcmp(country_line_color,'''k''') == 1
        
        set(select_political_gui.radiobutton11,'Value',1);
        
    elseif strcmp(country_line_color,'[0.99 0.99 0.99]') == 1
        
        set(select_political_gui.radiobutton12,'Value',1);
        
    end
    
    %Set line width
    if isempty(country_line_width) == 0
        
        set(select_political_gui.edit1,'String',country_line_width)
        
    end
    
end

%Set the saved states boundaries parameters into the GUI
if states_include == 1 & valid_states == 1
    
    select_political_h   = findobj('Tag','select_political');
    select_political_gui = guidata(select_political_h);
    
    set(select_political_gui.radiobutton13,'Enable','on')
    set(select_political_gui.radiobutton14,'Enable','on')
    set(select_political_gui.radiobutton15,'Enable','on')
    set(select_political_gui.radiobutton16,'Enable','on')
    set(select_political_gui.radiobutton17,'Enable','on')
    set(select_political_gui.radiobutton18,'Enable','on')
    set(select_political_gui.radiobutton19,'Enable','on')
    set(select_political_gui.radiobutton20,'Enable','on')
    set(select_political_gui.radiobutton21,'Enable','on')
    set(select_political_gui.radiobutton22,'Enable','on')
    set(select_political_gui.radiobutton23,'Enable','on')
    set(select_political_gui.radiobutton24,'Enable','on')
    set(select_political_gui.edit2,'Enable','on')
    
    %Set checkbox
    if isempty(states_include) == 0
        
        set(select_political_gui.checkbox2,'Value',1);
        
    end
    
    %Set line style
    if strcmp(states_line_style,'''-''') == 1
        
        set(select_political_gui.radiobutton13,'Value',1);
        
    elseif strcmp(states_line_style,'''--''') == 1
        
        set(select_political_gui.radiobutton14,'Value',1);
        
    elseif strcmp(states_line_style,''':''') == 1
        
        set(select_political_gui.radiobutton15,'Value',1);
        
    elseif strcmp(states_line_style,'''-.''') == 1
        
        set(select_political_gui.radiobutton16,'Value',1);
        
    end
    
    %Set line color
    if  strcmp(states_line_color,'''r''') == 1
        
        set(select_political_gui.radiobutton17,'Value',1);
        
    elseif strcmp(states_line_color,'''g''') == 1
        
        set(select_political_gui.radiobutton18,'Value',1);
        
    elseif strcmp(states_line_color,'''b''') == 1
        
        set(select_political_gui.radiobutton19,'Value',1);
        
    elseif strcmp(states_line_color,'''c''') == 1
        
        set(select_political_gui.radiobutton20,'Value',1);
        
    elseif strcmp(states_line_color,'''m''') == 1
        
        set(select_political_gui.radiobutton21,'Value',1);
        
    elseif strcmp(states_line_color,'''y''') == 1
        
        set(select_political_gui.radiobutton22,'Value',1);
        
    elseif strcmp(states_line_color,'''k''') == 1
        
        set(select_political_gui.radiobutton23,'Value',1);
        
    elseif strcmp(states_line_color,'[0.99 0.99 0.99]') == 1
        
        set(select_political_gui.radiobutton24,'Value',1);
        
    end
    
    %Set line width
    if isempty(states_line_width) == 0
        
        set(select_political_gui.edit2,'String',states_line_width)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_4_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global grid_box grid_tickstyle grid_color grid_linewidth grid_fontsize grid_X_axis grid_Y_axis valid_grid

%Open Grid Parameters GUI
select_grid

%Set the saved coastline parameters into the GUI
if valid_grid == 1
    
    select_grid_h   = findobj('Tag','select_grid');
    select_grid_gui = guidata(select_grid_h);
    
    %Set grid box
    if strcmp(grid_box,'''on''') == 1
        
        set(select_grid_gui.radiobutton1,'Value',1)
        
    elseif strcmp(grid_box,'''off''') == 1
        
        set(select_grid_gui.radiobutton2,'Value',1)
        
    elseif strcmp(grid_box,'''fancy''') == 1
        
        set(select_grid_gui.radiobutton3,'Value',1)
        
    end
    
    %Set grid tickstyle
    if strcmp(grid_tickstyle,'''dd''') == 1
        
        set(select_grid_gui.radiobutton19,'Value',1)
        
    elseif strcmp(grid_tickstyle,'''dm''') == 1
        
        set(select_grid_gui.radiobutton20,'Value',1)
        
    end
    
    %Set grid color
    if strcmp(grid_color,'''r''') == 1
        
        set(select_grid_gui.radiobutton10,'Value',1)
        
    elseif strcmp(grid_color,'''g''') == 1
        
        set(select_grid_gui.radiobutton11,'Value',1)
        
    elseif strcmp(grid_color,'''b''') == 1
        
        set(select_grid_gui.radiobutton12,'Value',1)
        
    elseif strcmp(grid_color,'''c''') == 1
        
        set(select_grid_gui.radiobutton13,'Value',1)
        
    elseif strcmp(grid_color,'''m''') == 1
        
        set(select_grid_gui.radiobutton14,'Value',1)
        
    elseif strcmp(grid_color,'''y''') == 1
        
        set(select_grid_gui.radiobutton15,'Value',1)
        
    elseif strcmp(grid_color,'''k''') == 1
        
        set(select_grid_gui.radiobutton16,'Value',1)
        
    elseif strcmp(grid_color,'''w''') == 1
        
        set(select_grid_gui.radiobutton17,'Value',1)
        
    end
    
    %Set grid line width
    if isempty(grid_linewidth) == 0
        
        set(select_grid_gui.edit1,'String',grid_linewidth)
        
    end
    
    %Set grid font size
    if isempty(grid_fontsize) == 0
        
        set(select_grid_gui.edit2,'String',grid_fontsize)
        
    end
    
    %Set grid x-axis location
    if strcmp(grid_X_axis,'''bottom''') == 1
        
        set(select_grid_gui.radiobutton4,'Value',1)
        
    elseif strcmp(grid_X_axis,'''middle''') == 1
        
        set(select_grid_gui.radiobutton5,'Value',1)
        
    elseif strcmp(grid_X_axis,'''top''') == 1
        
        set(select_grid_gui.radiobutton6,'Value',1)
        
    end
    
    %Set grid y-axis location
    if strcmp(grid_Y_axis,'''left''') == 1
        
        set(select_grid_gui.radiobutton7,'Value',1)
        
    elseif strcmp(grid_Y_axis,'''middle''') == 1
        
        set(select_grid_gui.radiobutton8,'Value',1)
        
    elseif strcmp(grid_Y_axis,'''right''') == 1
        
        set(select_grid_gui.radiobutton9,'Value',1)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_5_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global plot_function shading_method colormap_type valid_plot
global valid_filename

%Check for wrong input file
if (isempty(valid_filename) == 1) || (valid_filename == 0)
    
    errordlg('You did not select a valid input file. Please select a valid input file!','Data File Error')
    return
    
else
    
    %Open Plot Parameters GUI
    select_plot
    
    %Set the saved plot parameters into the GUI
    if valid_plot == 1
        
        select_plot_h   = findobj('Tag','select_plot');
        select_plot_gui = guidata(select_plot_h);
        
        %Set plot function
        if strcmp(plot_function,'m_contour') == 1
            
            set(select_plot_gui.radiobutton1,'Value',1)
            
        elseif strcmp(plot_function,'m_contourf') == 1
            
            set(select_plot_gui.radiobutton2,'Value',1)
            
        elseif strcmp(plot_function,'m_pcolor') == 1
            
            set(select_plot_gui.radiobutton3,'Value',1)
            
        end
        
        %Set shading method
        if strcmp(shading_method,'''flat''') == 1
            
            set(select_plot_gui.radiobutton4,'Value',1)
            
        elseif strcmp(shading_method,'''faceted''') == 1
            
            set(select_plot_gui.radiobutton5,'Value',1)
            
        elseif strcmp(shading_method,'''interp''') == 1
            
            set(select_plot_gui.radiobutton6,'Value',1)
            
        end
        
        %Set colormap type
        if strcmp(colormap_type,'''jet''') == 1
            
            set(select_plot_gui.radiobutton7,'Value',1)
            
        elseif strcmp(colormap_type,'''hsv''') == 1
            
            set(select_plot_gui.radiobutton8,'Value',1)
            
        elseif strcmp(colormap_type,'''hot''') == 1
            
            set(select_plot_gui.radiobutton9,'Value',1)
            
        elseif strcmp(colormap_type,'''cool''') == 1
            
            set(select_plot_gui.radiobutton10,'Value',1)
            
        elseif strcmp(colormap_type,'''spring''') == 1
            
            set(select_plot_gui.radiobutton11,'Value',1)
            
        elseif strcmp(colormap_type,'''summer''') == 1
            
            set(select_plot_gui.radiobutton12,'Value',1)
            
        elseif strcmp(colormap_type,'''autumn''') == 1
            
            set(select_plot_gui.radiobutton13,'Value',1)
            
        elseif strcmp(colormap_type,'''winter''') == 1
            
            set(select_plot_gui.radiobutton14,'Value',1)
            
        elseif strcmp(colormap_type,'''gray''') == 1
            
            set(select_plot_gui.radiobutton15,'Value',1)
            
        elseif strcmp(colormap_type,'''bone''') == 1
            
            set(select_plot_gui.radiobutton16,'Value',1)
            
        elseif strcmp(colormap_type,'''copper''') == 1
            
            set(select_plot_gui.radiobutton17,'Value',1)
            
        elseif strcmp(colormap_type,'''pink''') == 1
            
            set(select_plot_gui.radiobutton18,'Value',1)
            
        elseif strcmp(colormap_type,'''lines''') == 1
            
            set(select_plot_gui.radiobutton19,'Value',1)
            
        end
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_6_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global interp_method interp_step min_lamda_interp max_lamda_interp min_phi_interp max_phi_interp
global valid_interpolation valid_filename

if (isempty(valid_filename) == 1) || (valid_filename == 0)
    
    errordlg('You did not select a valid input file. Please select a valid input file!','Data File Error')
    return
    
else
    
    %Open Interpolation Parameters GUI
    select_interpolation
    
    %Set the saved interpolation parameters into the GUI
    if valid_interpolation == 1
        
        select_interpolation_h   = findobj('Tag','select_interpolation');
        select_interpolation_gui = guidata(select_interpolation_h);
        
        %Set the interpolation method
        if strcmp(interp_method,'linear') == 1
            
            set(select_interpolation_gui.radiobutton1,'Value',1)
            
        elseif strcmp(interp_method,'cubic') == 1
            
            set(select_interpolation_gui.radiobutton2,'Value',1)
            
        elseif strcmp(interp_method,'nearest') == 1
            
            set(select_interpolation_gui.radiobutton3,'Value',1)
            
        elseif strcmp(interp_method,'v4') == 1
            
            set(select_interpolation_gui.radiobutton4,'Value',1)
            
        end
        
        %Set the interpolation step and limits
        if isempty(interp_step) == 0
            
            set(select_interpolation_gui.edit1,'String',interp_step)
            
        end
        
        if isempty(min_lamda_interp) == 0
            
            set(select_interpolation_gui.edit2,'String',min_lamda_interp)
            
        end
        
        if isempty(max_lamda_interp) == 0
            
            set(select_interpolation_gui.edit4,'String',max_lamda_interp)
            
        end
        
        if isempty(min_phi_interp) == 0
            
            set(select_interpolation_gui.edit3,'String',min_phi_interp)
            
        end
        
        if isempty(max_phi_interp) == 0
            
            set(select_interpolation_gui.edit5,'String',max_phi_interp)
            
        end
        
    end
    
end


% --------------------------------------------------------------------
function Menu_2_7_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global scale_factor shaft_width line_width head_length centered_boolean color_filled color_edge
global valid_vector valid_filename num

if (isempty(valid_filename) == 1) || (valid_filename == 0)
    
    errordlg('You did not select a valid input file. Please select a valid input file!','Data File Error')
    
elseif num(1,2) == 4
    
    %Open Vector Parameters GUI
    select_vector
    
    %Set the saved vector parameters into the GUI
    if valid_vector == 1
        
        select_vector_h   = findobj('Tag','select_vector');
        select_vector_gui = guidata(select_vector_h);
        
        %Set the centering
        if centered_boolean == 0;
            
            set(select_vector_gui.radiobutton19,'Value',1)
            
        elseif centered_boolean == 1;
            
            set(select_vector_gui.radiobutton20,'Value',1)
            
        end
        
        %Set the filled color
        if strcmp(color_filled,'''r''') == 1
            
            set(select_vector_gui.radiobutton1,'Value',1)
            
        elseif strcmp(color_filled,'''g''') == 1
            
            set(select_vector_gui.radiobutton2,'Value',1)
            
        elseif strcmp(color_filled,'''b''') == 1
            
            set(select_vector_gui.radiobutton3,'Value',1)
            
        elseif strcmp(color_filled,'''c''') == 1
            
            set(select_vector_gui.radiobutton4,'Value',1)
            
        elseif strcmp(color_filled,'''m''') == 1
            
            set(select_vector_gui.radiobutton5,'Value',1)
            
        elseif strcmp(color_filled,'''y''') == 1
            
            set(select_vector_gui.radiobutton6,'Value',1)
            
        elseif strcmp(color_filled,'''k''') == 1
            
            set(select_vector_gui.radiobutton7,'Value',1)
            
        elseif strcmp(color_filled,'''w''') == 1
            
            set(select_vector_gui.radiobutton8,'Value',1)
            
        end
        
        %Set the edge color
        if  strcmp(color_edge,'''r''') == 1
            
            set(select_vector_gui.radiobutton10,'Value',1)
            
        elseif strcmp(color_edge,'''g''') == 1
            
            set(select_vector_gui.radiobutton11,'Value',1)
            
        elseif strcmp(color_edge,'''b''') == 1
            
            set(select_vector_gui.radiobutton12,'Value',1)
            
        elseif strcmp(color_edge,'''c''') == 1
            
            set(select_vector_gui.radiobutton13,'Value',1)
            
        elseif strcmp(color_edge,'''m''') == 1
            
            set(select_vector_gui.radiobutton14,'Value',1)
            
        elseif strcmp(color_edge,'''y''') == 1
            
            set(select_vector_gui.radiobutton15,'Value',1)
            
        elseif strcmp(color_edge,'''k''') == 1
            
            set(select_vector_gui.radiobutton16,'Value',1)
            
        elseif strcmp(color_edge,'''w''') == 1
            
            set(select_vector_gui.radiobutton17,'Value',1)
            
        end
        
        %Set the vector parameters
        if isempty(scale_factor) == 0
            
            set(select_vector_gui.edit4,'String',scale_factor)
            
        end
        
        if isempty(shaft_width) == 0
            
            set(select_vector_gui.edit1,'String',shaft_width)
            
        end
        
        if isempty(line_width) == 0
            
            set(select_vector_gui.edit2,'String',line_width)
            
        end
        
        if isempty(head_length) == 0
            
            set(select_vector_gui.edit3,'String',head_length)
            
        end
        
    end
    
else
    
    errordlg('Wrong data file dimensions. In order to use this option, you have to load a data file with 4 collumns.','Data File Error');
    
end


% --------------------------------------------------------------------
function Menu_2_8_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_2_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global ellipses_scale_factor ellipses_line_width ellipses_line_style ellipses_line_color
global center_ellipses center_edgecolor center_facecolor center_markertype center_markersize
global num valid_ellipses valid_filename

if (isempty(valid_filename) == 1) || (valid_filename ~= 1)
    
    errordlg('You did not select a valid input file. Please select a valid input file!','Data File Error')
    return
    
elseif num(1,2) == 5
    
    %Open Error Ellipses Parameters GUI
    select_ellipses
    
    %Set the saved ellipses parameters into the GUI
    if valid_ellipses == 1
        
        select_ellipses_h   = findobj('Tag','select_ellipses');
        select_ellipses_gui = guidata(select_ellipses_h);
        
        %Set the scale factor and line width
        if isempty(ellipses_scale_factor) == 0
            
            set(select_ellipses_gui.edit1,'String',ellipses_scale_factor)
            
        end
        
        if isempty(ellipses_line_width) == 0
            
            set(select_ellipses_gui.edit5,'String',ellipses_line_width)
            
        end
        
        %Set the line style
        if strcmp(ellipses_line_style,'-') == 1
            
            set(select_ellipses_gui.radiobutton1,'Value',1)
            
        elseif strcmp(ellipses_line_style,'--') == 1
            
            set(select_ellipses_gui.radiobutton2,'Value',1)
            
        elseif strcmp(ellipses_line_style,':') == 1
            
            set(select_ellipses_gui.radiobutton3,'Value',1)
            
        elseif strcmp(ellipses_line_style,'-.') == 1
            
            set(select_ellipses_gui.radiobutton4,'Value',1)
            
        end
        
        %Set the line color
        if strcmp(ellipses_line_color,'r') == 1
            
            set(select_ellipses_gui.radiobutton5,'Value',1)
            
        elseif strcmp(ellipses_line_color,'g') == 1
            
            set(select_ellipses_gui.radiobutton6,'Value',1)
            
        elseif strcmp(ellipses_line_color,'b') == 1
            
            set(select_ellipses_gui.radiobutton7,'Value',1)
            
        elseif strcmp(ellipses_line_color,'c') == 1
            
            set(select_ellipses_gui.radiobutton8,'Value',1)
            
        elseif strcmp(ellipses_line_color,'m') == 1
            
            set(select_ellipses_gui.radiobutton9,'Value',1)
            
        elseif strcmp(ellipses_line_color,'y') == 1
            
            set(select_ellipses_gui.radiobutton10,'Value',1)
            
        elseif strcmp(ellipses_line_color,'k') == 1
            
            set(select_ellipses_gui.radiobutton11,'Value',1)
            
        elseif strcmp(ellipses_line_color,'w') == 1
            
            set(select_ellipses_gui.radiobutton12,'Value',1)
            
        end
        
        if strcmp(center_ellipses,'yes') == 1
            
            set(select_ellipses_gui.radiobutton47,'Enable','on')
            set(select_ellipses_gui.radiobutton48,'Enable','on')
            set(select_ellipses_gui.radiobutton49,'Enable','on')
            set(select_ellipses_gui.radiobutton50,'Enable','on')
            set(select_ellipses_gui.radiobutton51,'Enable','on')
            set(select_ellipses_gui.radiobutton52,'Enable','on')
            set(select_ellipses_gui.radiobutton53,'Enable','on')
            set(select_ellipses_gui.radiobutton54,'Enable','on')
            
            set(select_ellipses_gui.radiobutton56,'Enable','on')
            set(select_ellipses_gui.radiobutton57,'Enable','on')
            set(select_ellipses_gui.radiobutton58,'Enable','on')
            set(select_ellipses_gui.radiobutton59,'Enable','on')
            set(select_ellipses_gui.radiobutton60,'Enable','on')
            set(select_ellipses_gui.radiobutton61,'Enable','on')
            set(select_ellipses_gui.radiobutton62,'Enable','on')
            set(select_ellipses_gui.radiobutton63,'Enable','on')
            set(select_ellipses_gui.radiobutton64,'Enable','on')
            
            set(select_ellipses_gui.radiobutton65,'Enable','on')
            set(select_ellipses_gui.radiobutton66,'Enable','on')
            set(select_ellipses_gui.radiobutton67,'Enable','on')
            set(select_ellipses_gui.radiobutton68,'Enable','on')
            set(select_ellipses_gui.radiobutton69,'Enable','on')
            set(select_ellipses_gui.radiobutton70,'Enable','on')
            set(select_ellipses_gui.radiobutton71,'Enable','on')
            set(select_ellipses_gui.radiobutton72,'Enable','on')
            set(select_ellipses_gui.radiobutton73,'Enable','on')
            set(select_ellipses_gui.radiobutton74,'Enable','on')
            set(select_ellipses_gui.radiobutton75,'Enable','on')
            set(select_ellipses_gui.radiobutton76,'Enable','on')
            set(select_ellipses_gui.radiobutton77,'Enable','on')
            set(select_ellipses_gui.edit4,'Enable','on')
            set(select_ellipses_gui.text5,'Enable','on')
            
            %Set ellipses center
            set(select_ellipses_gui.radiobutton46,'Value',1)
            set(select_ellipses_gui.radiobutton45,'Value',0)
            
            %Set center markersize
            if isempty(center_markersize) == 0
                
                set(select_ellipses_gui.edit4,'String',center_markersize)
                
            end
            
            %Set center edge color
            if strcmp(center_edgecolor,'''r''') == 1
                
                set(select_ellipses_gui.radiobutton47,'Value',1)
                
            elseif strcmp(center_edgecolor,'''g''') == 1
                
                set(select_ellipses_gui.radiobutton48,'Value',1)
                
            elseif strcmp(center_edgecolor,'''b''') == 1
                
                set(select_ellipses_gui.radiobutton49,'Value',1)
                
            elseif strcmp(center_edgecolor,'''c''') == 1
                
                set(select_ellipses_gui.radiobutton50,'Value',1)
                
            elseif strcmp(center_edgecolor,'''m''') == 1
                
                set(select_ellipses_gui.radiobutton51,'Value',1)
                
            elseif strcmp(center_edgecolor,'''y''') == 1
                
                set(select_ellipses_gui.radiobutton52,'Value',1)
                
            elseif strcmp(center_edgecolor,'''k''') == 1
                
                set(select_ellipses_gui.radiobutton53,'Value',1)
                
            elseif strcmp(center_edgecolor,'''w''') == 1
                
                set(select_ellipses_gui.radiobutton54,'Value',1)
                
            end
            
            %Get center facecolor
            if strcmp(center_facecolor,'''none''') == 1
                
                set(select_ellipses_gui.radiobutton64,'Value',1)
                
            elseif strcmp(center_facecolor,'''r''') == 1
                
                set(select_ellipses_gui.radiobutton56,'Value',1)
                
            elseif strcmp(center_facecolor,'''g''') == 1
                
                set(select_ellipses_gui.radiobutton57,'Value',1)
                
            elseif strcmp(center_facecolor,'''b''') == 1
                
                set(select_ellipses_gui.radiobutton58,'Value',1)
                
            elseif strcmp(center_facecolor,'''c''') == 1
                
                set(select_ellipses_gui.radiobutton59,'Value',1)
                
            elseif strcmp(center_facecolor,'''m''') == 1
                
                set(select_ellipses_gui.radiobutton60,'Value',1)
                
            elseif strcmp(center_facecolor,'''y''') == 1
                
                set(select_ellipses_gui.radiobutton61,'Value',1)
                
            elseif strcmp(center_facecolor,'''k''') == 1
                
                set(select_ellipses_gui.radiobutton62,'Value',1)
                
            elseif strcmp(center_facecolor,'''w''') == 1
                
                set(select_ellipses_gui.radiobutton63,'Value',1)
                
            end
            
            %Get center markertype
            if strcmp(center_markertype,'''+''') == 1
                
                set(select_ellipses_gui.radiobutton73,'Value',1)
                
            elseif strcmp(center_markertype,'''o''') == 1
                
                set(select_ellipses_gui.radiobutton65,'Value',1)
                
            elseif strcmp(center_markertype,'''*''') == 1
                
                set(select_ellipses_gui.radiobutton66,'Value',1)
                
            elseif strcmp(center_markertype,'''.''') == 1
                
                set(select_ellipses_gui.radiobutton67,'Value',1)
                
            elseif strcmp(center_markertype,'''x''') == 1
                
                set(select_ellipses_gui.radiobutton68,'Value',1)
                
            elseif strcmp(center_markertype,'''s''') == 1
                
                set(select_ellipses_gui.radiobutton69,'Value',1)
                
            elseif strcmp(center_markertype,'''d''') == 1
                
                set(select_ellipses_gui.radiobutton70,'Value',1)
                
            elseif strcmp(center_markertype,'''^''') == 1
                
                set(select_ellipses_gui.radiobutton71,'Value',1)
                
            elseif strcmp(center_markertype,'''v''') == 1
                
                set(select_ellipses_gui.radiobutton72,'Value',1)
                
            elseif strcmp(center_markertype,'''>''') == 1
                
                set(select_ellipses_gui.radiobutton74,'Value',1)
                
            elseif strcmp(center_markertype,'''<''') == 1
                
                set(select_ellipses_gui.radiobutton75,'Value',1)
                
            elseif strcmp(center_markertype,'''p''') == 1
                
                set(select_ellipses_gui.radiobutton76,'Value',1)
                
            elseif strcmp(center_markertype,'''h''') == 1
                
                set(select_ellipses_gui.radiobutton77,'Value',1)
                
            end
            
        elseif strcmp(center_ellipses,'no') == 1
            
            set(select_ellipses_gui.radiobutton45,'Value',1)
            set(select_ellipses_gui.radiobutton46,'Value',0)
            
        end
        
    end
    
else
    
    errordlg('Wrong data file dimensions. In order to use this option, you have to load a data file with 5 collumns.','Data File Error');
    return
    
end


% --------------------------------------------------------------------
function Menu_3_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_3_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_3_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global title_label x_axis_label y_axis_label colorbar_label title_fontsize x_axis_fontsize y_axis_fontsize colorbar_fontsize
global title_color x_axis_color y_axis_color colorbar_color title_fontweight x_axis_fontweight y_axis_fontweight colorbar_fontweight
global valid_labels

%Open Label Parameters GUI
select_labels

%Set the saved label parameters into the GUI
if valid_labels == 1
    
    select_labels_h   = findobj('Tag','select_labels');
    select_labels_gui = guidata(select_labels_h);
    
    %Set labels and fontsizes
    if isempty(title_label) ~= 1
        
        set(select_labels_gui.edit1,'String',title_label)
        set(select_labels_gui.edit2,'String',title_fontsize)
        
    else
        
        set(select_labels_gui.edit1,'String','')
        set(select_labels_gui.edit2,'String','')
        
    end
    
    if isempty(x_axis_label) ~= 1
        
        set(select_labels_gui.edit7,'String',x_axis_label)
        set(select_labels_gui.edit8,'String',x_axis_fontsize)
        
    else
        
        set(select_labels_gui.edit7,'String','')
        set(select_labels_gui.edit8,'String','')
        
    end
    
    if isempty(y_axis_label) ~= 1
        
        set(select_labels_gui.edit9,'String',y_axis_label)
        set(select_labels_gui.edit10,'String',y_axis_fontsize)
        
    else
        
        set(select_labels_gui.edit9,'String','')
        set(select_labels_gui.edit10,'String','')
        
    end
    
    if isempty(colorbar_label) ~= 1 && isempty(colorbar_fontsize) ~= 1
        
        set(select_labels_gui.edit11,'String',colorbar_label)
        set(select_labels_gui.edit12,'String',colorbar_fontsize)
        
    else
        
        set(select_labels_gui.edit11,'String','')
        set(select_labels_gui.edit12,'String',colorbar_fontsize)
        
    end
    
    %Get title color
    if strcmp(title_color,'''r''') == 1
        
        set(select_labels_gui.radiobutton5,'Value',1)
        
    elseif strcmp(title_color,'''g''') == 1
        
        set(select_labels_gui.radiobutton6,'Value',1)
        
    elseif strcmp(title_color,'''b''') == 1
        
        set(select_labels_gui.radiobutton7,'Value',1)
        
    elseif strcmp(title_color,'''c''') == 1
        
        set(select_labels_gui.radiobutton8,'Value',1)
        
    elseif strcmp(title_color,'''m''') == 1
        
        set(select_labels_gui.radiobutton9,'Value',1)
        
    elseif strcmp(title_color,'''y''') == 1
        
        set(select_labels_gui.radiobutton10,'Value',1)
        
    elseif strcmp(title_color,'''k''') == 1
        
        set(select_labels_gui.radiobutton11,'Value',1)
        
    elseif strcmp(title_color,'''w''') == 1
        
        set(select_labels_gui.radiobutton12,'Value',1)
        
    end
    
    %Get x-axis color
    if  strcmp(x_axis_color,'''r''') == 1
        
        set(select_labels_gui.radiobutton38,'Value',1)
        
    elseif strcmp(x_axis_color,'''g''') == 1
        
        set(select_labels_gui.radiobutton39,'Value',1)
        
    elseif strcmp(x_axis_color,'''b''') == 1
        
        set(select_labels_gui.radiobutton40,'Value',1)
        
    elseif strcmp(x_axis_color,'''c''') == 1
        
        set(select_labels_gui.radiobutton41,'Value',1)
        
    elseif strcmp(x_axis_color,'''m''') == 1
        
        set(select_labels_gui.radiobutton42,'Value',1)
        
    elseif strcmp(x_axis_color,'''y''') == 1
        
        set(select_labels_gui.radiobutton43,'Value',1)
        
    elseif strcmp(x_axis_color,'''k''') == 1
        
        set(select_labels_gui.radiobutton44,'Value',1)
        
    elseif strcmp(x_axis_color,'''w''') == 1
        
        set(select_labels_gui.radiobutton45,'Value',1)
        
    end
    
    %Get y-axis color
    if strcmp(y_axis_color,'''r''') == 1
        
        set(select_labels_gui.radiobutton50,'Value',1)
        
    elseif strcmp(y_axis_color,'''g''') == 1
        
        set(select_labels_gui.radiobutton51,'Value',1)
        
    elseif strcmp(y_axis_color,'''b''') == 1
        
        set(select_labels_gui.radiobutton52,'Value',1)
        
    elseif strcmp(y_axis_color,'''c''') == 1
        
        set(select_labels_gui.radiobutton53,'Value',1)
        
    elseif strcmp(y_axis_color,'''m''') == 1
        
        set(select_labels_gui.radiobutton54,'Value',1)
        
    elseif strcmp(y_axis_color,'''y''') == 1
        
        set(select_labels_gui.radiobutton55,'Value',1)
        
    elseif strcmp(y_axis_color,'''k''') == 1
        
        set(select_labels_gui.radiobutton56,'Value',1)
        
    elseif strcmp(y_axis_color,'''w''') == 1
        
        set(select_labels_gui.radiobutton57,'Value',1)
        
    end
    
    %Get colorbar color
    if strcmp(colorbar_color,'''r''') == 1
        
        set(select_labels_gui.radiobutton62,'Value',1)
        
    elseif strcmp(colorbar_color,'''g''') == 1
        
        set(select_labels_gui.radiobutton63,'Value',1)
        
    elseif strcmp(colorbar_color,'''b''') == 1
        
        set(select_labels_gui.radiobutton64,'Value',1)
        
    elseif strcmp(colorbar_color,'''c''') == 1
        
        set(select_labels_gui.radiobutton65,'Value',1)
        
    elseif strcmp(colorbar_color,'''m''') == 1
        
        set(select_labels_gui.radiobutton66,'Value',1)
        
    elseif strcmp(colorbar_color,'''y''') == 1
        
        set(select_labels_gui.radiobutton67,'Value',1)
        
    elseif strcmp(colorbar_color,'''k''') == 1
        
        set(select_labels_gui.radiobutton68,'Value',1)
        
    elseif strcmp(colorbar_color,'''w''') == 1
        
        set(select_labels_gui.radiobutton69,'Value',1)
        
    end
    
    %Get title font weight
    if strcmp(title_fontweight,'''normal''') == 1
        
        set(select_labels_gui.radiobutton1,'Value',1)
        
    elseif strcmp(title_fontweight,'''bold''') == 1
        
        set(select_labels_gui.radiobutton2,'Value',1)
        
    elseif strcmp(title_fontweight,'''light''') == 1
        
        set(select_labels_gui.radiobutton3,'Value',1)
        
    elseif strcmp(title_fontweight,'''demi''') == 1
        
        set(select_labels_gui.radiobutton4,'Value',1)
        
    end
    
    %Get x-axis font weight
    if strcmp(x_axis_fontweight,'''normal''') == 1
        
        set(select_labels_gui.radiobutton46,'Value',1)
        
    elseif strcmp(x_axis_fontweight,'''bold''') == 1
        
        set(select_labels_gui.radiobutton47,'Value',1)
        
    elseif strcmp(x_axis_fontweight,'''light''') == 1
        
        set(select_labels_gui.radiobutton48,'Value',1)
        
    elseif strcmp(x_axis_fontweight,'''demi''') == 1
        
        set(select_labels_gui.radiobutton49,'Value',1)
        
    end
    
    %Get y-axis font weight
    if strcmp(y_axis_fontweight,'''normal''') == 1
        
        set(select_labels_gui.radiobutton58,'Value',1)
        
    elseif strcmp(y_axis_fontweight,'''bold''') == 1
        
        set(select_labels_gui.radiobutton59,'Value',1)
        
    elseif strcmp(y_axis_fontweight,'''light''') == 1
        
        set(select_labels_gui.radiobutton60,'Value',1)
        
    elseif strcmp(y_axis_fontweight,'''demi''') == 1
        
        set(select_labels_gui.radiobutton61,'Value',1)
        
    end
    
    %Get colorbar font weight
    if strcmp(colorbar_fontweight,'''normal''') == 1
        
        set(select_labels_gui.radiobutton70,'Value',1)
        
    elseif strcmp(colorbar_fontweight,'''bold''') == 1
        
        set(select_labels_gui.radiobutton71,'Value',1)
        
    elseif strcmp(colorbar_fontweight,'''light''') == 1
        
        set(select_labels_gui.radiobutton72,'Value',1)
        
    elseif strcmp(colorbar_fontweight,'''demi''') == 1
        
        set(select_labels_gui.radiobutton73,'Value',1)
        
    end
    
end


% --------------------------------------------------------------------
function Menu_3_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_3_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global figure_window save_figure figure_name figure_dpi is_figure

%Open figure parameters GUI
select_figure

%Set the saved figure parameters into the GUI
if is_figure == 1
    
    select_figure_h   = findobj('Tag','select_figure');
    select_figure_gui = guidata(select_figure_h);
    
    %Set the figure window
    if strcmp(figure_window,'Default Size') == 1
        
        set(select_figure_gui.radiobutton1,'Value',1)
        set(select_figure_gui.radiobutton2,'Value',0)
        
    elseif strcmp(figure_window,'Maximized') == 1
        
        set(select_figure_gui.radiobutton1,'Value',0)
        set(select_figure_gui.radiobutton2,'Value',1)
        
    end
    
    if strcmp(save_figure,'Yes') == 1
        
        set(select_figure_gui.radiobutton4,'Value',0)
        set(select_figure_gui.radiobutton5,'Value',1)
        set(select_figure_gui.text5,'Enable','on')
        set(select_figure_gui.text6,'Enable','on')
        set(select_figure_gui.edit4,'Enable','on')
        set(select_figure_gui.edit5,'Enable','on')
        
        %Set figure name and resolution
        if isempty(figure_dpi) == 0
            
            set(select_figure_gui.edit4,'String',figure_dpi)
            
        end
        
        if isempty(figure_name) == 0
            
            set(select_figure_gui.edit5,'String',figure_name)
            
        end
        
    elseif strcmp(save_figure,'No') == 1
        
        set(select_figure_gui.radiobutton4,'Value',1)
        set(select_figure_gui.radiobutton5,'Value',0)
        set(select_figure_gui.text5,'Enable','off')
        set(select_figure_gui.text6,'Enable','off')
        set(select_figure_gui.edit4,'Enable','off')
        set(select_figure_gui.edit5,'Enable','off')
        
    end
    
end


% --------------------------------------------------------------------
function Menu_4_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_4_1_Callback(hObject, eventdata, handles, what_map)
% hObject    handle to Menu_4_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Menu_4_1_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_4_1_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Create_Map(1)


% --------------------------------------------------------------------
function Menu_4_1_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_4_1_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Create_Map(2)


% --------------------------------------------------------------------
function Menu_4_1_3_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_4_1_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Create_Map(3)


% --------------------------------------------------------------------
function Menu_4_1_4_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_4_1_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Create_Map(4)


% --------------------------------------------------------------------
function Menu_4_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_4_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Set global variables
global valid_projection valid_coastline valid_grid valid_filename

%Check for valid filename
if (isempty(valid_filename) == 1) || (valid_filename ~= 1)
    
    errordlg('You did not select a valid input file. Please select a valid input file!','Data File Error')
    return
    
end

%Check for valid projection parameters
if (isempty(valid_projection) == 1) || (valid_projection ~= 1)
    
    errordlg('The projection has not been defined. Please select the projection parameters!')
    return
    
end

%Check for valid coastline parameters
if (isempty(valid_coastline) == 1) || (valid_coastline ~= 1)
    
    errordlg('The coastline has not been defined. Please select the coastline parameters!')
    return
    
end

%Check for valid grid parameters
if (isempty(valid_grid) == 1) || (valid_grid ~= 1)
    
    errordlg('The grid has not been defined. Please select the grid parameters!')
    return
    
end

%Open Distribution Maps GUI
select_distribution


% --------------------------------------------------------------------
function Menu_5_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_5_1_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_5_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Open About GUI
select_about


% --------------------------------------------------------------------
function Menu_5_2_Callback(hObject, eventdata, handles)
% hObject    handle to Menu_5_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Open Manual pdf file
winopen('User Guide.pdf')


function Create_Map(what_map)

%Set global variables
global eval_m_proj eval_m_coast eval_country eval_states eval_m_grid eval_plot_function eval_m_vec eval_colormap eval_shading eval_title eval_x_axis eval_y_axis eval_colorbar1 eval_colorbar2 phi_data lamda_data PHI LAMDA FIELD_INTERP field1 field2 field3 field_interp
global figure_window save_figure eval_save num ellipses_scale_factor eval_ellipses eval_center_ellipses center_ellipses
global is_figure valid_labels valid_filename valid_projection valid_coastline valid_grid valid_plot valid_interpolation valid_vector valid_ellipses
global valid_country valid_states country_include states_include

%Add all directories
addpath(genpath(cd))
addpath(genpath('./m_map'))

%Check the map type
if ismember(what_map,[1 2 3]) == 1
    
    %Check for valid filename
    if (isempty(valid_filename) == 1) || (valid_filename ~= 1)
        
        errordlg('You did not select a valid input file. Please select a valid input file!','Data File Error')
        return
        
    end
    
end

%Check for valid projection parameters
if (isempty(valid_projection) == 1) || (valid_projection ~= 1)
    
    errordlg('The projection has not been defined. Please select the projection parameters!','Projection Error')
    return
    
end

%Check for valid coastline parameters
if (isempty(valid_coastline) == 1) || (valid_coastline ~= 1)
    
    errordlg('The coastline has not been defined. Please select the coastline parameters!','Coastline Error')
    return
    
end

%Check for valid grid parameters
if (isempty(valid_grid) == 1) || (valid_grid ~= 1)
    
    errordlg('The grid has not been defined. Please select the grid parameters!','Grid Error')
    return
    
end

if what_map == 1
    
    %Check for valid plot parameters
    if isempty(valid_plot) == 1 || valid_plot ~= 1
        
        errordlg('The plot parameters have not been defined. Please select the plot parameters!','Plot parameters Error')
        return
        
    end
    
    %Check for valid interpolation parameters
    if isempty(valid_interpolation) || valid_interpolation == 0
        
        errordlg('The interpolation parameters have not been defined. Please select the interpolation parameters!','Interpolation parameters Error')
        return
        
    end
    
end

if what_map == 2
    
    %Check for valid vector parameters
    if isempty(valid_vector) == 1 || valid_vector ~= 1
        
        errordlg('The vector parameters have not been defined. Please select the vector parameters!','Vector parameters Error')
        return
        
    end
    
end

if what_map == 3
    
    %Check for valid error ellipses parameters
    if isempty(valid_ellipses) == 1 || valid_ellipses ~= 1
        
        errordlg('The ellipses parameters have not been defined. Please select thee ellipses parameters!','Ellipses parameters Error')
        return
        
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

%Evaluate the plot and the shading
if what_map == 1
    
    eval(eval_plot_function)
    eval(eval_shading)
    
end

%Evaluate the coastline
eval(eval_m_coast)

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

%Evaluate the grid
eval(eval_m_grid)

%Evaluate the vectors
if what_map == 2
    
    eval(eval_m_vec)
    
end

%Evaluate the colormap
if what_map == 1
    
    h = colorbar;
    
    if valid_labels == 1
        
        eval(eval_colorbar1)
        eval(eval_colorbar2)
        
    end
    
    eval(eval_colormap)
    caxis([min(field_interp) max(field_interp)])
    
end

%Evaluate the ellipses and ellipses centers
if what_map == 3
    
    [station_e,station_n] = m_ll2xy(lamda_data,phi_data);
    hold on
    
    for i = 1:num(1,1)
        
        [XX(:,:,i),YY(:,:,i)] = f_ellipse(station_e(i,1),station_n(i,1),field1(i,1)*ellipses_scale_factor,field2(i,1)*ellipses_scale_factor,field3(i,1)-90);
        eval(eval_ellipses)
        
        if strcmp(center_ellipses,'yes') == 1
            
            eval(eval_center_ellipses)
            
        end
        
    end
    
end

%Evaluate the labels
if valid_labels == 1
    
    eval(eval_title)
    eval(eval_x_axis)
    eval(eval_y_axis)
    
end

hold off

%Evaluate the figure save
if strcmp(save_figure,'Yes') == 1
    
    eval(eval_save)
    
end


function [X,Y] = f_ellipse(x, y, a, b, angle, steps)

error(nargchk(5, 6, nargin));

if nargin < 6;
    
    steps = 360;
    
end

beta      = -angle * (pi / 180);
sinbeta   = sin(beta);
cosbeta   = cos(beta);

alpha     = linspace(0, 360, steps)' .* (pi / 180);
sinalpha  = sin(alpha);
cosalpha  = cos(alpha);

X         = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
Y         = y + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);

if nargout == 1
    
    X     = [X Y];
    
end
