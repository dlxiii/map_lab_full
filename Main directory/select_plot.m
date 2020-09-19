function varargout = select_plot(varargin)
% SELECT_PLOT M-file for select_plot.fig
%      SELECT_PLOT, by itself, creates a new SELECT_PLOT or raises the existing
%      singleton*.
%
%      H = SELECT_PLOT returns the handle to a new SELECT_PLOT or the handle to
%      the existing singleton*.
%
%      SELECT_PLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SELECT_PLOT.M with the given input arguments.
%
%      SELECT_PLOT('Property','Value',...) creates a new SELECT_PLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before select_plot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to select_plot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help select_plot

% Last Modified by GUIDE v2.5 11-Aug-2016 12:04:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @select_plot_OpeningFcn, ...
    'gui_OutputFcn',  @select_plot_OutputFcn, ...
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


% --- Executes just before select_plot is made visible.
function select_plot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to select_plot (see VARARGIN)

% Choose default command line output for select_plot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes select_plot wait for user response (see UIRESUME)
% uiwait(handles.select_plot);


% --- Outputs from this function are returned to the command line.
function varargout = select_plot_OutputFcn(hObject, eventdata, handles)
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
global plot_function shading_method colormap_type eval_plot_function eval_shading eval_colormap valid_plot

%Get plot function
if get(handles.radiobutton1,'Value') == 1
    
    plot_function  = 'm_contour';
    
elseif get(handles.radiobutton2,'Value') == 1
    
    plot_function  = 'm_contourf';
    
elseif get(handles.radiobutton3,'Value') == 1
    
    plot_function  = 'm_pcolor';
    
end

%Get shading method
if get(handles.radiobutton4,'Value') == 1
    
    shading_method = '''flat''';
    
elseif get(handles.radiobutton5,'Value') == 1
    
    shading_method = '''faceted''';
    
elseif get(handles.radiobutton6,'Value') == 1
    
    shading_method = '''interp''';
    
end

%Get colormap type
if get(handles.radiobutton7,'Value') == 1
    
    colormap_type  = '''jet''';
    
elseif get(handles.radiobutton8,'Value') == 1
    
    colormap_type  = '''hsv''';
    
elseif get(handles.radiobutton9,'Value') == 1
    
    colormap_type  = '''hot''';
    
elseif get(handles.radiobutton10,'Value') == 1
    
    colormap_type  = '''cool''';
    
elseif get(handles.radiobutton11,'Value') == 1
    
    colormap_type  = '''spring''';
    
elseif get(handles.radiobutton12,'Value') == 1
    
    colormap_type  = '''summer''';
    
elseif get(handles.radiobutton13,'Value') == 1
    
    colormap_type  = '''autumn''';
    
elseif get(handles.radiobutton14,'Value') == 1
    
    colormap_type  = '''winter''';
    
elseif get(handles.radiobutton15,'Value') == 1
    
    colormap_type  = '''gray''';
    
elseif get(handles.radiobutton16,'Value') == 1
    
    colormap_type  = '''bone''';
    
elseif get(handles.radiobutton17,'Value') == 1
    
    colormap_type  = '''copper''';
    
elseif get(handles.radiobutton18,'Value') == 1
    
    colormap_type  = '''pink''';
    
elseif get(handles.radiobutton19,'Value') == 1
    
    colormap_type  = '''lines''';
end

%Create the commands
eval_plot_function = strcat(plot_function,'(LAMDA,PHI,FIELD_INTERP)');
eval_shading       = strcat('shading','(',shading_method,')');
eval_colormap      = strcat('colormap','(',colormap_type,')');

%Set the boolean variables
valid_plot         = 1;

%Close Plot parameters GUI
close select_plot
