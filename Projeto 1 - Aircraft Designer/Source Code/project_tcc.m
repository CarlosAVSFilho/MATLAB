function varargout = project_tcc(varargin)
% PROJECT_TCC MATLAB code for project_tcc.fig
%      PROJECT_TCC, by itself, creates a new PROJECT_TCC or raises the existing
%      singleton*.
%
%      H = PROJECT_TCC returns the handle to a new PROJECT_TCC or the handle to
%      the existing singleton*.
%
%      PROJECT_TCC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_TCC.M with the given input arguments.
%
%      PROJECT_TCC('Property','Value',...) creates a new PROJECT_TCC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_tcc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_tcc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_tcc

% Last Modified by GUIDE v2.5 06-Apr-2018 17:41:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_tcc_OpeningFcn, ...
                   'gui_OutputFcn',  @project_tcc_OutputFcn, ...
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


% --- Executes just before project_tcc is made visible.
function project_tcc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_tcc (see VARARGIN)

% Choose default command line output for project_tcc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, eventdata, handles);

% UIWAIT makes project_tcc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


function initialize_gui(hObject, eventdata, handles)
% clc; clear all;
handles.g = 9.81; %[m/s²]

axes(handles.logo_ufu);
imshow([pwd '\lopas\logo_preto.jpg']);

axes(handles.polar_arrasto_grafico)
set(gca, 'Color', 'none','XColor',[212/255 208/255 200/255],'YColor',[212/255 208/255 200/255])
box on
set(handles.polar_arrasto_grafico,'xtick',[]); set(handles.polar_arrasto_grafico,'ytick',[]);

axes(handles.payload_range_grafico)
set(gca, 'Color', 'none','XColor',[212/255 208/255 200/255],'YColor',[212/255 208/255 200/255])
box on
set(handles.payload_range_grafico,'xtick',[]); set(handles.payload_range_grafico,'ytick',[]);

axes(handles.vista_tridimensional_plot)
set(gca, 'Color', 'none','XColor',[212/255 208/255 200/255],'YColor',[212/255 208/255 200/255])
box on
set(handles.vista_tridimensional_plot,'xtick',[]); set(handles.vista_tridimensional_plot,'ytick',[]);

axes(handles.vista_superior)
set(gca, 'Color', 'none','XColor',[212/255 208/255 200/255],'YColor',[212/255 208/255 200/255])
box on
set(handles.vista_superior,'xtick',[]); set(handles.vista_superior,'ytick',[]);

axes(handles.vista_lateral)
set(gca, 'Color', 'none','XColor',[212/255 208/255 200/255],'YColor',[212/255 208/255 200/255])
box on
set(handles.vista_lateral,'xtick',[]); set(handles.vista_lateral,'ytick',[]);

axes(handles.vista_frontal)
set(gca, 'Color', 'none','XColor',[212/255 208/255 200/255],'YColor',[212/255 208/255 200/255])
box on
set(handles.vista_frontal,'xtick',[]); set(handles.vista_frontal,'ytick',[]);


%Wing
set(handles.checkbox_aspect_ratio,'Value',0)
set(handles.aspect_ratio_answer,'enable','off')
set(handles.checkbox_lambda,'Value',0)
set(handles.lambda_answer,'enable','off')
set(handles.wing_area_answer,'enable','off')
set(handles.envergadura_answer,'enable','off')
set(handles.c_root_answer,'enable','off')
set(handles.c_tip_answer,'enable','off')
set(handles.mac_answer,'enable','off')
set(handles.posicao_mac_answer,'enable','off')

%Tail
% handles.selected_HT_VT = 1;
set(handles.aspect_ratio_HT_answer,'enable','off')
set(handles.aspect_ratio_VT_answer,'enable','off')
set(handles.lambda_HT_answer,'enable','off')
set(handles.lambda_VT_answer,'enable','off')
set(handles.HT_area_answer,'enable','off')
set(handles.VT_area_answer,'enable','off')
set(handles.envergadura_HT_answer,'enable','off')
set(handles.envergadura_VT_answer,'enable','off')
set(handles.c_root_HT_answer,'enable','off')
set(handles.c_root_VT_answer,'enable','off')
set(handles.c_tip_HT_answer,'enable','off')
set(handles.c_tip_VT_answer,'enable','off')
set(handles.mac_HT_answer,'enable','off')
set(handles.mac_VT_answer,'enable','off')
set(handles.posicao_mac_HT_answer,'enable','off')
set(handles.posicao_mac_VT_answer,'enable','off')

%Trem de pouso
set(handles.landing_gear_type1,'Visible','on')
set(handles.landing_gear_type2,'Visible','off')

%Polar de arrasto
set(handles.cfe_answer,'enable','off')
set(handles.checkbox_swet_sref,'Value',0)
set(handles.swet_sref_answer,'enable','off')

set(handles.C_D0_answer,'enable','off')
set(handles.k2_answer,'enable','off')

%Estimativa de peso
set(handles.TSFC_takeoff,'enable','off')
set(handles.TSFC_loiter,'enable','off')
set(handles.TSFC_cruise,'enable','off')

set(handles.SFC_takeoff,'enable','off')
set(handles.SFC_loiter,'enable','off')
set(handles.SFC_cruise,'enable','off')

set(handles.neta_takeoff,'enable','off')
set(handles.neta_loiter,'enable','off')
set(handles.neta_cruise,'enable','off')

%Valores obtidos de pesos
set(handles.W0_1_est_answer,'enable','off');
set(handles.Wempty_1_est_answer,'enable','off');
set(handles.Wfuel_1_est_answer,'enable','off');
set(handles.iteracoes_1_est_answer,'enable','off');

set(handles.W0_2_est_answer,'enable','off');
set(handles.Wempty_2_est_answer,'enable','off');
set(handles.Wfuel_2_est_answer,'enable','off');
set(handles.iteracoes_2_est_answer,'enable','off');

set(handles.W0_3_est_answer,'enable','off');
set(handles.Wempty_3_est_answer,'enable','off');
set(handles.Wfuel_3_est_answer,'enable','off');
set(handles.iteracoes_3_est_answer,'enable','off');

set(handles.wing_area_emp_answer,'enable','off');

%Condições de Desempenho
set(handles.empuxo_peso_popup,'Visible','off')
set(handles.prop_bi_quadri,'Visible','off')

set(handles.dec_com_obst_35ft,'String','Com obstáculo de 50 ft')

set(handles.T_por_engine,'Visible','off')
set(handles.T_cruise,'Visible','off')
set(handles.T_takeoff,'Visible','off')

set(handles.qtd_motores_answer,'enable','off')
set(handles.qtd_blades_answer,'enable','off')
set(handles.carga_alar_answer,'enable','off');
set(handles.v_stall_answer,'enable','off');
set(handles.T_por_engine_answer,'enable','off');
set(handles.T_cruise_answer,'enable','off');
set(handles.T_takeoff_answer,'enable','off');
set(handles.dist_decolagem_answer,'enable','off');
set(handles.dist_aterrissagem_answer,'enable','off');

%Areas Sup Primarias de Controle de Voo
set(handles.diedro_answer,'enable','off');
set(handles.aileron_area_answer,'enable','off');
set(handles.profundor_area_answer,'enable','off');
set(handles.leme_area_answer,'enable','off');

%Dimensões
set(handles.diam_fuselagem_answer,'enable','off')
set(handles.length_nariz_answer,'enable','off')
set(handles.length_cabine_answer,'enable','off')
set(handles.length_cauda_answer,'enable','off')
set(handles.diam_helice_answer,'enable','off')

z = zoom;
z.ActionPostCallback = {@mypostcallback,handles};
clc;
guidata(hObject,handles)

% --- Outputs from this function are returned to the command line.
function varargout = project_tcc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%Tempo necessário para maximizar a tela e iniciar o programa
pause(0.00001);

%Comandos para maximização da tela
frame_h = get(handle(hObject),'JavaFrame');
set(frame_h,'Maximized',1);


%%%INÍCIO DOS OBJETOS%%%

% --- Executes on selection change in airplane_category.
function airplane_category_Callback(hObject, eventdata, handles)
% hObject    handle to airplane_category (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns airplane_category contents as cell array
%        contents{get(hObject,'Value')} returns selected item from airplane_category

%Wing
set(handles.checkbox_aspect_ratio,'Value',0)
set(handles.aspect_ratio_answer,'enable','off')
set(handles.checkbox_lambda,'Value',0)
set(handles.lambda_answer,'enable','off')

handles.selected_category = get(handles.airplane_category,'Value');

%Horizontal Tail
set(handles.aspect_ratio_HT_answer,'enable','off')
set(handles.lambda_HT_answer,'enable','off')

%Vertical Tail
set(handles.aspect_ratio_VT_answer,'enable','off')
set(handles.lambda_VT_answer,'enable','off')

%Polar de arrasto
set(handles.checkbox_swet_sref,'Value',0)
set(handles.swet_sref_answer,'enable','off')

% if handles.selected_category == 1 %Planador
%     handles.AR = 19.8;   handles.lambda = 0.2;
%     handles.AR_ht = 3.5; handles.lambda_ht = 0.2;
%     handles.Vht = 0.50;
%     handles.AR_vt = 1.1; handles.lambda_vt = 0.2;
%     handles.Vvt = 0.020;
%     
%     handles.Swet_Sref = 4.0; handles.a_wet = 0.9205; handles.C_wet = 0.4760;
%     
%     %Estimativa de Constantes da Eq. Empírica para Fração de Peso Vazio
%     handles.a_weight_est = 2.743; handles.C_weight_est = -0.187;
%     handles.W1_W0 = 1.000; handles.W2_W1 = 1.000; handles.W4_W3 = 1.000; handles.W6_W5 = 1.000;
%     
%     %Estimativa da Carga Alar de Decolagem
%     handles.a_wingload = 0.808; handles.C_wingload = 0.721;
%     handles.W_S = 370; %[N/m²]
%     
%     %Constantes Empíricas p/ Distância de Aterrissagem
%     handles.a_landing_sem_obst = 0.878;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     %Estimativa das Constantes da Eq. para Comprimento da Fuselagem
%     handles.a_fuselagem = 2.1763; handles.C_fuselagem = 0.1437;
%     
%     %Estimativa das Proporções Geométricas para Superfícies de Controle
%     handles.rAW = 0.07; handles.rProf = 0.29; handles.rLeme = 0.43;
%     
%     %Estimativa do Posicionamento do Trem de Pouso em Aeronaves
%     handles.rTP = 0.11;
%     
%     %Estimativa do Posicionamento do Grupo Moto-Propulsor em Aeronaves
%     handles.Yeng_in = 0;
%     
%     %Fatores de Inércia Empíricos para os Mom. Inércia de Aeronaves
%     handles.Rx = 0.28; handles.Ry = 0.34; handles.Rz = 0.44;
%     
%     
% elseif handles.selected_category == 2 %Moto-Planador
%     handles.AR = 21.2;   handles.lambda = 0.2;
%     handles.AR_ht = 3.5; handles.lambda_ht = 0.2;
%     handles.Vht = 0.50;
%     handles.AR_vt = 1.1; handles.lambda_vt = 0.2; 
%     handles.Vvt = 0.020;
%     
%     handles.Swet_Sref = 4.0; handles.a_wet = 0.9205; handles.C_wet = 0.4760;
% 
%     handles.a_weight_est = 1.372; handles.C_weight_est = -0.093;
%     handles.W1_W0 = 0.998; handles.W2_W1 = 0.995; handles.W4_W3 = 1.000; handles.W6_W5 = 1.000;  
%     
%     handles.a_wingload = 5.809; handles.C_wingload = 0.487;
%     handles.W_S = 380;
%     
%     handles.a_landing_sem_obst = 0.869;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     handles.a_fuselagem = 2.1763; handles.C_fuselagem = 0.1437;
%     
%     handles.rAW = 0.07; handles.rProf = 0.29; handles.rLeme = 0.43;
%    
%     handles.rTP = 0.11; handles.rTS = 0.95;
%     
%     handles.Yeng_in = 0;
%     
%     handles.Rx = 0.28; handles.Ry = 0.34; handles.Rz = 0.44;
%     
% elseif handles.selected_category == 3 %Ultraleve ou homebuilt
%     handles.AR = 6.4;    handles.lambda = 0.5; 
%     handles.AR_ht = 3.2; handles.lambda_ht = 0.5;
%     handles.Vht = 0.50;
%     handles.AR_vt = 1.3; handles.lambda_vt = 0.3; 
%     handles.Vvt = 0.020;
%     
%     handles.Swet_Sref = 3.0; handles.a_wet = 0.8412; handles.C_wet = 0.4319;
%     
%     handles.a_weight_est = 0.731; handles.C_weight_est = -0.035;
%     handles.W1_W0 = 0.994; handles.W2_W1 = 0.995; handles.W4_W3 = 0.995; handles.W6_W5 = 0.995;
%     
%     handles.a_wingload = 0.049; handles.C_wingload = 1.060;
%     handles.W_S = 430;
%     
%     handles.a_landing_sem_obst = 1.136;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     handles.a_fuselagem = 0.4431; handles.C_fuselagem = 0.3063;
%     
%     handles.rAW = 0.06; handles.rProf = 0.38; handles.rLeme = 0.39;
%     
%     handles.Rx = 0.25; handles.Ry = 0.3; handles.Rz = 0.4; %DADOS SEM ESTATÍSTICAS
    
if handles.selected_category == 1 %Geral e Utilitária Monomotora a Pistão
    handles.AR = 7.2;    handles.lambda = 0.5;
    
    handles.Swet_Sref = 4.5; handles.a_wet = 0.6762; handles.C_wet = 0.4884;

    handles.a_weight_est = 0.892; handles.C_weight_est = -0.047;
    handles.W1_W0 = 0.990; handles.W2_W1 = 0.992; handles.W4_W3 = 0.993; handles.W6_W5 = 0.993;
    
    handles.a_wingload = 0.408; handles.C_wingload = 0.804;
    handles.W_S = 760;
    
    handles.sep_W = 0.167; 
    handles.a_PW = 0.0116; handles.C_PW = 0.4789;
    
    handles.a_Tsep = 33.19; handles.C_Tsep = -0.122;
    
    set(handles.qtd_motores_answer,'enable','off','String','1')
    
    handles.a_TOPprop_balanceada = 8.23; handles.a_TOPprop_50ft = 9.30;
    
    handles.a_landing_50ft = 1.524;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.4088; handles.C_fuselagem = 0.3140;
    
    handles.rAW = 0.07; handles.rProf = 0.41; handles.rLeme = 0.36;
    
    handles.Yeng_in = 0;
    
    handles.Rx = 0.25; handles.Ry = 0.38; handles.Rz = 0.39;
    
elseif handles.selected_category == 2 %Geral e Utilitária Monotora turbo-hélice
    handles.AR = 8.4;    handles.lambda = 0.5;    
    
    handles.Swet_Sref = 5.5; handles.a_wet = 0.6762; handles.C_wet = 0.4884;
    
    handles.a_weight_est = 0.892; handles.C_weight_est = -0.047;
    handles.W1_W0 = 0.990; handles.W2_W1 = 0.992; handles.W4_W3 = 0.993; handles.W6_W5 = 0.993;
    
    handles.a_wingload = 0.408; handles.C_wingload = 0.804;
    handles.W_S = 1720;
    
    handles.sep_W = 0.264; 
    handles.a_PW = 0.0030; handles.C_PW = 0.7255;
    
    handles.a_Tsep = 21.58; handles.C_Tsep = -0.052;
    
    set(handles.qtd_motores_answer,'enable','off','String','1')
    
    handles.a_TOPprop_balanceada = 8.23; handles.a_TOPprop_50ft = 9.30;
    
    handles.a_landing_50ft = 1.524;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.4088; handles.C_fuselagem = 0.3140;
    
    handles.rAW = 0.07; handles.rProf = 0.41; handles.rLeme = 0.36;
    
    handles.Yeng_in = 0;
    
    handles.Rx = 0.25; handles.Ry = 0.38; handles.Rz = 0.39;
    
elseif handles.selected_category == 3 %Geral e Utilitária Multimotora a pistão
    handles.AR = 7.8;    handles.lambda = 0.5; 
    
    handles.Swet_Sref = 4.0; handles.a_wet = 0.2933; handles.C_wet = 0.5632;
    
    handles.a_weight_est = 0.766; handles.C_weight_est = -0.020;
    handles.W1_W0 = 0.984; handles.W2_W1 = 0.990; handles.W4_W3 = 0.992; handles.W6_W5 = 0.992;
    
    handles.a_wingload = 1.512; handles.C_wingload = 0.664;
    handles.W_S = 1260;
    
    set(handles.qtd_motores_answer,'enable','on','String','')
    
    handles.sep_W = 0.206; 
    handles.a_PW = 0.0116; handles.C_PW = 0.4789;
    
    handles.a_Tsep = 23.13; handles.C_Tsep = -0.089;
    
    handles.a_TOPprop_balanceada = 9.68; handles.a_TOPprop_50ft = 10.51;
    
    handles.a_landing_50ft = 1.463;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.4088; handles.C_fuselagem = 0.3140;
    
    handles.rAW = 0.05; handles.rProf = 0.44; handles.rLeme = 0.38;

    handles.Yeng_in = 0.30;
    
    handles.Rx = 0.34; handles.Ry = 0.29; handles.Rz = 0.44;
    
elseif handles.selected_category == 4 %Geral e Utilitária Multimotor a turbo-hélice
    handles.AR = 9.1;    handles.lambda =0.5;  
    
    handles.Swet_Sref = 5.5; handles.a_wet = 0.2933; handles.C_wet = 0.5632;

    handles.a_weight_est = 0.766; handles.C_weight_est = -0.020;
    handles.W1_W0 = 0.981; handles.W2_W1 = 0.985; handles.W4_W3 = 0.985; handles.W6_W5 = 0.995;
    
    handles.a_wingload = 1.512; handles.C_wingload = 0.664;
    handles.W_S = 2100;
    
    handles.sep_W = 0.303; 
    handles.a_PW = 0.0030; handles.C_PW = 0.7255;
    
    handles.a_Tsep = 18.02; handles.C_Tsep = -0.048;
    
    set(handles.qtd_motores_answer,'enable','on','String','')
    
    handles.a_TOPprop_balanceada = 9.68; handles.a_TOPprop_50ft = 10.51;
    
    handles.a_landing_50ft = 1.463;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.4088; handles.C_fuselagem = 0.3140;
    
    handles.rTP = 0.52; handles.rTS = 0.17;
    
    handles.rAW = 0.05; handles.rProf = 0.44; handles.rLeme = 0.38;
    
    handles.Yeng_in = 0.34;
    
    handles.Rx = 0.34; handles.Ry = 0.29; handles.Rz = 0.44;
%     
% elseif handles.selected_category == 8 %Acrobática
%     handles.AR = 5.6;    handles.lambda =0.3; 
%     handles.AR_ht = 2.8; handles.lambda_ht = 0.3;
%     handles.Vht = 0.35;
%     handles.AR_vt = 1.2; handles.lambda_vt = 0.4; 
%     handles.Vvt = 0.030;
%     
%     handles.Swet_Sref = 3.0; handles.a_wet = 0.4581; handles.C_wet = 0.4899;
%     
%     handles.a_weight_est = 1.555; handles.C_weight_est = -0.095;
%     handles.W1_W0 = 0.990; handles.W2_W1 = 0.992; handles.W4_W3 = 0.993; handles.W6_W5 = 0.993;
%     
%     handles.a_wingload = 1.178; handles.C_wingload = 0.705;
%     handles.W_S = 700;
%     
%     handles.a_landing_sem_obst = 1.035;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     handles.a_fuselagem = 0.2650; handles.C_fuselagem = 0.3549;
%     
%     handles.rAW = 0.11; handles.rProf = 0.50; handles.rLeme = 0.50;
%     
%     handles.rTP = 0.0; handles.rTS = 0.97;
%     
%     handles.Rx = 0.25; handles.Ry = 0.38; handles.Rz = 0.39; %DADOS DA GERAL MONO A HÉLICE
%     
% elseif handles.selected_category == 9 %Agrícola
%     handles.AR = 6.9;    handles.lambda =0.5;
%     handles.AR_ht = 3.5; handles.lambda_ht = 0.5;
%     handles.Vht = 0.46;
%     handles.AR_vt = 1.4; handles.lambda_vt = 0.4; 
%     handles.Vvt = 0.028;
%     
%     handles.Swet_Sref = 4.0; handles.a_wet = 0.4658; handles.C_wet = 0.5326;
%     
%     handles.a_weight_est = 2.919; handles.C_weight_est = -0.167;
%     handles.W1_W0 = 0.987; handles.W2_W1 = 0.998; handles.W4_W3 = 0.998; handles.W6_W5 = 0.998;
%     
%     handles.a_wingload = 7.321; handles.C_wingload = 0.480;
%     handles.W_S = 990;
%     
%     handles.a_landing_sem_obst = 1.053;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     handles.a_fuselagem = 0.7888; handles.C_fuselagem = 0.2371;
%     
%     handles.rAW = 0.09; handles.rProf = 0.47; handles.rLeme = 0.53;
%     
%     handles.rTP = 0.03; handles.rTS = 0.96;
%     
%     handles.Rx = 0.25; handles.Ry = 0.38; handles.Rz = 0.39; %DADOS DA GERAL MONO A HÉLICE
%     
% elseif handles.selected_category == 10 %Anfíbia mono ou multimotora
%     handles.AR = 7.1;    handles.lambda = 0.5;
%     handles.AR_ht = 3.6; handles.lambda_ht = 0.5;
%     handles.Vht = 0.50;
%     handles.AR_vt = 1.6; handles.lambda_vt = 0.4; 
%     handles.Vvt = 0.060;
%     
%     handles.Swet_Sref = 4.0; handles.a_wet = 0.1458; handles.C_wet = 0.6708;
% 
%     handles.a_weight_est = 0.865; handles.C_weight_est = -0.032;
%     handles.W1_W0 = 0.978; handles.W2_W1 = 0.985; handles.W4_W3 = 0.990; handles.W6_W5 = 0.990;
%     
%     handles.a_wingload = 46.0; handles.C_wingload = 0.284;
%     handles.W_S = 1200;
%     
%     handles.a_landing_sem_obst = 1.062;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     handles.a_fuselagem = 0.2373; handles.C_fuselagem = 0.3752;
%     
%     handles.rAW = 0.06; handles.rProf = 0.42; handles.rLeme = 0.37;
%     
%     handles.rTP = 0.12; handles.rTS = 0.14;
%     
%     handles.Yeng_in = 0.32;
%     
%     handles.Rx = 0.25; handles.Ry = 0.32; handles.Rz = 0.41;
%     
% elseif handles.selected_category == 11 %Combate da 2a Guerra a hélice
%     handles.AR = 6.2;    handles.lambda = 0.5;
%     handles.AR_ht = 3.1; handles.lambda_ht = 0.5;
%     handles.Vht = 0.935; %Dado medio baseado no de treinamento a jato
%     handles.AR_vt = 0.9; handles.lambda_vt = 0.4; 
%     handles.Vvt = 0.064; %Dado medio baseado no de treinamento a jato
%     
%     handles.Swet_Sref = 4.0; handles.a_wet = 0.1015; handles.C_wet = 0.6365;
%     
%     handles.a_weight_est = 2.394; handles.C_weight_est = -0.117;
%     handles.W1_W0 =0.985 ; handles.W2_W1 =0.980 ; handles.W4_W3 = 0.990; handles.W6_W5 = 0.990;
%     
%     handles.a_wingload = 37.4; handles.C_wingload = 0.363;
%     handles.W_S = 2000;
%     
%     handles.a_landing_sem_obst = 1.061;
%     set(handles.aterris_sem,'Value',1,'enable','on')
%     set(handles.aterris_com_obst_50ft,'Value',0,'enable','off')
%     
%     handles.a_fuselagem = 0.2111; handles.C_fuselagem = 0.3592;
%     
%     handles.rAW = 0.08; handles.rProf = 0.24; handles.rLeme = 0.31; %Dados do treinamento a jato
%     
%     handles.rTP = 0.46; handles.rTS = 0.09; %Dados do treinamento a jato
%     
%     handles.Rx = 0.22; handles.Ry = 0.14; handles.Rz = 0.25; %Dados do treinamento a jato
%     
% elseif handles.selected_category == 12 %Treinamento a jato
%     handles.AR = 5.7;    handles.lambda = 0.3;
%     handles.AR_ht = 2.9; handles.lambda_ht = 0.5;
%     handles.Vht = 0.70;
%     handles.AR_vt = 0.9; handles.lambda_vt = 0.2; 
%     handles.Vvt = 0.060;
%     
%     handles.Swet_Sref = 6.0; handles.a_wet = 0.2977; handles.C_wet = 0.5423;
%     
%     handles.a_weight_est = 1.364; handles.C_weight_est = -0.079;
%     handles.W1_W0 = 0.970; handles.W2_W1 = 0.980; handles.W4_W3 = 0.990; handles.W6_W5 = 0.995;
%     
%     handles.a_wingload = 0.188; handles.C_wingload = 0.09;
%     handles.W_S = 2950;
%     
%     handles.a_landing_50ft = 0.834;
%     set(handles.aterris_sem,'Value',0,'enable','off')
%     set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
%     
%     handles.a_fuselagem = 0.6150; handles.C_fuselagem = 0.2647;
%     
%     handles.rAW = 0.08; handles.rProf = 0.24; handles.rLeme = 0.31;
%     
%     handles.rTP = 0.46; handles.rTS = 0.09;
%     
%     handles.Rx = 0.22; handles.Ry = 0.14; handles.Rz = 0.25;
%     
% elseif handles.selected_category == 13 %Combate a jato
%     handles.AR = 3.9;    handles.lambda = 0.3;   
%     handles.AR_ht = 2.5; handles.lambda_ht = 0.3;
%     handles.Vht = 0.40;
%     handles.AR_vt = 0.6; handles.lambda_vt = 0.2; 
%     handles.Vvt = 0.070;
%     
%     handles.Swet_Sref = 5.0; handles.a_wet = 0.0226; handles.C_wet = 0.7506;
% 
%     handles.a_weight_est = 2.388; handles.C_weight_est = -0.126;
%     handles.W1_W0 = 0.970; handles.W2_W1 = 0.930; handles.W4_W3 = 0.990; handles.W6_W5 = 0.995;
%     
%     handles.a_wingload = 12.3; handles.C_wingload = 0.482;
%     handles.W_S = 4730;
%     
%     handles.a_landing_50ft = 0.676;
%     set(handles.aterris_sem,'Value',0,'enable','off')
%     set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
%     
%     handles.a_fuselagem = 0.2683; handles.C_fuselagem = 0.3396;
%     
%     handles.rAW = 0.15; handles.rProf = 0.60; handles.rLeme = 0.32;
%     
%     handles.rTP = 0.75; handles.rTS = 0.34;
%     
%     handles.Rx = 0.23; handles.Ry = 0.38; handles.Rz = 0.52;
    
elseif handles.selected_category == 5 %Cargueiro ou bombardeiro militar a hélice
    handles.AR = 9.6;    handles.lambda = 0.5;  
    
    handles.Swet_Sref = 5.0; handles.a_wet = 0.0455; handles.C_wet = 0.7316;
    
    handles.a_weight_est = 3.013; handles.C_weight_est = -0.132;
    handles.W1_W0 = 0.975; handles.W2_W1 = 0.980; handles.W4_W3 = 0.990; handles.W6_W5 = 0.992;
    
    handles.a_wingload = 53.2; handles.C_wingload = 0.324;
    handles.W_S = 3430;
    
    handles.sep_W = 0.2495; %Valor medio entre pistão e turbo-hélice 
    handles.a_PW = 0.0414; handles.C_PW = 0.2771; %Valor médio entre pistão e turbo-hélice
    
    handles.a_Tsep = 40.14; handles.C_Tsep = -0.0875; %Valor médio entre pistão e turbo-hélice
    
    set(handles.qtd_motores_answer,'enable','on','String','')
    
    handles.a_TOPprop_balanceada = 6.67; handles.a_TOPprop_50ft = 6.94;
    
    handles.a_landing_50ft = 1.358;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.0576; handles.C_fuselagem = 0.4678; %VALOR ESTRANHO PARA a!!!!
    
    handles.rAW = 0.06; handles.rProf = 0.34; handles.rLeme = 0.34; %Valores médios entre bi e quadri motores a helice
    
    handles.rTP = 0.58; handles.rTS = 0.10;
    
    handles.Rx = 0.34; handles.Ry = 0.30; handles.Rz = 0.46; %VALORES ÚNICOS PARA BI E QUADRIMOTOR!
    
elseif handles.selected_category == 6 %Cargueiro ou bombardeiro militar a jato
    handles.AR = 7.3;    handles.lambda = 0.3; 
    
    handles.Swet_Sref = 5.5; handles.a_wet = 0.0455; handles.C_wet = 0.7316;
    
    handles.a_weight_est = 0.706; handles.C_weight_est = -0.034;
    handles.W1_W0 = 0.975; handles.W2_W1 = 0.980; handles.W4_W3 = 0.990; handles.W6_W5 = 0.992;
    
    handles.a_wingload = 91.5; handles.C_wingload = 0.288;
    handles.W_S = 5940;
    
    handles.a_landing_50ft = 0.830;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.0576; handles.C_fuselagem = 0.4678; %VALOR ESTRANHO PARA a!!!!
    
    handles.rTP = 0.49; handles.rTS = 0.10;
    
    handles.Rx = 0.34; handles.Ry = 0.30; handles.Rz = 0.46;%VALORES ÚNICOS PARA BI E QUADRIMOTOR!
    
elseif handles.selected_category == 7 %Transporte de passageiros a hélice
    handles.AR = 10.1;   handles.lambda = 0.5; 
    
    handles.Swet_Sref = 5.5; handles.a_wet = 0.0924; handles.C_wet = 0.6826;
    
    handles.a_weight_est = 0.713; handles.C_weight_est = -0.014;
    handles.W1_W0 = 0.970; handles.W2_W1 = 0.985; handles.W4_W3 = 0.985; handles.W6_W5 = 0.995;
    
    handles.a_wingload = 59.6; handles.C_wingload = 0.313;
    handles.W_S = 2600;
    
    handles.sep_W = 0.2335; %Valor medio entre pistão e turbo-hélice
    handles.a_PW = 0.0414; handles.C_PW = 0.2771; %Valor medio entre pistão e turbo-hélice
    
    handles.a_Tsep = 22.14; handles.C_Tsep = -0.0805; %Valor médio entre pistão e turbo-hélice
    
    set(handles.qtd_motores_answer,'enable','on','String','')
    
    handles.a_landing_50ft = 1.437;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.3115; handles.C_fuselagem = 0.3539;
    
    handles.rTP = 0.52; handles.rTS = 0.11;
    
    handles.rAW = 0.05; handles.rProf = 0.40; handles.rLeme = 0.40; %Valor medio entre bi e quadri motor
    
    handles.Rx = 0.22; handles.Ry = 0.34; handles.Rz = 0.38;
    
elseif handles.selected_category == 8 %Transporte de passageiros a jato
    handles.AR = 8.3;    handles.lambda = 0.3; 
    
    handles.Swet_Sref = 6.0; handles.a_wet = 0.0317; handles.C_wet = 0.7530;
 
    handles.a_weight_est = 1.385; handles.C_weight_est = -0.070;
    handles.W1_W0 = 0.970; handles.W2_W1 = 0.985; handles.W4_W3 = 0.985; handles.W6_W5 = 0.995;
    
    handles.a_wingload = 329.6; handles.C_wingload = 0.206;
    handles.W_S = 5600;
    
    handles.a_landing_50ft = 0.860;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')
    
    handles.a_fuselagem = 0.4546; handles.C_fuselagem = 0.3321;
    
    handles.rTP = 0.52; handles.rTS = 0.11;
    
elseif handles.selected_category == 9 %Executiva a jato
    handles.AR = 8.0;    handles.lambda = 0.3;  
    
    handles.Swet_Sref = 5.5; handles.a_wet = 0.0553; handles.C_wet = 0.6977;
    
    handles.a_weight_est = 0.786; handles.C_weight_est = -0.028;
    handles.W1_W0 = 0.980; handles.W2_W1 = 0.985; handles.W4_W3 = 0.990; handles.W6_W5 = 0.995;
    
    handles.a_wingload = 142.3; handles.C_wingload = 0.268;
    handles.W_S = 3470;
    
    handles.a_landing_50ft = 0.946;
    set(handles.aterris_sem,'Value',0,'enable','off')
    set(handles.aterris_com_obst_50ft,'Value',1,'enable','on')

    handles.a_fuselagem = 0.2260; handles.C_fuselagem = 0.3739;
    
    handles.rTP = 0.49; handles.rTS = 0.12;
    
    handles.Rx = 0.30; handles.Ry = 0.30; handles.Rz = 0.43;
    
end

% if handles.selected_category == 1 || handles.selected_category == 2 || handles.selected_category == 3 ...
%     || handles.selected_category == 8 || handles.selected_category == 9 || handles.selected_category == 10 ...
%     || handles.selected_category == 11 || handles.selected_category == 12 || handles.selected_category == 13
%     
%     set(handles.tail_type_listbox,'enable','off','Value',1)
% else
%     set(handles.tail_type_listbox,'enable','on')
% end
set(handles.tail_type_listbox,'enable','on')



% if handles.selected_category == 1 || handles.selected_category == 2 || handles.selected_category == 8 ...
%     || handles.selected_category == 9 || handles.selected_category == 10 || handles.selected_category == 11 ...
%     || handles.selected_category == 12 || handles.selected_category == 13 || handles.selected_category == 14 ...
%     || handles.selected_category == 15 || handles.selected_category == 17 || handles.selected_category == 18
%     
%     set(handles.landing_gear_type1,'enable','off','Value',1)
% else
%     set(handles.landing_gear_type1,'enable','on')
% end

if handles.selected_category == 5 || handles.selected_category == 6 ||...
        handles.selected_category == 8 || handles.selected_category == 9
    set(handles.landing_gear_type1,'enable','off','Value',1)
else
    set(handles.landing_gear_type1,'enable','on')
end

if handles.selected_category == 7 %Transp. Passageiros a Hélice
    set(handles.landing_gear_type1,'Visible','off')
    set(handles.landing_gear_type2,'Visible','on')
else
    set(handles.landing_gear_type1,'Visible','on')
    set(handles.landing_gear_type2,'Visible','off')
end


%Condição para prop, 'else' para jet
 if handles.selected_category == 1 || handles.selected_category == 2 || handles.selected_category == 3 ...
     || handles.selected_category == 4 || handles.selected_category == 5 || handles.selected_category == 7

    set(handles.engine_category_prop,'Visible','on')
    set(handles.engine_category,'Visible','off')
    
    set(handles.loiter_prop,'Visible','on')
    set(handles.cruise_prop,'Visible','on')
    set(handles.loiter,'Visible','off')
    set(handles.cruise,'Visible','off')
    
    set(handles.TSFC,'Visible','off')
    set(handles.TSFC_takeoff,'Visible','off')
    set(handles.TSFC_loiter,'Visible','off')
    set(handles.TSFC_cruise,'Visible','off')
    set(handles.SFC,'Visible','on')
    set(handles.SFC_takeoff,'Visible','on')
    set(handles.SFC_loiter,'Visible','on')
    set(handles.SFC_cruise,'Visible','on')
    set(handles.neta_h,'Visible','on')
    set(handles.neta_takeoff,'Visible','on')
    set(handles.neta_loiter,'Visible','on')
    set(handles.neta_cruise,'Visible','on')
    
    set(handles.qtd_blades,'Visible','on')
    set(handles.qtd_blades_answer,'enable','on','Visible','on')
    
    set(handles.empuxo_peso_popup,'Visible','off')
    if handles.selected_category == 7
        set(handles.prop_bi_quadri,'Visible','on')
    else
        set(handles.prop_bi_quadri,'Visible','off')
    end
    
    set(handles.dec_com_obst_35ft,'String','Com obstáculo de 50 ft')
    
    set(handles.T_por_engine,'Visible','off')
    set(handles.T_cruise,'Visible','off')
    set(handles.T_takeoff,'Visible','off')
    
    set(handles.sep_por_engine,'Visible','on')
    set(handles.sep_cruise,'Visible','on')
    set(handles.sep_takeoff,'Visible','on')
    
    set(handles.diametro_helice,'Visible','on')
    set(handles.diam_helice_answer,'Visible','on')
    
 else   %jets
    set(handles.engine_category_prop,'Visible','off')
    set(handles.engine_category,'Visible','on')
    
    set(handles.loiter_prop,'Visible','off')
    set(handles.cruise_prop,'Visible','off')
    set(handles.loiter,'Visible','on')
    set(handles.cruise,'Visible','on')
    
    set(handles.TSFC,'Visible','on')
    set(handles.TSFC_takeoff,'Visible','on')
    set(handles.TSFC_loiter,'Visible','on')
    set(handles.TSFC_cruise,'Visible','on')
    
    set(handles.SFC,'Visible','off')
    set(handles.SFC_takeoff,'Visible','off')
    set(handles.SFC_loiter,'Visible','off')
    set(handles.SFC_cruise,'Visible','off')
    
    set(handles.neta_h,'Visible','off')
    set(handles.neta_takeoff,'Visible','off')
    set(handles.neta_loiter,'Visible','off')
    set(handles.neta_cruise,'Visible','off')
    
    set(handles.qtd_blades,'Visible','off')
    set(handles.qtd_blades_answer,'enable','off','Visible','off','String',[])
        
    set(handles.dec_com_obst_35ft,'String','Com obstáculo de 35 ft')
    
    set(handles.empuxo_peso_popup,'Visible','on')
    set(handles.prop_bi_quadri,'Visible','off')
    
    set(handles.T_por_engine,'Visible','on')
    set(handles.T_cruise,'Visible','on')
    set(handles.T_takeoff,'Visible','on')
    
    set(handles.sep_por_engine,'Visible','off')
    set(handles.sep_cruise,'Visible','off')
    set(handles.sep_takeoff,'Visible','off')
    
    set(handles.diametro_helice,'Visible','off')
    set(handles.diam_helice_answer,'Visible','off')
    
 end


set(handles.envergadura_answer,'String',[])
set(handles.c_root_answer,'String',[])
set(handles.c_tip_answer,'String',[])
set(handles.mac_answer,'String',[])
set(handles.posicao_mac_answer,'String',[])

set(handles.HT_area_answer,'String',[])
set(handles.envergadura_HT_answer,'String',[])
set(handles.c_root_HT_answer,'String',[])
set(handles.c_tip_HT_answer,'String',[])
set(handles.mac_HT_answer,'String',[])
set(handles.posicao_mac_HT_answer,'String',[])

set(handles.VT_area_answer,'String',[])
set(handles.envergadura_VT_answer,'String',[])
set(handles.c_root_VT_answer,'String',[])
set(handles.c_tip_VT_answer,'String',[])
set(handles.mac_VT_answer,'String',[])
set(handles.posicao_mac_VT_answer,'String',[])

aspect_ratio_answer_Callback(hObject, eventdata, handles)
lambda_answer_Callback(hObject, eventdata, handles)

tail_type_listbox_Callback(hObject, eventdata, handles)

swet_sref_answer_Callback(hObject, eventdata, handles)
guidata(hObject,handles);


function aspect_ratio_answer_Callback(hObject, eventdata, handles)
% hObject    handle to aspect_ratio_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aspect_ratio_answer as text
%        str2double(get(hObject,'String')) returns contents of aspect_ratio_answer as a double
if get(handles.checkbox_aspect_ratio,'Value') == 0
    set(handles.aspect_ratio_answer,'String',handles.AR)
end
guidata(hObject,handles);


function lambda_answer_Callback(hObject, eventdata, handles)
% hObject    handle to lambda_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda_answer as text
%        str2double(get(hObject,'String')) returns contents of lambda_answer as a double

if get(handles.checkbox_lambda,'Value') == 0
    set(handles.lambda_answer,'String',handles.lambda)
end
guidata(hObject,handles);


% --- Executes on button press in checkbox_aspect_ratio.
function checkbox_aspect_ratio_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_aspect_ratio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_aspect_ratio

if get(handles.checkbox_aspect_ratio,'Value') == 1
    set(handles.aspect_ratio_answer,'enable','on')
    set(handles.aspect_ratio_HT_answer,'enable','on')
    set(handles.aspect_ratio_VT_answer,'enable','on')
else
    set(handles.aspect_ratio_answer,'enable','off')
    set(handles.aspect_ratio_HT_answer,'enable','off')
    set(handles.aspect_ratio_VT_answer,'enable','off')
end
guidata(hObject,handles);


% --- Executes on button press in checkbox_lambda.
function checkbox_lambda_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_lambda

if get(handles.checkbox_lambda,'Value') == 1
    set(handles.lambda_answer,'enable','on')
    set(handles.lambda_HT_answer,'enable','on')
    set(handles.lambda_VT_answer,'enable','on')
else
    set(handles.lambda_answer,'enable','off')
    set(handles.lambda_HT_answer,'enable','off')
    set(handles.lambda_VT_answer,'enable','off')
end

guidata(hObject,handles);


function envergadura_answer_Callback(hObject, eventdata, handles)
% hObject    handle to envergadura_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of envergadura_answer as text
%        str2double(get(hObject,'String')) returns contents of envergadura_answer as a double

%set(handles.envergadura_answer,'String',handles.envergadura);
guidata(hObject,handles);


function c_root_answer_Callback(hObject, eventdata, handles)
% hObject    handle to c_root_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_root_answer as text
%        str2double(get(hObject,'String')) returns contents of c_root_answer as a double
guidata(hObject,handles);


function mac_answer_Callback(hObject, eventdata, handles)
% hObject    handle to mac_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of mac_answer as text
%        str2double(get(hObject,'String')) returns contents of mac_answer as a double
guidata(hObject,handles);


function posicao_mac_answer_Callback(hObject, eventdata, handles)
% hObject    handle to posicao_mac_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of posicao_mac_answer as text
%        str2double(get(hObject,'String')) returns contents of posicao_mac_answer as a double
guidata(hObject,handles);


% --- Executes on selection change in tail_type.
function tail_type_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to tail_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns tail_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tail_type
handles.selected_HT_VT = get(handles.tail_type_listbox,'Value');

if strcmp(get(handles.tail_type_listbox,'enable'),'off') == 1
    set(handles.aspect_ratio_HT_answer,'String',handles.AR_ht)
    set(handles.lambda_HT_answer,'String',handles.lambda_ht)
    
    set(handles.aspect_ratio_VT_answer,'String',handles.AR_vt)
    set(handles.lambda_VT_answer,'String',handles.lambda_vt)
else
    set(handles.aspect_ratio_HT_answer,'String',[])
    set(handles.lambda_HT_answer,'String',[])
    if handles.selected_HT_VT == 1 %Cauda convencional
        if handles.selected_category == 1 %Geral e utilitária monomotor a pistão
            handles.AR_ht = 3.9;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.5;            handles.lambda_vt = 0.5;
            
            handles.Vht = 0.45; 
            handles.Vvt = 0.030;
            
        elseif handles.selected_category == 2 %Geral e utilitária monomotor a turbo-hélice
            handles.AR_ht = 3.9;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.5;            handles.lambda_vt = 0.5;
            
            handles.Vht = 0.45; 
            handles.Vvt = 0.030;
            
        elseif handles.selected_category == 3 %Geral e utilitária multimotor a pistão
            handles.AR_ht = 4.3;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.4;            handles.lambda_vt = 0.4;
            
            handles.Vht = 0.84; 
            handles.Vvt = 0.050;
            
        elseif handles.selected_category == 4 %Geral e utilitária multimotor a turbo-hélice
            handles.AR_ht = 4.3;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.4;            handles.lambda_vt = 0.4;
            
            handles.Vht = 0.84; 
            handles.Vvt = 0.050;
            
        elseif handles.selected_category == 5 %Cargueiro ou bombardeiro militar a hélice
            handles.AR_ht = 4.8;            handles.lambda_ht = 0.4;
            handles.AR_vt = 1.5;            handles.lambda_vt = 0.3;
            
        elseif handles.selected_category == 6 %Cargueiro ou bombardeiro militar a jato
            handles.AR_ht = 3.9;            handles.lambda_ht = 0.3;
            handles.AR_vt = 1.5;            handles.lambda_vt = 0.3;
            
        elseif handles.selected_category == 7 %Transporte de passageiros a hélice
            handles.AR_ht = 5.2;            handles.lambda_ht = 0.4;
            handles.AR_vt = 1.4;            handles.lambda_vt = 0.4;
            
        elseif handles.selected_category == 8 %Transporte de passageiros a jato
            handles.AR_ht = 4.3;            handles.lambda_ht = 0.3;
            handles.AR_vt = 1.6;            handles.lambda_vt = 0.3;
            
        elseif handles.selected_category == 9 %Executiva a jato
            handles.AR_ht = 4.6;            handles.lambda_ht = 0.4;
            handles.AR_vt = 1.6;            handles.lambda_vt = 0.3;
            
        end
    elseif handles.selected_HT_VT == 2 %Cauda em T
        if handles.selected_category == 1 %Geral e utilitária monomotor a pistão
            handles.AR_ht = 4.1;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.2;            handles.lambda_vt = 0.5;
            
            handles.Vht = 0.60;
            handles.Vvt = 0.030;
            
        elseif handles.selected_category == 2 %Geral e utilitária monomotor a turbo-hélice
            handles.AR_ht = 4.1;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.2;            handles.lambda_vt = 0.5;
            
            handles.Vht = 0.60;
            handles.Vvt = 0.030;
            
        elseif handles.selected_category == 3 %Geral e utilitária multimotor a pistão
            handles.AR_ht = 4.4;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.0;            handles.lambda_vt = 0.4;
            
            handles.Vht = 0.96;
            handles.Vvt = 0.071;
            
        elseif handles.selected_category == 4 %Geral e utilitária multimotor a turbo-hélice
            handles.AR_ht = 4.4;            handles.lambda_ht = 0.5;
            handles.AR_vt = 1.0;            handles.lambda_vt = 0.4;
            
            handles.Vht = 0.96;
            handles.Vvt = 0.071;
            
        elseif handles.selected_category == 5 %Cargueiro ou bombardeiro militar a hélice
            handles.AR_ht = 5;              handles.lambda_ht = 0.4;
            handles.AR_vt = 1.2;            handles.lambda_vt = 0.5;
        elseif handles.selected_category == 6 %Cargueiro ou bombardeiro militar a jato
            handles.AR_ht = 4.9;            handles.lambda_ht = 0.3;
            handles.AR_vt = 1.2;            handles.lambda_vt = 0.7;
        elseif handles.selected_category == 7 %Transporte de passageiros a hélice
            handles.AR_ht = 5.5;            handles.lambda_ht = 0.4;
            handles.AR_vt = 1.4;            handles.lambda_vt = 0.5;
        elseif handles.selected_category == 8 %Transporte de passageiros a jato
            handles.AR_ht = 4.4;            handles.lambda_ht = 0.3;
            handles.AR_vt = 1.0;            handles.lambda_vt = 0.5;
        elseif handles.selected_category == 9 %Executiva a jato
            handles.AR_ht = 4.8;            handles.lambda_ht = 0.4;
            handles.AR_vt = 1.0;            handles.lambda_vt = 0.5;
        end
    end
    set(handles.aspect_ratio_HT_answer,'String',handles.AR_ht)
    set(handles.lambda_HT_answer,'String',handles.lambda_ht)
    set(handles.aspect_ratio_VT_answer,'String',handles.AR_vt)
    set(handles.lambda_VT_answer,'String',handles.lambda_vt)
end
guidata(hObject,handles);


function aspect_ratio_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to aspect_ratio_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);


function lambda_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to lambda_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of lambda_HT_answer as text
%        str2double(get(hObject,'String')) returns contents of lambda_HT_answer as a double
guidata(hObject,handles);


function HT_area_answer_Callback(hObject, eventdata, handles)
% hObject    handle to HT_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of HT_area_answer as text
%        str2double(get(hObject,'String')) returns contents of HT_area_answer as a double
guidata(hObject,handles);


function c_tip_answer_Callback(hObject, eventdata, handles)
% hObject    handle to c_tip_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of c_tip_answer as text
%        str2double(get(hObject,'String')) returns contents of c_tip_answer as a double
guidata(hObject,handles);


% --- Executes on button press in calculate_wing_ht_vt_button.
function calculate_wing_ht_vt_button_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_wing_ht_vt_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.aspect_ratio_ht = str2num(get(handles.aspect_ratio_HT_answer,'String'));
handles.aspect_ratio_vt = str2num(get(handles.aspect_ratio_VT_answer,'String'));
handles.lambda_ht = str2num(get(handles.lambda_HT_answer,'String'));
handles.lambda_vt = str2num(get(handles.lambda_VT_answer,'String'));

Wo_kg = handles.W0_2_estimativa; %Em casos normais, w0 = MTOW
Wo_N = Wo_kg*handles.g;

handles.xL = handles.a_fuselagem*Wo_N^(handles.C_fuselagem);

% handles.lHT_xL = 0.40; %AUTOMATIZAR ESTE DADO!
% handles.lVT_xL = 0.40; %AUTOMATIZAR ESTE DADO!
handles.lHT_xL = str2double(get(handles.lvt_e_lht_answer,'String'))/100;
handles.lVT_xL = handles.lHT_xL;

handles.lHT = handles.lHT_xL*handles.xL;
handles.lVT = handles.lVT_xL*handles.xL;

%CÁLCULOS DA ASA
handles.AR_atualizado = str2double(get(handles.aspect_ratio_answer,'String'));
handles.lambda_atualizado = str2double(get(handles.lambda_answer,'String'));
handles.wing_area = str2double(get(handles.wing_area_emp_answer,'String'));
set(handles.wing_area_answer,'String',sprintf('%.2f',handles.wing_area));

handles.envergadura = sqrt(handles.AR_atualizado*handles.wing_area);
set(handles.envergadura_answer,'String',sprintf('%.2f',handles.envergadura))

handles.c_root = (2*handles.wing_area)/(handles.envergadura*(1+handles.lambda_atualizado));
set(handles.c_root_answer,'String',sprintf('%.2f',handles.c_root))

handles.mac = (2/3)*handles.c_root*((1+handles.lambda_atualizado+handles.lambda_atualizado^2)/(1+handles.lambda_atualizado));
set(handles.mac_answer,'String',sprintf('%.2f',handles.mac))

handles.posicao_mac = (handles.envergadura/6)*((1+2*handles.lambda_atualizado)/(1+handles.lambda_atualizado));
set(handles.posicao_mac_answer,'String',sprintf('%.2f',handles.posicao_mac))

handles.c_tip = handles.lambda_atualizado*handles.c_root;
set(handles.c_tip_answer,'String',sprintf('%.2f',handles.c_tip))

%CÁLCULO DAS EMPENAGENS ATRAVÉS DOS DADOS DA ASA
%Empenagem Horizontal
handles.ht_area = (handles.mac*handles.wing_area/handles.lHT)*handles.Vht;
set(handles.HT_area_answer,'String',sprintf('%.2f',handles.ht_area))

handles.envergadura_ht = sqrt(handles.aspect_ratio_ht*handles.ht_area);
set(handles.envergadura_HT_answer,'String',sprintf('%.2f',handles.envergadura_ht))

handles.c_root_ht = (2*handles.ht_area)/(handles.envergadura_ht*(1+handles.lambda_ht));
set(handles.c_root_HT_answer,'String',sprintf('%.2f',handles.c_root_ht))

handles.mac_ht = (2/3)*handles.c_root_ht*((1+handles.lambda_ht+handles.lambda_ht^2)/(1+handles.lambda_ht));
set(handles.mac_HT_answer,'String',sprintf('%.2f',handles.mac_ht))

handles.posicao_mac_ht = (handles.envergadura_ht/6)*((1+2*handles.lambda_ht)/(1+handles.lambda_ht));
set(handles.posicao_mac_HT_answer,'String',sprintf('%.2f',handles.posicao_mac_ht))

handles.c_tip_ht = handles.lambda_ht*handles.c_root;
set(handles.c_tip_HT_answer,'String',sprintf('%.2f',handles.c_tip_ht))

%Empenagem Vertical
handles.vt_area = (handles.envergadura*handles.wing_area/handles.lVT)*handles.Vvt;
set(handles.VT_area_answer,'String',sprintf('%.2f',handles.vt_area))

handles.envergadura_vt = sqrt(handles.aspect_ratio_vt*handles.vt_area);
set(handles.envergadura_VT_answer,'String',sprintf('%.2f',handles.envergadura_vt))

handles.c_root_vt = (2*handles.vt_area)/(handles.envergadura_vt*(1+handles.lambda_vt));
set(handles.c_root_VT_answer,'String',sprintf('%.2f',handles.c_root_vt))

handles.mac_vt = (2/3)*handles.c_root_vt*((1+handles.lambda_vt+handles.lambda_vt^2)/(1+handles.lambda_vt));
set(handles.mac_VT_answer,'String',sprintf('%.2f',handles.mac_vt))

handles.posicao_mac_vt = 2*(handles.envergadura_vt/6)*((1+2*handles.lambda_vt)/(1+handles.lambda_vt));
set(handles.posicao_mac_VT_answer,'String',sprintf('%.2f',handles.posicao_mac_vt))

handles.c_tip_vt = handles.lambda_vt*handles.c_root_vt;
set(handles.c_tip_VT_answer,'String',sprintf('%.2f',handles.c_tip_vt))


%CÁLCULO DAS SUPERFÍCIES PRIMÁRIAS DE CONTROLE DE VOO
handles.S_aleiron = handles.rAW*handles.wing_area;
set(handles.aileron_area_answer,'String',sprintf('%.2f',handles.S_aleiron));

handles.S_prof = handles.rProf*handles.ht_area;
set(handles.profundor_area_answer,'String',sprintf('%.2f',handles.S_prof));

handles.S_leme = handles.rLeme*handles.vt_area;
set(handles.leme_area_answer,'String',sprintf('%.2f',handles.S_leme));


%% POSICIONAMENTO:
% Empenagem Vertical:
% Escolheu-se o ponto de referência como o nariz da aeronave e que o bordo
% de fuga da raiz da emp. vertical estivesse no final da fuselagem. Assim:
sweepVT = handles.enflechamento*1.2;

if handles.selected_category == 1 || handles.selected_category == 2 || handles.selected_category == 3 ...
 || handles.selected_category == 4 || handles.selected_category == 5 || handles.selected_category == 7
    xTE_vt    = handles.xL - 0; %Para para prop
else
%     xTE_vt    = handles.xL - 2; %Bom para jet 
    xTE_vt    = handles.xL - 1; %Bom para jet 
    
end


xLE_vt           = xTE_vt - handles.c_root_vt;               % Posição do bordo de ataque da emp. vertical [m]
xAC_root_vt 	 = xLE_vt + 0.25*handles.c_root_vt;
xAC_vt = xAC_root_vt + handles.posicao_mac_vt*tand(sweepVT);  % Posição do bordo de ataque da CMA da emp. vertical [m]
xLEmac_vt        = xAC_vt - .25*handles.mac_vt;       % Posição do CA da CMA da emp. vertical [m]
xTEmac_vt        = xLEmac_vt + handles.mac_vt ;          % Posição do bordo de fuga da CMA da emp. vertical [m]

% Asa:
sweepW = handles.enflechamento;

xAC_w            = xAC_vt - handles.lVT;                  % Posição do CA da CMA da asa [m]
xLEmac_w         = xAC_w - .25*handles.mac;            % Posição do bordo de ataque da CMA da asa [m]
xTEmac_w  = xAC_w + .75*handles.mac;            % Posição do bordo de fuga da CMA da asa [m]
xAC_root_w = xAC_w - handles.posicao_mac*tand(sweepW);
xLE_w     = xAC_root_w - 0.25*handles.c_root;  % Posição do bordo de ataque da asa [m] 
xTE_w     = xLE_w + handles.c_root;                 % Posição do bordo de fuga da asa [m]

% Empenagem Horizontal:
% sweepHT = 35;
sweepHT = sweepW*1.2;

xAC_ht    = xAC_w + handles.lHT;                 % Posição do CA da CMA da emp. horizontal [m]
xLEmac_ht = xAC_ht - .25*handles.mac_ht;          % Posição do bordo de ataque da CMA da emp. horizontal [m]
xTEmac_ht = xAC_ht + .75*handles.mac_ht;          % Posição do bordo de fuga da CMA da emp. horizontal [m]
xAC_root_ht = xAC_ht - handles.posicao_mac_ht*tand(sweepHT);
xLE_ht    = xAC_root_ht - 0.25*handles.c_root_ht; % Posição do bordo de ataque da emp. horizontal [m]
xTE_ht    = xLE_ht + handles.c_root_ht;

% Trens de Pouso:
xTP       = handles.rTP*handles.mac + xLEmac_w;         % Posição do trem de pouso principal [m];
xTS       = handles.rTS*handles.xL;                      % Posição do trem de pouso secundário [m];

% Motores:

handles.n_engine = str2double(get(handles.qtd_motores_answer,'String'));

if handles.n_engine == 2 || handles.n_engine == 3
    Yeng_in   = handles.Yeng_in*handles.envergadura/2;

elseif handles.n_engine == 4
    Yeng_in   = handles.Yeng_in*handles.envergadura/2;
    Yeng_out  = handles.Yeng_out*handles.envergadura/2;

elseif handles.n_engine == 6
    Yeng_in     = handles.Yeng_in*handles.envergadura/2;
    Yeng_out    = handles.Yeng_out*handles.envergadura/2;  
    Yeng_out_6  = handles.Yeng_out6*handles.envergadura/2;    

elseif handles.n_engine == 8
    Yeng_in     = handles.Yeng_in*handles.envergadura/2;
    Yeng_out    = handles.Yeng_out*handles.envergadura/2;  
    Yeng_out_6  = handles.Yeng_out6*handles.envergadura/2;
    Yeng_out_8  = handles.Yeng_out8*handles.envergadura/2;
end

%% Momentos de Inércia da Aeronave [kg/m²]:
% Tabela {Slide 68 - Aula 07} **Motor nas asas**
Rx = handles.Rx;
Ry = handles.Ry;
Rz = handles.Rz;

Ixx = handles.envergadura^2*Wo_N*Rx^2/(4*handles.g); %[kg.m²]
Iyy = handles.xL^2*Wo_N*Ry^2/(4*handles.g); %[kg.m²]
Izz = (handles.envergadura^2+handles.xL)^2/4 * Wo_N*Rz^2/(4*handles.g); %[kg.m²]

%% Gráfico:
% Relações geométricas das dimensões da fuselagem {Slide 17 - Aula 08}
xLD = handles.xLD - 1.5; 
xND = handles.xND;
xTD = handles.xTD;
xL = handles.xL;

d = xL/xLD;

xT = d*xTD;
xN = d*xND;

xC = xL - xN - xT;

set(handles.diam_fuselagem_answer,'String',sprintf('%.2f',d))
set(handles.length_nariz_answer,'String',sprintf('%.2f',xN))
set(handles.length_cabine_answer,'String',sprintf('%.2f',xC))
set(handles.length_cauda_answer,'String',sprintf('%.2f',xT))

if handles.selected_category == 1 || handles.selected_category == 2 || handles.selected_category == 3 ...
 || handles.selected_category == 4 || handles.selected_category == 5 || handles.selected_category == 7
set(handles.diam_helice_answer,'String',sprintf('%.2f',handles.prop_diam))
end
%%
%Mudança de handles para variáveis locais para plotar tudo
crW = handles.c_root; ctW = handles.c_tip;
% xLE_w OK
bw = handles.envergadura; sweepW = handles.enflechamento;
diedW = handles.diedro_w;
crVT = handles.c_root_vt; ctVT = handles.c_tip_ht;
% xLE_vt OK
bVT = handles.envergadura_vt;
% sweepVT OK
crHT = handles.c_root_ht; ctHT = handles.c_tip_ht;
% xLE_ht OK
bHT = handles.envergadura_ht;
% sweepHT OK
% xN OK
% xC OK
% xT OK
% d OK

axes(handles.vista_tridimensional_plot)
% figure
PlotAsa(crW,ctW,xLE_w,0,0,bw,sweepW,sweepW,diedW,diedW,0,0,crVT,ctVT,xLE_vt,...
    bVT,sweepVT,crHT,ctHT,xLE_ht,bHT,sweepHT,xN,xC,xT,d)

axes(handles.vista_superior)
% figure
% subplot(3,1,1)
PlotAsa(crW,ctW,xLE_w,0,0,bw,sweepW,sweepW,diedW,diedW,0,0,crVT,ctVT,xLE_vt,...
    bVT,sweepVT,crHT,ctHT,xLE_ht,bHT,sweepHT,xN,xC,xT,d)
view(2)
title('Vista Superior','FontName','TimesNewRoman','FontSize',12,'FontWeight','bold')
% set(gca,'Units','Normalized','OuterPosition',[0.01 0.5 .5 .98])

axes(handles.vista_lateral)
% subplot(3,1,2)
% subplot(3,2,1)
PlotAsa(crW,ctW,xLE_w,0,0,bw,sweepW,sweepW,diedW,diedW,0,0,crVT,ctVT,xLE_vt,...
    bVT,sweepVT,crHT,ctHT,xLE_ht,bHT,sweepHT,xN,xC,xT,d)
view([0 0])
title('Vista Lateral','FontName','TimesNewRoman','FontSize',12,'FontWeight','bold')
% set(gca,'Units','Normalized','OuterPosition',[0.01 0.01 .5 0.5])

axes(handles.vista_frontal)
% subplot(3,1,3)
% subplot(3,3,1)
PlotAsa(crW,ctW,xLE_w,0,0,bw,sweepW,sweepW,diedW,diedW,0,0,crVT,ctVT,xLE_vt,...
    bVT,sweepVT,crHT,ctHT,xLE_ht,bHT,sweepHT,xN,xC,xT,d)
view([-90 0])
title('Vista Frontal','FontName','TimesNewRoman','FontSize',12,'FontWeight','bold')
% set(gca,'Units','Normalized','OuterPosition',[0.0 0.0 .98 0.98])


guidata(hObject,handles);


function envergadura_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to envergadura_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of envergadura_HT_answer as text
%        str2double(get(hObject,'String')) returns contents of envergadura_HT_answer as a double
guidata(hObject,handles);


function c_root_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to c_root_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_root_HT_answer as text
%        str2double(get(hObject,'String')) returns contents of c_root_HT_answer as a double
guidata(hObject,handles);


function mac_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to mac_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mac_HT_answer as text
%        str2double(get(hObject,'String')) returns contents of mac_HT_answer as a double
guidata(hObject,handles);


function posicao_mac_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to posicao_mac_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posicao_mac_HT_answer as text
%        str2double(get(hObject,'String')) returns contents of posicao_mac_HT_answer as a double
guidata(hObject,handles);


function c_tip_HT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to c_tip_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_tip_HT_answer as text
%        str2double(get(hObject,'String')) returns contents of c_tip_HT_answer as a double
guidata(hObject,handles);


function aspect_ratio_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to aspect_ratio_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aspect_ratio_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of aspect_ratio_VT_answer as a double
guidata(hObject,handles);


function lambda_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to lambda_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of lambda_VT_answer as a double
guidata(hObject,handles);


function VT_area_answer_Callback(hObject, eventdata, handles)
% hObject    handle to VT_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VT_area_answer as text
%        str2double(get(hObject,'String')) returns contents of VT_area_answer as a double
guidata(hObject,handles);


function envergadura_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to envergadura_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of envergadura_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of envergadura_VT_answer as a double
guidata(hObject,handles);


function mac_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to mac_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mac_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of mac_VT_answer as a double
guidata(hObject,handles);


function posicao_mac_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to posicao_mac_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of posicao_mac_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of posicao_mac_VT_answer as a double
guidata(hObject,handles);


function c_root_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to c_root_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_root_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of c_root_VT_answer as a double
guidata(hObject,handles);


function c_tip_VT_answer_Callback(hObject, eventdata, handles)
% hObject    handle to c_tip_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_tip_VT_answer as text
%        str2double(get(hObject,'String')) returns contents of c_tip_VT_answer as a double
guidata(hObject,handles);


%%%POLAR DE ARRASTO%%%
% --- Executes on selection change in ref_table_cfe.
function ref_table_cfe_Callback(hObject, eventdata, handles)
% hObject    handle to ref_table_cfe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ref_table_cfe contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ref_table_cfe
a = 1;
guidata(hObject,handles);

value_table_cfe = get(handles.ref_table_cfe,'Value');

if value_table_cfe == 1
    handles.cfe = 0.0150;
elseif value_table_cfe == 2
    handles.cfe = 0.0100;
elseif value_table_cfe == 3
    handles.cfe = 0.0080;
elseif value_table_cfe == 4
    handles.cfe = 0.0070;
elseif value_table_cfe == 5
    handles.cfe = 0.0055;
elseif value_table_cfe == 6
    handles.cfe = 0.0065;
elseif value_table_cfe == 7
    handles.cfe = 0.0040;
elseif value_table_cfe == 8
    handles.cfe = 0.0035;
elseif value_table_cfe == 9
    handles.cfe = 0.0045;
elseif value_table_cfe == 10
    handles.cfe = 0.0040;
elseif value_table_cfe == 11
    handles.cfe = 0.0035;
elseif value_table_cfe == 12
    handles.cfe = 0.0030;
elseif value_table_cfe == 13
    handles.cfe = 0.0015;
end

set(handles.cfe_answer,'String',handles.cfe)

function cfe_answer_Callback(hObject, eventdata, handles)
% hObject    handle to cfe_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cfe_answer as text
%        str2double(get(hObject,'String')) returns contents of cfe_answer as a double
guidata(hObject,handles);

function swet_sref_answer_Callback(hObject, eventdata, handles)
% hObject    handle to swet_sref_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of swet_sref_answer as text
%        str2double(get(hObject,'String')) returns contents of swet_sref_answer as a double
if get(handles.checkbox_swet_sref,'Value') == 0
    set(handles.swet_sref_answer,'String',handles.Swet_Sref)
end
guidata(hObject,handles);


% --- Executes on button press in checkbox_swet_sref.
function checkbox_swet_sref_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_swet_sref (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_swet_sref
if get(handles.checkbox_swet_sref,'Value') == 1
    set(handles.swet_sref_answer,'enable','on')
else
    set(handles.swet_sref_answer,'enable','off')
end
guidata(hObject,handles);


function eficiencia_answer_Callback(hObject, eventdata, handles)
% hObject    handle to eficiencia_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of eficiencia_answer as text
%        str2double(get(hObject,'String')) returns contents of eficiencia_answer as a double


function C_D0_answer_Callback(hObject, eventdata, handles)
% hObject    handle to C_D0_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of C_D0_answer as text
%        str2double(get(hObject,'String')) returns contents of C_D0_answer as a double


function k2_answer_Callback(hObject, eventdata, handles)
% hObject    handle to k2_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of k2_answer as text
%        str2double(get(hObject,'String')) returns contents of k2_answer as a double


% --- Executes on button press in calculate_cd0_k2.
function calculate_cd0_k2_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_cd0_k2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.C_D0_answer,'String',sprintf('%.4f',handles.new_CD0))

set(handles.k2_answer,'String',sprintf('%.4f',handles.k2))

%Gráfico polar de arrasto
handles.CL = 0:0.01:3;
handles.CD =  handles.new_CD0 + handles.k2*handles.CL.^2;
axes(handles.polar_arrasto_grafico)
plot (handles.CD,handles.CL,'linewidth',2); grid on; xlabel ('CD'); ylabel ('CL');
title('Polar de Arrasto')
guidata(hObject,handles);


% --- Executes on selection change in engine_category.
function engine_category_Callback(hObject, eventdata, handles)
% hObject    handle to engine_category (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns engine_category contents as cell array
%        contents{get(hObject,'Value')} returns selected item from engine_category
engine_selected = get(handles.engine_category,'Value');

set(handles.TSFC_takeoff,'String',[])
set(handles.TSFC_loiter,'String',[])
set(handles.TSFC_cruise,'String',[])

set(handles.SFC_takeoff,'String',[])
set(handles.SFC_loiter,'String',[])
set(handles.SFC_cruise,'String',[])

set(handles.neta_takeoff,'String',[])
set(handles.neta_loiter,'String',[])
set(handles.neta_cruise,'String',[])

if engine_selected == 1
    handles.TSFC_takeoff_estimated = 105.0;
    handles.TSFC_loiter_estimated = 123.8;
    handles.TSFC_cruise_estimated = 134.9;
    
elseif engine_selected == 2
    handles.TSFC_takeoff_estimated = 78.2;
    handles.TSFC_loiter_estimated = 97.0;
    handles.TSFC_cruise_estimated = 108.1;
    
elseif engine_selected == 3
    handles.TSFC_takeoff_estimated = 55.2;
    handles.TSFC_loiter_estimated = 74.0;
    handles.TSFC_cruise_estimated = 85.1;
    
elseif engine_selected == 4
    handles.TSFC_takeoff_estimated = 46.9;
    handles.TSFC_loiter_estimated = 65.7;
    handles.TSFC_cruise_estimated = 76.9;
    
elseif engine_selected == 5
    handles.TSFC_takeoff_estimated = 42.2;
    handles.TSFC_loiter_estimated = 61.0;
    handles.TSFC_cruise_estimated = 72.1;
    
elseif engine_selected == 6
    handles.TSFC_takeoff_estimated = 39.0;
    handles.TSFC_loiter_estimated = 57.7;
    handles.TSFC_cruise_estimated = 68.9;
    
elseif engine_selected == 7
    handles.TSFC_takeoff_estimated = 36.6;
    handles.TSFC_loiter_estimated = 55.3;
    handles.TSFC_cruise_estimated = 66.5;
    
elseif engine_selected == 8
    handles.TSFC_takeoff_estimated = 34.7;
    handles.TSFC_loiter_estimated = 53.4;
    handles.TSFC_cruise_estimated = 64.6;
    
elseif engine_selected == 9
    handles.TSFC_takeoff_estimated = 33.1;
    handles.TSFC_loiter_estimated = 51.9;
    handles.TSFC_cruise_estimated = 63.1;
    
elseif engine_selected == 10
    handles.TSFC_takeoff_estimated = 31.8;
    handles.TSFC_loiter_estimated = 50.6;
    handles.TSFC_cruise_estimated = 61.8;
    
elseif engine_selected == 11
    handles.TSFC_takeoff_estimated = 30.7;
    handles.TSFC_loiter_estimated = 49.5;
    handles.TSFC_cruise_estimated = 60.7;
    
elseif engine_selected == 12
    handles.TSFC_takeoff_estimated = 29.8;
    handles.TSFC_loiter_estimated = 48.5;
    handles.TSFC_cruise_estimated = 59.7;
    
end
    set(handles.TSFC_takeoff,'String',sprintf('%.1f',handles.TSFC_takeoff_estimated))
    set(handles.TSFC_loiter,'String',sprintf('%.1f',handles.TSFC_loiter_estimated))
    set(handles.TSFC_cruise,'String',sprintf('%.1f',handles.TSFC_cruise_estimated))
    
guidata(hObject,handles);


function TSFC_takeoff_Callback(hObject, eventdata, handles)
% hObject    handle to TSFC_takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of TSFC_takeoff as text
%        str2double(get(hObject,'String')) returns contents of TSFC_takeoff as a double


function TSFC_loiter_Callback(hObject, eventdata, handles)
% hObject    handle to TSFC_loiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of TSFC_loiter as text
%        str2double(get(hObject,'String')) returns contents of TSFC_loiter as a double


function TSFC_cruise_Callback(hObject, eventdata, handles)
% hObject    handle to TSFC_cruise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of TSFC_cruise as text
%        str2double(get(hObject,'String')) returns contents of TSFC_cruise as a double


% --- Executes on selection change in engine_category_prop.
function engine_category_prop_Callback(hObject, eventdata, handles)
% hObject    handle to engine_category_prop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns engine_category_prop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from engine_category_prop
engine_selected_prop = get(handles.engine_category_prop,'Value');

set(handles.TSFC_takeoff,'String',[])
set(handles.TSFC_loiter,'String',[])
set(handles.TSFC_cruise,'String',[])

set(handles.SFC_takeoff,'String',[])
set(handles.SFC_loiter,'String',[])
set(handles.SFC_cruise,'String',[])

set(handles.neta_takeoff,'String',[])
set(handles.neta_loiter,'String',[])
set(handles.neta_cruise,'String',[])

if engine_selected_prop == 1
    handles.SFC_takeoff_estimated = 0.16;
    handles.SFC_loiter_estimated = 0.17;
    handles.SFC_cruise_estimated = 0.18;
    
    handles.neta_takeoff_estimated = 70;
    handles.neta_loiter_estimated = 70;
    handles.neta_cruise_estimated = 70;
    
elseif engine_selected_prop == 2
    handles.SFC_takeoff_estimated = 0.16;
    handles.SFC_loiter_estimated = 0.17;
    handles.SFC_cruise_estimated = 0.18;
    
    handles.neta_takeoff_estimated = 80;
    handles.neta_loiter_estimated = 80;
    handles.neta_cruise_estimated = 80;
    
elseif engine_selected_prop == 3
    handles.SFC_takeoff_estimated = 0.17;
    handles.SFC_loiter_estimated = 0.18;
    handles.SFC_cruise_estimated = 0.19;
    
    handles.neta_takeoff_estimated = 80;
    handles.neta_loiter_estimated = 80;
    handles.neta_cruise_estimated = 80;
    
elseif engine_selected_prop == 4
    handles.SFC_takeoff_estimated = 0.18;
    handles.SFC_loiter_estimated = 0.20;
    handles.SFC_cruise_estimated = 0.22;
    
    handles.neta_takeoff_estimated = 80;
    handles.neta_loiter_estimated = 80;
    handles.neta_cruise_estimated = 80;
    
elseif engine_selected_prop == 5
    handles.SFC_takeoff_estimated = 0.21;
    handles.SFC_loiter_estimated = 0.23;
    handles.SFC_cruise_estimated = 0.25;
    
    handles.neta_takeoff_estimated = 80;
    handles.neta_loiter_estimated = 80;
    handles.neta_cruise_estimated = 80;
    
elseif engine_selected_prop == 6
    handles.SFC_takeoff_estimated = 0.20;
    handles.SFC_loiter_estimated = 0.22;
    handles.SFC_cruise_estimated = 0.24;
    
    handles.neta_takeoff_estimated = 80;
    handles.neta_loiter_estimated = 80;
    handles.neta_cruise_estimated = 80;
    
elseif engine_selected_prop == 7
    handles.SFC_takeoff_estimated = 0.25;
    handles.SFC_loiter_estimated = 0.27;
    handles.SFC_cruise_estimated = 0.29;
    
    handles.neta_takeoff_estimated = NaN;
    handles.neta_loiter_estimated = NaN;
    handles.neta_cruise_estimated = NaN;
    
elseif engine_selected_prop == 8
    handles.SFC_takeoff_estimated = 0.20;
    handles.SFC_loiter_estimated = 0.22;
    handles.SFC_cruise_estimated = 0.24;
    
    handles.neta_takeoff_estimated = 85;
    handles.neta_loiter_estimated = 85;
    handles.neta_cruise_estimated = 85;
end

    set(handles.SFC_takeoff,'String',sprintf('%.2f',handles.SFC_takeoff_estimated))
    set(handles.SFC_loiter,'String',sprintf('%.2f',handles.SFC_loiter_estimated))
    set(handles.SFC_cruise,'String',sprintf('%.2f',handles.SFC_cruise_estimated))
    
    set(handles.neta_takeoff,'String',handles.neta_takeoff_estimated)
    set(handles.neta_loiter,'String',handles.neta_loiter_estimated)
    set(handles.neta_cruise,'String',handles.neta_cruise_estimated)

guidata(hObject,handles);


function SFC_takeoff_Callback(hObject, eventdata, handles)
% hObject    handle to SFC_takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of SFC_takeoff as text
%        str2double(get(hObject,'String')) returns contents of SFC_takeoff as a double


function SFC_loiter_Callback(hObject, eventdata, handles)
% hObject    handle to SFC_loiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of SFC_loiter as text
%        str2double(get(hObject,'String')) returns contents of SFC_loiter as a double


function SFC_cruise_Callback(hObject, eventdata, handles)
% hObject    handle to SFC_cruise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of SFC_cruise as text
%        str2double(get(hObject,'String')) returns contents of SFC_cruise as a double


function neta_takeoff_Callback(hObject, eventdata, handles)
% hObject    handle to neta_takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of neta_takeoff as text
%        str2double(get(hObject,'String')) returns contents of neta_takeoff as a double


function neta_loiter_Callback(hObject, eventdata, handles)
% hObject    handle to neta_loiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of neta_loiter as text
%        str2double(get(hObject,'String')) returns contents of neta_loiter as a double


function neta_cruise_Callback(hObject, eventdata, handles)
% hObject    handle to neta_cruise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of neta_cruise as text
%        str2double(get(hObject,'String')) returns contents of neta_cruise as a double


function range_sem_reserva_answer_Callback(hObject, eventdata, handles)
% hObject    handle to range_sem_reserva_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of range_sem_reserva_answer as text
%        str2double(get(hObject,'String')) returns contents of range_sem_reserva_answer as a double


function velocidade_cruzeiro_answer_Callback(hObject, eventdata, handles)
% hObject    handle to velocidade_cruzeiro_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of velocidade_cruzeiro_answer as text
%        str2double(get(hObject,'String')) returns contents of velocidade_cruzeiro_answer as a double


function carga_paga_answer_Callback(hObject, eventdata, handles)
% hObject    handle to carga_paga_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of carga_paga_answer as text
%        str2double(get(hObject,'String')) returns contents of carga_paga_answer as a double


function tempo_comb_answer_Callback(hObject, eventdata, handles)
% hObject    handle to tempo_comb_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of tempo_comb_answer as text
%        str2double(get(hObject,'String')) returns contents of tempo_comb_answer as a double


function alternativa_answer_Callback(hObject, eventdata, handles)
% hObject    handle to alternativa_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of alternativa_answer as text
%        str2double(get(hObject,'String')) returns contents of alternativa_answer as a double


function tempo_espera_answer_Callback(hObject, eventdata, handles)
% hObject    handle to tempo_espera_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of tempo_espera_answer as text
%        str2double(get(hObject,'String')) returns contents of tempo_espera_answer as a double


function cond_cruzeiro_answer_Callback(hObject, eventdata, handles)
% hObject    handle to cond_cruzeiro_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of cond_cruzeiro_answer as text
%        str2double(get(hObject,'String')) returns contents of cond_cruzeiro_answer as a double


% --- Executes on button press in calculate_weight.
function calculate_weight_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_weight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Calculos da polar de arrasto
handles.cfe_atualizado = str2double(get(handles.cfe_answer,'String'));
handles.swet_sref_atualizado = str2double(get(handles.swet_sref_answer,'String'));

handles.CD0 = handles.cfe_atualizado*handles.swet_sref_atualizado;
% set(handles.C_D0_answer,'String',handles.CD0)

handles.eficiencia = 1/(1+str2double(get(handles.eficiencia_answer,'String')));

% handles.AR_atualizado = str2num(get(handles.aspect_ratio_answer,'String'));
handles.AR_atualizado = str2double(get(handles.aspect_ratio_answer,'String'));

handles.k2 = 1/(pi*handles.AR_atualizado*handles.eficiencia);
% set(handles.k2_answer,'String',sprintf('%.4f',handles.k2))

%%%CÁLCULO DE ALCANCE EQUIVALENTE%%%

%Passo 1: Estimar o acréscimo de alcance devido ao requisito de 10% do
%tempo de voo, ponderando o alcande pelo tempo médio de voo:


handles.Range_nominal = str2double(get(handles.range_sem_reserva_answer,'String'));
handles.V_cruzeiro = str2double(get(handles.velocidade_cruzeiro_answer,'String'));
handles.t_comb_reserva = str2double(get(handles.tempo_comb_answer,'String'));

handles.t_flight = handles.Range_nominal/handles.V_cruzeiro; %[hr] 

handles.t_extra = (handles.t_comb_reserva/100)*handles.t_flight; %[hr]

handles.Range_extra = handles.t_extra*handles.V_cruzeiro; %[km]


%Passo 2: calcular o alcance equivalente para fins de projeto conceitual
%com base nos acréscimos de alcance conforme requisitos regulamentares.
K = 1; %Aeronave com enflechamento fixo
handles.Range_alternativo = str2double(get(handles.alternativa_answer,'String'));

handles.Range_equivalente = handles.Range_nominal + handles.Range_extra + handles.Range_alternativo;


%%%CÁLCULO DE PESO DE DECOLAGEM DE AERONAVE A JATO
%1º PASSO: determinar a equação da fração de peso vazio operacional:

%Wempty_W0 = handles.a_weight_est*(W0^handles.C_weight_est)*K;

%2º PASSO: determinar as frações de peso em vôo de cruzeiro e em vôo
%de espera a partir do alcance desejado e da autonomia em espera regulamentar:

handles.Range_equivalente_meters = handles.Range_equivalente*1000; %[m]

handles.tempo_espera = str2double(get(handles.tempo_espera_answer,'String'));

handles.autonomia_espera = (handles.tempo_espera/60)*3600; %Autonomia em segundos


%3º PASSO: estimar a fração de peso de combustível com base nas frações
%de peso de combustível nas etapas de vôo de cruzeiro e de vôo de espera:
handles.value_airplane_cat = get(handles.airplane_category,'Value');

if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    handles.L_D_cruise = 3/(4*sqrt(3*handles.k2*handles.CD0));
    handles.TSFC_cruise_Ns = handles.TSFC_cruise_estimated/(1000*3600);

    handles.L_D_loiter = 1/(2*sqrt(handles.k2*handles.CD0));
    handles.TSFC_loiter_Ns = handles.TSFC_loiter_estimated/(1000*3600);

    handles.V_cruzeiro_ms = handles.V_cruzeiro/3.6;

    handles.W3W2 = exp((-handles.g*handles.Range_equivalente_meters* ...
        handles.TSFC_cruise_Ns)/(handles.V_cruzeiro_ms*handles.L_D_cruise));

    handles.W5W4 = exp((-handles.g*handles.autonomia_espera* ...
        handles.TSFC_loiter_Ns)/(handles.L_D_loiter));

    handles.Wfuel_W0 = 1-handles.W1_W0*handles.W2_W1*handles.W3W2* ...
        handles.W4_W3*handles.W5W4*handles.W6_W5;
else %Piston/Helice airplanes
    handles.L_D_cruise = 1/(2*sqrt(handles.k2*handles.CD0));
    handles.SFC_cruise_Ws = handles.SFC_cruise_estimated/(745.7*3600);
    
    handles.L_D_loiter = 3/(4*sqrt(3*handles.k2*handles.CD0));
    handles.SFC_loiter_Ws = handles.SFC_loiter_estimated/(745.7*3600); %kg/W.s
    
    handles.V_cruzeiro_ms = handles.V_cruzeiro/3.6;
    
    handles.W3W2 = exp((-handles.g*handles.Range_equivalente_meters* ...
        handles.SFC_cruise_Ws)/((handles.neta_cruise_estimated/100)*handles.L_D_cruise));

    handles.W5W4 = exp((-handles.g*handles.autonomia_espera*handles.V_cruzeiro_ms* ...
        handles.SFC_loiter_Ws)/((handles.neta_loiter_estimated/100)*handles.L_D_loiter));

    handles.Wfuel_W0 = 1-handles.W1_W0*handles.W2_W1*handles.W3W2* ...
        handles.W4_W3*handles.W5W4*handles.W6_W5; 
end

%%%------PRIMEIRA ESTIMATIVA DE PESO--------%%%
handles.Wpayload = 9.81*str2double(get(handles.carga_paga_answer,'String'));

tol = 1e-3;
int1 = 0;
erro = 1;
W0_in = handles.Wpayload; %VALOR CHUTE;%52130*handles.g; 
% Peso total da aeronave estimado inicialmente com o peso estrutural do E-190
%+ Carga paga do nosso projeto + 12000 kg de combustível(+/- 2*Wfuel do E-190)
i = 1;
while erro >= tol
    int1 = int1+1;
    W0_iterativo_armazenado(i) = W0_in;

    handles.Wempty_W0  = handles.a_weight_est*W0_in^handles.C_weight_est*K; % Relação experimental de Wempty/Wo

    W0   = handles.Wpayload/(1-handles.Wempty_W0-handles.Wfuel_W0);
    erro = abs(W0-W0_in);

    W0_in = W0;

    %Armazenando os valores
    handles.W0_estimado_armazenado(i) = W0;
    handles.Wempty_W0_armazenado(i) = handles.Wempty_W0;
    handles.erro_armazenado(i) = erro;

    i = i+1;
end

handles.W0_1_estimativa = W0/handles.g; %[MTOW]

handles.Wempty = handles.Wempty_W0*handles.W0_1_estimativa;

handles.Wfuel = handles.Wfuel_W0*handles.W0_1_estimativa;

%Setando os parâmetros
set(handles.W0_1_est_answer,'String',sprintf('%.1f',handles.W0_1_estimativa));
set(handles.Wempty_1_est_answer,'String',sprintf('%.1f',handles.Wempty));
set(handles.Wfuel_1_est_answer,'String',sprintf('%.1f',handles.Wfuel));

set(handles.iteracoes_1_est_answer,'String',i)

%%%INICIO DO CÁLCULO DA CARGA ALAR DE DECOLAGEM

%1º PASSO: calcular e estimar a carga alar de decolagem da aeronave 
%com base nas especificações da aeronave, na tabela de tendência e na equação empírica:

% handles.wing_area = str2double(get(handles.wing_area_answer,'String'));
% 
% 
% handles.MTOW_especificado_kg = str2double(get(handles.MTOW_declarado_answer,'String'));
% handles.MTOW_especificado_Nm2 = handles.MTOW_especificado_kg*9.81;
% handles.W_S_takeoff_especificado_Nm2 = handles.MTOW_especificado_Nm2/handles.wing_area;
% 
% handles.W_S_takeoff_tendencia_Nm2 = handles.W_S;
% handles.W_S_takeoff_tendencia_kg = handles.W_S_takeoff_tendencia_Nm2/handles.g;
% 
% handles.W_S_empirico_Nm2 = handles.a_wingload*(handles.MTOW_especificado_Nm2)^handles.C_wingload;
% handles.W_S_empirico_kg = handles.W_S_empirico_Nm2/handles.g;

%%%COMEÇANDO O CÁLCULO DA CARGA ALAR E AREA ALAR

handles.W0_1_est_N = handles.W0_1_estimativa*handles.g;

handles.W_S_1_est_emp = handles.a_wingload*(handles.W0_1_est_N)^handles.C_wingload;

handles.wing_area_emp = handles.W0_1_est_N/handles.W_S_1_est_emp;

%2º PASSO: recalcular a área molhada da aeronave e apresentar o novo valor do
%coeficiente de arrasto parasita.

handles.S_wet_emp = handles.a_wet*(handles.W0_1_est_N)^handles.C_wet;

handles.new_CD0 = handles.cfe_atualizado*(handles.S_wet_emp/handles.wing_area_emp);

%3º PASSO: determinar o peso médio em cruzeiro da aeronave e recalcular a
%eficiência aerodinâmica L/D de cruzeiro:
handles.new_W_cruise_kg = (2*handles.W0_1_estimativa - handles.Wfuel)/2;
handles.new_W_cruise_N = handles.new_W_cruise_kg*handles.g;

Flight_altitude_meters = convlength(str2double(get(handles.cond_cruzeiro_answer,'String')),'ft','m');
[~,~,~,rho_flight_level] = atmosisa(Flight_altitude_meters);

% rho_flight_level = 0.355;

handles.new_CL_cruise = 2*handles.new_W_cruise_N/(rho_flight_level*handles.wing_area_emp*handles.V_cruzeiro_ms^2);

handles.new_L_D_cruise = 1/((handles.new_CD0/handles.new_CL_cruise)+handles.k2*handles.new_CL_cruise);

%4º PASSO: estimar a fração de peso de combustível com base nas frações de
%peso de combustível nas etapas de vôo de cruzeiro e de vôo de espera:
if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    handles.TSFC_cruise_estimated_Ns = handles.TSFC_cruise_estimated/(1000*3600);
    
    handles.new_L_D_loiter = 1/(2*sqrt(handles.k2*handles.new_CD0));
%     handles.Range_nominal_m = handles.Range_nominal*1000;
%     MUDEI DE handles.Range_nominal_m PARA handles.Range_equivalente_meters;
    handles.TSFC_loiter_estimated_Ns = handles.TSFC_loiter_estimated/(1000*3600);

    handles.new_W3W2 = exp((-handles.g*handles.Range_equivalente_meters*handles.TSFC_cruise_estimated_Ns)/...
        (handles.V_cruzeiro_ms*handles.new_L_D_cruise));

    handles.new_W5W4 = exp((-handles.g*handles.autonomia_espera*handles.TSFC_loiter_estimated_Ns)/(handles.new_L_D_loiter));

    handles.new_Wfuel_W0 = 1 - handles.W1_W0*handles.W2_W1*handles.new_W3W2*handles.W4_W3*handles.new_W5W4*handles.W6_W5;
else %Helice / Turbo prop planes
    handles.SFC_cruise_estimated_Ws = handles.SFC_cruise_estimated/(745.7*3600);
    
    handles.new_L_D_loiter = 3/(4*sqrt(3*handles.k2*handles.new_CD0));
%     handles.Range_nominal_m = handles.Range_nominal*1000;
%     handles.Range_equivalente_meters = handles.Range_equivalente*1000;
    handles.SFC_loiter_estimated_Ws = handles.SFC_loiter_estimated/(745.7*3600); %kg/W.s
    
    handles.V_cruzeiro_ms = handles.V_cruzeiro/3.6;
    
    handles.new_W3W2 = exp((-handles.g*handles.Range_equivalente_meters*handles.SFC_cruise_estimated_Ws)/...
        ((handles.neta_cruise_estimated/100)*handles.new_L_D_cruise));

    handles.new_W5W4 = exp((-handles.g*handles.autonomia_espera*handles.V_cruzeiro_ms*handles.SFC_loiter_estimated_Ws)/...
        ((handles.neta_loiter_estimated/100)*handles.new_L_D_loiter));

    handles.new_Wfuel_W0 = 1 - handles.W1_W0*handles.W2_W1*handles.new_W3W2*handles.W4_W3*handles.new_W5W4*handles.W6_W5;
end

%5º PASSO: ITERAÇÕES

handles.Wpayload_3_est = 9.81*str2double(get(handles.carga_paga_answer,'String'));

tol = 1e-3;
int1 = 0;
erro = 1;
W0_in_3_est = handles.Wpayload_3_est; %VALOR CHUTE;%52130*handles.g;
% Peso total da aeronave estimado inicialmente com o peso estrutural do E-190 
%+ Carga paga do nosso projeto + 12000 kg de combustível(+/- 2*Wfuel do E-190)
i_3 = 1;
while erro >= tol
int1 = int1+1;
W0_iterativo_armazenado_2_est(i_3) = W0_in_3_est;

handles.Wempty_W0_3_est = handles.a_weight_est*W0_in_3_est^handles.C_weight_est*K; % Relação experimental de Wempty/Wo

W0_3_est = handles.Wpayload_3_est/(1-handles.Wempty_W0_3_est-handles.new_Wfuel_W0);
erro = abs(W0_3_est-W0_in_3_est);

W0_in_3_est = W0_3_est;

%Armazenando os valores
handles.W0_estimado_armazenado_3_est(i_3) = W0_3_est;
handles.Wempty_W0_armazenado_3_est(i_3) = handles.Wempty_W0_3_est;
handles.erro_armazenado_3_est(i_3) = erro;

i_3 = i_3+1;
end

handles.W0_3_estimativa = W0_3_est/handles.g; %[MTOW]

handles.Wempty_3_est = handles.Wempty_W0_3_est*W0_3_est;
handles.Wempty_3_est_kg = handles.Wempty_3_est/9.81;

handles.Wfuel_3_est = handles.new_Wfuel_W0*W0_3_est;
handles.Wfuel_3_est_kg = handles.Wfuel_3_est/9.81;

set(handles.W0_3_est_answer,'String',sprintf('%.1f',handles.W0_3_estimativa));
set(handles.Wempty_3_est_answer,'String',sprintf('%.1f',handles.Wempty_3_est_kg));
set(handles.Wfuel_3_est_answer,'String',sprintf('%.1f',handles.Wfuel_3_est_kg));

set(handles.iteracoes_3_est_answer,'String',i_3)

set(handles.wing_area_emp_answer,'String',sprintf('%.2f',handles.wing_area_emp));


%%%------TERCEIRA ESTIMATIVA DE PESO--------%%%
%%SLIDE 87 AULA 05

Flight_altitude_meters = convlength(str2double(get(handles.cond_cruzeiro_answer,'String')),'ft','m');
handles.W0_1_estimativa = handles.W0_3_estimativa; %!!!!!!!!!!!!
handles.W_cruise_kg = (2*handles.W0_1_estimativa - handles.Wfuel)/2;
handles.W_cruise_N = handles.W_cruise_kg*9.81;

[~,~,~,rho_flight_level] = atmosisa(Flight_altitude_meters);

% handles.rho_flight_level = 0.355;
handles.rho_flight_level = rho_flight_level;
% handles.wing_area = str2double(get(handles.wing_area_answer,'String'));

handles.wing_area_emp = str2double(get(handles.wing_area_emp_answer,'String'));

% handles.CL_cruise_2_est = 2*handles.W_cruise_N/(rho_flight_level*handles.wing_area_emp*handles.V_cruzeiro_ms^2);
handles.CL_cruise_2_est = handles.new_CL_cruise;

% handles.L_D_cruise_2_est = 1/((handles.CD0/handles.CL_cruise_2_est)+handles.k2*handles.CL_cruise_2_est);
handles.L_D_cruise_2_est = handles.new_L_D_cruise;

%2º/3º PASSO: estimar a fração de peso de combustível com base nas frações de peso de combustível nas etapas
%de vôo de cruzeiro e de vôo de espera:
if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    handles.W3W2_2_est = exp((-handles.g*handles.Range_equivalente_meters* ...
        handles.TSFC_cruise_Ns)/(handles.V_cruzeiro_ms*handles.L_D_cruise_2_est));

    handles.W5W4_2_est = exp((-handles.g*handles.autonomia_espera* ...
        handles.TSFC_loiter_Ns)/(handles.L_D_loiter));

    handles.Wfuel_W0_2_est = 1-handles.W1_W0*handles.W2_W1*handles.W3W2_2_est* ...
        handles.W4_W3*handles.W5W4_2_est*handles.W6_W5;
else
       
    handles.W3W2_2_est = exp((-handles.g*handles.Range_equivalente_meters* ...
        handles.SFC_cruise_Ws)/((handles.neta_cruise_estimated/100)*handles.L_D_cruise_2_est));

    handles.W5W4_2_est = exp((-handles.g*handles.autonomia_espera*handles.V_cruzeiro_ms* ...
        handles.SFC_loiter_Ws)/((handles.neta_loiter_estimated/100)*handles.L_D_loiter));

    handles.Wfuel_W0_2_est = 1-handles.W1_W0*handles.W2_W1*handles.W3W2_2_est* ...
        handles.W4_W3*handles.W5W4_2_est*handles.W6_W5; 
end
%ITERAÇÃO:
handles.Wpayload_2_est = 9.81*str2double(get(handles.carga_paga_answer,'String'));

tol = 1e-3;
int1 = 0;
erro = 1;
W0_in_2_est = handles.Wpayload_2_est; %VALOR CHUTE; %52130*handles.g; % Peso total da
%aeronave estimado inicialmente com o peso estrutural do E-190 + Carga paga do nosso projeto
%+ 12000 kg de combustível(+/- 2*Wfuel do E-190)
i_2 = 1;
while erro >= tol
int1 = int1+1;
W0_iterativo_armazenado_2_est(i_2) = W0_in_2_est;

handles.Wempty_W0_2_est  = handles.a_weight_est*W0_in_2_est^handles.C_weight_est*K; % Relação experimental de Wempty/Wo

W0_2_est = handles.Wpayload_2_est/(1-handles.Wempty_W0_2_est-handles.Wfuel_W0_2_est);
erro = abs(W0_2_est-W0_in_2_est);

W0_in_2_est = W0_2_est;

%Armazenando os valores
handles.W0_estimado_armazenado_2_est(i_2) = W0_2_est;
handles.Wempty_W0_armazenado_2_est(i_2) = handles.Wempty_W0_2_est;
handles.erro_armazenado_2_est(i_2) = erro;

i_2 = i_2+1;
end

handles.W0_2_estimativa = W0_2_est/handles.g; %[MTOW]

handles.Wempty_2_est = handles.Wempty_W0_2_est*W0_2_est;
handles.Wempty_2_est_kg = handles.Wempty_2_est/9.81;

handles.Wfuel_2_est = handles.Wfuel_W0_2_est*W0_2_est;
handles.Wfuel_2_est_kg = handles.Wfuel_2_est/9.81;
%%%FIM DA TERCEIRA ESTIMATIVA

set(handles.W0_2_est_answer,'String',sprintf('%.1f',handles.W0_2_estimativa));
set(handles.Wempty_2_est_answer,'String',sprintf('%.1f',handles.Wempty_2_est_kg));
set(handles.Wfuel_2_est_answer,'String',sprintf('%.1f',handles.Wfuel_2_est_kg));

set(handles.iteracoes_2_est_answer,'String',i_2)

% tail_type_listbox_Callback(@tail_type_listbox_Callback, eventdata, handles)
guidata(hObject,handles);


function W0_2_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to W0_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of W0_2_est_answer as text
%        str2double(get(hObject,'String')) returns contents of W0_2_est_answer as a double


function Wempty_1_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to Wempty_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wempty_1_est_answer as text
%        str2double(get(hObject,'String')) returns contents of Wempty_1_est_answer as a double


function Wempty_2_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to Wempty_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wempty_2_est_answer as text
%        str2double(get(hObject,'String')) returns contents of Wempty_2_est_answer as a double


function Wfuel_1_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to Wfuel_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wfuel_1_est_answer as text
%        str2double(get(hObject,'String')) returns contents of Wfuel_1_est_answer as a double


function Wfuel_2_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to Wfuel_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wfuel_2_est_answer as text
%        str2double(get(hObject,'String')) returns contents of Wfuel_2_est_answer as a double


function iteracoes_1_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to iteracoes_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of iteracoes_1_est_answer as text
%        str2double(get(hObject,'String')) returns contents of iteracoes_1_est_answer as a double


function iteracoes_2_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to iteracoes_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of iteracoes_2_est_answer as text
%        str2double(get(hObject,'String')) returns contents of iteracoes_2_est_answer as a double


function W0_3_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to W0_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of W0_3_est_answer as text
%        str2double(get(hObject,'String')) returns contents of W0_3_est_answer as a double


function Wempty_3_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to Wempty_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wempty_3_est_answer as text
%        str2double(get(hObject,'String')) returns contents of Wempty_3_est_answer as a double


function Wfuel_3_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to Wfuel_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of Wfuel_3_est_answer as text
%        str2double(get(hObject,'String')) returns contents of Wfuel_3_est_answer as a double


function iteracoes_3_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to iteracoes_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of iteracoes_3_est_answer as text
%        str2double(get(hObject,'String')) returns contents of iteracoes_3_est_answer as a double


function wing_area_emp_answer_Callback(hObject, eventdata, handles)
% hObject    handle to wing_area_emp_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of wing_area_emp_answer as text
%        str2double(get(hObject,'String')) returns contents of wing_area_emp_answer as a double


% --- Executes on selection change in empuxo_peso_popup.
function empuxo_peso_popup_Callback(hObject, eventdata, handles)
% hObject    handle to empuxo_peso_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns empuxo_peso_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from empuxo_peso_popup
handles.empuxo_peso_choose = get(handles.empuxo_peso_popup,'Value');
set(handles.qtd_motores_answer,'String',[],'enable','on')

valor_de_HT_VT = isfield(handles,'selected_HT_VT'); %1 caso exista e 0 caso não exista

if valor_de_HT_VT == 0
    msgbox('Clique no tipo de cauda desejada.')
end


% if handles.selected_HT_VT
% if handles.empuxo_peso_choose == 1 %Aeronave militar de treinamento monomotor a jato
%     handles.T_W = 0.35; handles.a_TW = 0.415; handles.C_TW = 0.869; handles.n_engine = 1;
% 
%     handles.a_TOPjet_35ft = 0.193;
%     set(handles.dec_com_obst_35ft,'Value',1,'enable','on')
%     set(handles.dec_balanceada,'Value',0,'enable','off')
% 
% elseif handles.empuxo_peso_choose == 2 %Aeronave militar de treinamento multimotor a jato
%     handles.T_W = 0.33; handles.a_TW = 0.415; handles.C_TW = 0.869;
%     
%     handles.a_TOPjet_35ft = 0.193;
%     set(handles.dec_com_obst_35ft,'Value',1,'enable','on')
%     set(handles.dec_balanceada,'Value',0,'enable','off')
% 
%     handles.Yeng_in = 0.08;
%     
% elseif handles.empuxo_peso_choose == 3 %Aeronave militar de combate monomotor a jato sem pós-queimador   
%     handles.T_W = 0.38; handles.a_TW = 0.418; handles.C_TW = 1.204; handles.n_engine = 1;
% 
%     handles.a_TOPjet_35ft = 0.193;
%     set(handles.dec_com_obst_35ft,'Value',1,'enable','on')
%     set(handles.dec_balanceada,'Value',0,'enable','off')
% 
% elseif handles.empuxo_peso_choose == 4 %Aeronave militar de combate monomotor a jato com pós-queimador
%     handles.T_W = 0.41; handles.a_TW = 0.425; handles.C_TW = 0.322; handles.n_engine = 1;
% 
%     handles.a_TOPjet_35ft = 0.193;
%     set(handles.dec_com_obst_35ft,'Value',1,'enable','on')
%     set(handles.dec_balanceada,'Value',0,'enable','off')
% 
% elseif handles.empuxo_peso_choose == 5 %Aeronave militar de combate multimotor a jato sem pós-queimador
%     handles.T_W = 0.52; handles.a_TW = 0.420; handles.C_TW = 1.289;
% 
%     handles.a_TOPjet_35ft = 0.193;
%     set(handles.dec_com_obst_35ft,'Value',1,'enable','on')
%     set(handles.dec_balanceada,'Value',0,'enable','off')
% 
%     handles.Yeng_in = 0.07;
%     
% elseif handles.empuxo_peso_choose == 6 %Aeronave militar de combate multimotor a jato com o pós-queimador
%     handles.T_W = 0.62; handles.a_TW = 0.521; handles.C_TW = 0.210;
% 
%     handles.a_TOPjet_35ft = 0.193;
%     set(handles.dec_com_obst_35ft,'Value',1,'enable','on')
%     set(handles.dec_balanceada,'Value',0,'enable','off')
% 
%     handles.Yeng_in = 0.07;
    
if handles.empuxo_peso_choose == 1 %Avião cargueiro ou bombardeiro militar bimotor a jato 
    handles.T_W = 0.30; handles.a_TW = 0.259; handles.C_TW = -0.283; handles.n_engine = 2;

    handles.a_TOPjet_35ft = 0.182; handles.a_TOPjet_balanceada = 0.282;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 6 %Carg ou Bomb militar a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 1.23;
            handles.Vvt = 0.089;
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 0.96;
            handles.Vvt = 0.088;                
        end
        handles.Yeng_in = 0.33;
        handles.Rx = 0.22; handles.Ry = 0.14; handles.Rz = 0.25;
    end
   
    handles.rAW = 0.04; handles.rProf = 0.30; handles.rLeme = 0.22;
    
elseif handles.empuxo_peso_choose == 2 %Cargueiro ou bombardeiro militar tri/quadrimotor a jato 
    handles.T_W = 0.27; handles.a_TW = 0.259; handles.C_TW = -0.283;

    handles.a_TOPjet_35ft = 0.196; handles.a_TOPjet_balanceada = 0.238;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 6 %Carg ou Bomb militar a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 0.88;
            handles.Vvt = 0.058;
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 0.98;
            handles.Vvt = 0.064;                
        end
        handles.Yeng_in = 0.36;
        handles.Yeng_out = 0.63;
    end
    
    handles.rAW = 0.04; handles.rProf = 0.30; handles.rLeme = 0.25;
    
elseif handles.empuxo_peso_choose == 3 %Cargueiro ou bombardeiro militar hexa/octamotor a jato
    handles.T_W = 0.23; handles.a_TW = 0.259; handles.C_TW = -.0283;

    handles.a_TOPjet_35ft = 0.197; handles.a_TOPjet_balanceada = 0.220;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 6 %Carg ou Bomb militar a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 0.88; %DADOS DO QUADRIMOTOR!
            handles.Vvt = 0.058; %DADOS DO QUADRIMOTOR!
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 0.98; %DADOS DO QUADRIMOTOR!
            handles.Vvt = 0.064; %DADOS DO QUADRIMOTOR!              
        end
        handles.Yeng_in = 0.23; %DADOS SEM REFERENCIA
        handles.Yeng_out = 0.43; %DADOS SEM REFERENCIA
        handles.Yeng_out6 = 0.63; %DADOS SEM REFERENCIA
        handles.Yeng_out8 = 0.83; %DADOS SEM REFERENCIA
    end
    
    handles.rAW = 0.04; handles.rProf = 0.30; handles.rLeme = 0.28; %Dados do quadrimotor
    
elseif handles.empuxo_peso_choose == 4 %Transporte de passageiros bimotor a jato
    handles.T_W = 0.31; handles.a_TW = 0.266; handles.C_TW = -0.788; handles.n_engine = 2;

    handles.a_TOPjet_35ft = 0.180; handles.a_TOPjet_balanceada = 0.278;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 8 %Transporte de passageiros a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 1.07;
            handles.Vvt = 0.077;
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 1.08;
            handles.Vvt = 0.093;             
        end
    handles.Yeng_in = 0.29;
    handles.Rx = 0.25; handles.Ry = 0.38; handles.Rz = 0.46;
    end
    
    handles.rAW = 0.03; handles.rProf = 0.27; handles.rLeme = 0.31;
    
elseif handles.empuxo_peso_choose == 5 %Aeronave de transporte de passageiros trimotor a jato 
    handles.T_W = 0.29; handles.a_TW = 0.207; handles.C_TW = -2.455; handles.n_engine = 3;

    handles.a_TOPjet_35ft = 0.198; handles.a_TOPjet_balanceada = 0.259;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 8 %Transporte de passageiros a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 0.97; %Media entre 2 e 4 motores
            handles.Vvt = 0.073; %Media entre 2 e 4 motores
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 1.025; %Media entre 2 e 4 motores
            handles.Vvt = 0.085; %Media entre 2 e 4 motores             
        end
    handles.Yeng_in = 0.21;
    handles.Rx = 0.28; handles.Ry = 0.355; handles.Rz = 0.455; %Média entre 2 e 4 motores
    end
    
    handles.rAW = 0.03; handles.rProf = 0.27; handles.rLeme = 0.22;
    
elseif handles.empuxo_peso_choose == 6 %Aeronave de transporte de passageiros quadrimotor a jato
    handles.T_W = 0.25; handles.a_TW = 0.243; handles.C_TW = -0.257; handles.n_engine = 4;

    handles.a_TOPjet_35ft = 0.198; handles.a_TOPjet_balanceada = 0.238;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 8 %Transporte de passageiros a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 0.87;
            handles.Vvt = 0.069;
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 0.97;
            handles.Vvt = 0.076;             
        end
    handles.Yeng_in = 0.37; handles.Yeng_out = 0.65;
    handles.Rx = 0.31; handles.Ry = 0.33; handles.Rz = 0.45;
    end
    
    handles.rAW = 0.03; handles.rProf = 0.27; handles.rLeme = 0.29;
    
elseif handles.empuxo_peso_choose == 7 %Aeronave executivo bimotor a jato
    handles.T_W = 0.35; handles.a_TW = 0.348; handles.C_TW = 0.020; handles.n_engine = 2;

    handles.a_TOPjet_35ft = 0.178; handles.a_TOPjet_balanceada = 0.176;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 9 %Executiva a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 0.80;
            handles.Vvt = 0.070;
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 0.77;
            handles.Vvt = 0.064;             
        end
        handles.Yeng_in = 0.19;
    end
    
    handles.rAW = 0.05; handles.rProf = 0.33; handles.rLeme = 0.32;
    
elseif handles.empuxo_peso_choose == 8 %Aeronave executivo trimotor a jato
    handles.T_W = 0.29; handles.a_TW = 0.348; handles.C_TW = 0.020; handles.n_engine = 3;

    handles.a_TOPjet_35ft = 0.178; handles.a_TOPjet_balanceada = 0.231;
    set(handles.dec_com_obst_35ft,'enable','on')
    set(handles.dec_balanceada,'enable','on')
    
    if handles.selected_category == 9 %Executiva a jato
        if handles.selected_HT_VT == 1 %Cauda convencional
            handles.Vht = 0.72;
            handles.Vvt = 0.059;
        elseif handles.selected_HT_VT == 2 %Cauda em T
            handles.Vht = 0.69; %Valor aproximado!
            handles.Vvt = 0.053; %Valor aproximado!             
        end
        handles.Yeng_in = 0.17;
    end
    
    handles.rAW = 0.05; handles.rProf = 0.26; handles.rLeme = 0.12;
    
end

% if handles.empuxo_peso_choose == 1 || handles.empuxo_peso_choose == 3 ... 
%     || handles.empuxo_peso_choose == 4 || handles.empuxo_peso_choose == 7 ...
%     || handles.empuxo_peso_choose == 10 || handles.empuxo_peso_choose == 11 ...
%     || handles.empuxo_peso_choose == 12 || handles.empuxo_peso_choose == 13 ...
%     || handles.empuxo_peso_choose == 14

if handles.empuxo_peso_choose == 1 || handles.empuxo_peso_choose == 4 ...
    || handles.empuxo_peso_choose == 5 || handles.empuxo_peso_choose == 6 ...
    || handles.empuxo_peso_choose == 7 || handles.empuxo_peso_choose == 8
    
    set(handles.qtd_motores_answer,'String',handles.n_engine,'enable','off')
end

guidata(hObject,handles);


% --- Executes on selection change in prop_bi_quadri.
function prop_bi_quadri_Callback(hObject, eventdata, handles)
% hObject    handle to prop_bi_quadri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns prop_bi_quadri contents as cell array
%        contents{get(hObject,'Value')} returns selected item from prop_bi_quadri
handles.prop_bi_quadri_choose = get(handles.prop_bi_quadri,'Value');
% set(handles.qtd_motores_answer,'String',[],'enable','on')

if handles.prop_bi_quadri_choose == 1
    set(handles.qtd_motores_answer,'enable','off','String','2')
    
    handles.a_TOPprop_balanceada = 11.58; handles.a_TOPprop_50ft = 17.57;
    
elseif handles.prop_bi_quadri_choose == 2
    set(handles.qtd_motores_answer,'enable','off','String','4')
    
    handles.a_TOPprop_balanceada = 11.56; handles.a_TOPprop_50ft = 13.82;
end

guidata(hObject,handles);


function qtd_motores_answer_Callback(hObject, eventdata, handles)
% hObject    handle to qtd_motores_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of qtd_motores_answer as text
%        str2double(get(hObject,'String')) returns contents of qtd_motores_answer as a double


function acres_fuel_answer_Callback(hObject, eventdata, handles)
% hObject    handle to acres_fuel_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of acres_fuel_answer as text
%        str2double(get(hObject,'String')) returns contents of acres_fuel_answer as a double


% --- Executes on button press in calculate_relacoes_desempenho.
function calculate_relacoes_desempenho_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_relacoes_desempenho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.MTOW_kg = str2double(get(handles.W0_2_est_answer,'String')); %Peso máximo de decolagem estimado
handles.MTOW_N = handles.MTOW_kg*handles.g;
handles.wing_area = str2double(get(handles.wing_area_emp_answer,'String'));

handles.W_S_takeoff_N = (handles.MTOW_N)/handles.wing_area;
handles.W_S_takeoff_kgm2 = handles.W_S_takeoff_N/handles.g;
%Carga alar, decolagem
set(handles.carga_alar_answer,'String',sprintf('%.2f',handles.W_S_takeoff_N));

handles.enflechamento = str2double(get(handles.enflechamento_answer,'String'));
handles.CL_max = str2double(get(handles.CL_max_answer,'String'));
handles.rho_decolagem = 1.225; %ISA-SL

%Velocidade de Stall
handles.V_stall_ms = sqrt(2*handles.W_S_takeoff_N/(handles.rho_decolagem*handles.CL_max));
handles.V_stall_km = handles.V_stall_ms*3.6;
set(handles.v_stall_answer,'String',sprintf('%.2f',handles.V_stall_km))

if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    %Razão Empuxo-Peso de Aeronave a Jato (Apenas Empuxo por eng na verdade)
    handles.total_thrust = handles.T_W*handles.MTOW_N;

    handles.numero_motores = str2double(get(handles.qtd_motores_answer,'String'));
    handles.T_per_engine = handles.total_thrust/handles.numero_motores;
    set(handles.T_por_engine_answer,'String',sprintf('%.2f',handles.T_per_engine/1000)); %[kN]
else %prop planes
    %Correlação entre T/W e E/W (Slide 86 aula 06)
    handles.total_sep = handles.sep_W*handles.MTOW_kg; %[shp]
    
    handles.numero_motores = str2double(get(handles.qtd_motores_answer,'String'));
    handles.sep_per_engine = handles.total_sep/handles.numero_motores;
    set(handles.T_por_engine_answer,'String',sprintf('%.2f',handles.sep_per_engine)); %[shp]
    
    %Razão Potência-Peso para Aeronave a Hélice
    
    handles.Tsep_ratio = handles.a_Tsep*handles.sep_per_engine^handles.C_Tsep; %[N/shp]
    handles.T_eng_prop = handles.Tsep_ratio*handles.sep_per_engine; %[kN]
    handles.TW_prop = (handles.T_eng_prop*handles.numero_motores)/handles.MTOW_N;
  
%     handles.n_blades = 4; %AUTOMATIZAR DEPOIS  
    handles.n_blades = str2double(get(handles.qtd_blades_answer,'String'));
    
    if handles.n_blades == 2
        handles.T_S0 = 1; %[kN/m²]
    elseif handles.n_blades == 3
        handles.T_S0 = 1.5; %[kN/m²]
    elseif handles.n_blades == 4
        handles.T_S0 = 2; %[kN/m²]
    elseif handles.n_blades > 4
        handles.T_S0 = 2.5; %[kN/m²]
    end
    
    handles.S0 = handles.T_eng_prop/(handles.T_S0*1000); %[m²]
    
    %Diametro da hélice
    handles.prop_diam = sqrt(4*handles.S0/pi);
end

%Cálculo entre Razões de Desempenho em Vôo de Cruzeiro
handles.Wfuel = str2double(get(handles.Wfuel_2_est_answer,'String'));

handles.Wcruise_kg = (2*handles.MTOW_kg - handles.Wfuel)/2;
handles.Wcruise_N = handles.Wcruise_kg*handles.g;

handles.CLcruise = 2*handles.Wcruise_N/(handles.rho_flight_level*handles.wing_area*handles.V_cruzeiro_ms^2);

handles.LDcruise = 1/((handles.new_CD0/handles.CLcruise)+handles.k2*handles.CLcruise);

%Cálculo da Razão Empuxo-peso(Potência-Peso) em Cruzeiro e o Empuxo(Potência) em Cruzeiro e Decolagem

if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    handles.TWcruise = 1/handles.LDcruise;
    handles.Tcruise = handles.TWcruise * handles.Wcruise_N;
    set(handles.T_cruise_answer,'String',sprintf('%.2f',handles.Tcruise/1000)); %[kN]

    handles.TWtakeoff = handles.T_W; %tabela empírica
    handles.Ttakeoff = handles.TWtakeoff*handles.MTOW_N;
    set(handles.T_takeoff_answer,'String',sprintf('%.2f',handles.Ttakeoff/1000)) % [kN]
else %prop planes
    handles.sepWcruise = (0.001341/(1/handles.g))*(handles.V_cruzeiro_ms/...
        ((handles.neta_cruise_estimated/100)*handles.LDcruise)); %[shp/kg]
    handles.sepcruise = handles.sepWcruise * handles.Wcruise_kg;

    set(handles.T_cruise_answer,'String',sprintf('%.2f',handles.sepcruise)); %[shp total]

    handles.sepWtakeoff = handles.sep_W; %tabela empírica
    handles.septakeoff = handles.sepWtakeoff*handles.MTOW_kg;
    set(handles.T_takeoff_answer,'String',sprintf('%.2f',handles.septakeoff)) % [shp total]
end


%Estimativa da Distância de Decolagem e Aterrissagem

%Decolagem

handles.CL_takeoff = handles.CL_max/1.44;

if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    if get(handles.dec_balanceada,'Value') == 1 %Decolagem sem obst
        handles.a_TOPjet = handles.a_TOPjet_balanceada;   
    elseif get(handles.dec_balanceada,'Value') == 0 %%Decolagem com obst
        handles.a_TOPjet = handles.a_TOPjet_35ft;
    end
    handles.TOPjet = handles.W_S_takeoff_N/(handles.rho_decolagem*handles.CL_takeoff*handles.TWtakeoff);    
    handles.R_T = handles.a_TOPjet*handles.TOPjet; 

else %prop
    if get(handles.dec_balanceada,'Value') == 1 %Decolagem sem obst
        handles.a_TOPprop = handles.a_TOPprop_balanceada;   
    elseif get(handles.dec_balanceada,'Value') == 0 %%Decolagem com obst
        handles.a_TOPprop = handles.a_TOPprop_50ft;
    end
    handles.TOPprop = handles.W_S_takeoff_N/...
        (handles.rho_decolagem*handles.CL_takeoff*(handles.sepWtakeoff/(handles.g*0.001341)));    
    handles.R_T = handles.a_TOPprop*handles.TOPprop;     

end

%Distância de Decolagem 
set(handles.dist_decolagem_answer,'String',sprintf('%.2f',handles.R_T));

%Aterrisagem
if get(handles.aterris_sem,'Value') == 1 %Aterrissagem sem obstáculo
    handles.a_landing = handles.a_landing_sem_obst;
elseif get(handles.aterris_sem,'Value') == 0 %%Aterrissagem com obst
    handles.a_landing = handles.a_landing_50ft;
end

%Distância de Aterrissagem
handles.W_S_landing_N = handles.MTOW_N/handles.wing_area;

handles.R_L = handles.a_landing*handles.W_S_landing_N/(handles.rho_decolagem*handles.CL_max);

set(handles.dist_aterrissagem_answer,'String',sprintf('%.2f',handles.R_L));

guidata(hObject,handles);


function v_stall_answer_Callback(hObject, eventdata, handles)
% hObject    handle to v_stall_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of v_stall_answer as text
%        str2double(get(hObject,'String')) returns contents of v_stall_answer as a double


function CL_max_answer_Callback(hObject, eventdata, handles)
% hObject    handle to CL_max_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of CL_max_answer as text
%        str2double(get(hObject,'String')) returns contents of CL_max_answer as a double


function enflechamento_answer_Callback(hObject, eventdata, handles)
% hObject    handle to enflechamento_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of enflechamento_answer as text
%        str2double(get(hObject,'String')) returns contents of enflechamento_answer as a double


function T_por_engine_answer_Callback(hObject, eventdata, handles)
% hObject    handle to T_por_engine_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T_por_engine_answer as text
%        str2double(get(hObject,'String')) returns contents of T_por_engine_answer as a double


function dist_decolagem_answer_Callback(hObject, eventdata, handles)
% hObject    handle to dist_decolagem_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dist_decolagem_answer as text
%        str2double(get(hObject,'String')) returns contents of dist_decolagem_answer as a double


function dist_aterrissagem_answer_Callback(hObject, eventdata, handles)
% hObject    handle to dist_aterrissagem_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of dist_aterrissagem_answer as text
%        str2double(get(hObject,'String')) returns contents of dist_aterrissagem_answer as a double


function T_cruise_answer_Callback(hObject, eventdata, handles)
% hObject    handle to T_cruise_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T_cruise_answer as text
%        str2double(get(hObject,'String')) returns contents of T_cruise_answer as a double


function T_takeoff_answer_Callback(hObject, eventdata, handles)
% hObject    handle to T_takeoff_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of T_takeoff_answer as text
%        str2double(get(hObject,'String')) returns contents of T_takeoff_answer as a double


function carga_alar_answer_Callback(hObject, eventdata, handles)
% hObject    handle to carga_alar_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of carga_alar_answer as text
%        str2double(get(hObject,'String')) returns contents of carga_alar_answer as a double


% --- Executes on button press in plot_pldrange.
function plot_pldrange_Callback(hObject, eventdata, handles)
% hObject    handle to plot_pldrange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ESTIMATIVA DE ALCANCE E DESEMPENHO DE CRUZEIRO
%CÁLCULO DE ALCANCE E DESEMPENHO DE CRUZEIRO DE AERONAVE A JATO

%Condição: Zero Payload, estimated fuel (Wpayload novo = 0) (Wo = Wfuel + Wempty)
handles.Wpayload_kg = handles.Wpayload/handles.g;

handles.W0_zero_payload = handles.MTOW_kg - handles.Wpayload_kg;

handles.W_cruise_zero_payload_kg = (2*handles.W0_zero_payload - handles.Wfuel)/2;
handles.W_cruise_zero_payload_N = handles.W_cruise_zero_payload_kg*handles.g;

handles.CLcruise_zero_payload = 2*handles.W_cruise_zero_payload_N/(handles.rho_flight_level* ...
    handles.wing_area*handles.V_cruzeiro_ms^2);

handles.LDcruise_zero_payload = 1/((handles.new_CD0/handles.CLcruise_zero_payload)+handles.k2*handles.CLcruise_zero_payload);

handles.Wempty_zero_payload = str2double(get(handles.Wempty_2_est_answer,'String'));

handles.W6_zero_payload_kg = handles.Wempty_zero_payload;

handles.W2_zero_payload = handles.W0_zero_payload*handles.W1_W0*handles.W2_W1;

handles.W3_zero_payload = handles.W6_zero_payload_kg*(1/handles.W6_W5)*(1/handles.W5W4)*(1/handles.W4_W3);

handles.W3W2_zero_payload = handles.W3_zero_payload/handles.W2_zero_payload;


if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    handles.Rtotal_zero_payload = (handles.V_cruzeiro_ms*abs(log(handles.W3W2_zero_payload))*handles.LDcruise_zero_payload)/ ...
        (handles.g*handles.TSFC_cruise_Ns);
else
    handles.Rtotal_zero_payload = (0.01*handles.neta_cruise_estimated*abs(log(handles.W3W2_zero_payload))*handles.LDcruise_zero_payload)/ ...
        (handles.g*handles.SFC_cruise_Ws);
end

handles.Rtotal_zero_payload_km = handles.Rtotal_zero_payload/1000; %Alcance com reservas


handles.Rnominal_zero_payload = handles.Rtotal_zero_payload_km - 0.1*handles.Rtotal_zero_payload_km - handles.Range_extra;


%Condição: Peso máximo de combustível e carga paga reduzida
handles.acres_comb = str2double(get(handles.acres_fuel_answer,'String'))/100;

%Acréscimo em relação ao MPLW
handles.Wpayload_ff_reducpld = (1-handles.acres_comb)*handles.Wpayload_kg;
% handles.Wfuel_ff_reducpld = handles.Wfuel + (1-handles.acres_comb)*handles.Wpayload_kg;
handles.Wfuel_ff_reducpld = handles.Wfuel + (handles.Wpayload_kg-handles.Wpayload_ff_reducpld);

%Acréscimo em relação ao Wfuel
% handles.Wfuel_ff_reducpld = handles.Wfuel + handles.acres_comb*handles.Wfuel;
% handles.Wpayload_ff_reducpld = handles.Wpayload_kg - (1-handles.acres_comb)*handles.Wfuel;

handles.W_cruise_ff_reducpld_kg = (2*handles.MTOW_kg - handles.Wfuel_ff_reducpld)/2;
handles.W_cruise_ff_reducpld_N = handles.W_cruise_ff_reducpld_kg*handles.g;

handles.CLcruise_ff_reducpld = 2*handles.W_cruise_ff_reducpld_N/(handles.rho_flight_level* ...
    handles.wing_area*handles.V_cruzeiro_ms^2);

handles.LDcruise_ff_reducpld = 1/((handles.new_CD0/handles.CLcruise_ff_reducpld)+handles.k2*handles.CLcruise_ff_reducpld);


handles.Wempty_ff_reducpld = str2double(get(handles.Wempty_2_est_answer,'String'));

handles.W6_ff_reducpld_kg = handles.Wempty_ff_reducpld + handles.Wpayload_ff_reducpld;

handles.W0_ff_reducpld_kg = handles.Wempty_ff_reducpld + handles.Wpayload_ff_reducpld + handles.Wfuel_ff_reducpld;

handles.W2_ff_reducpld_kg = handles.W0_ff_reducpld_kg*handles.W1_W0*handles.W2_W1;

handles.W3_ff_reducpld_kg = handles.W6_ff_reducpld_kg*(1/handles.W6_W5)*(1/handles.W5W4)*(1/handles.W4_W3);

handles.W3W2_ff_reducpld = handles.W3_ff_reducpld_kg/handles.W2_ff_reducpld_kg;

if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    handles.Rtotal_ff_reducpld = (handles.V_cruzeiro_ms*abs(log(handles.W3W2_ff_reducpld))*handles.LDcruise_ff_reducpld)/ ...
         (handles.g*handles.TSFC_cruise_Ns);
else %prop
    handles.Rtotal_ff_reducpld = (0.01*handles.neta_cruise_estimated*abs(log(handles.W3W2_ff_reducpld))*handles.LDcruise_ff_reducpld)/ ...
         (handles.g*handles.SFC_cruise_Ws);
end

handles.Rtotal_ff_reducpld_km = handles.Rtotal_ff_reducpld/1000; %alcance com reservas

handles.Rnominal_ff_reducpld_km = handles.Rtotal_ff_reducpld_km - 0.1*handles.Rtotal_ff_reducpld_km - handles.Range_extra;


% DIAGRAMA PAYLOAD-RANGE

%Ponto 4 do diagrama payload range:
Peso_fuel = handles.Wfuel_ff_reducpld; %(combustível no máximo)
Peso_payload = 0;
Peso_empty = handles.Wempty;
W6_p4 = Peso_empty + Peso_payload;
W0_p4 = W6_p4 + Peso_fuel;

W2_p4 = W0_p4*handles.W1_W0*handles.W2_W1;

W3_p4 = W6_p4*(1/handles.W6_W5)*(1/handles.W5W4)*(1/handles.W4_W3);

W3W2_p4 = W3_p4/W2_p4;

W_cruise_p4 = (2*W0_p4 - Peso_fuel)/2;
W_cruise_p4_N = W_cruise_p4*handles.g;

CLcruise_p4 = 2*W_cruise_p4_N/(handles.rho_flight_level* ...
    handles.wing_area*handles.V_cruzeiro_ms^2);

LDcruise_p4 = 1/((handles.new_CD0/CLcruise_p4)+handles.k2*CLcruise_p4);

if handles.value_airplane_cat == 6 || handles.value_airplane_cat == 8 || handles.value_airplane_cat == 9 %Jet airplanes
    Rtotal_p4 = (handles.V_cruzeiro_ms*abs(log(W3W2_p4))*LDcruise_p4)/ ...
         (handles.g*handles.TSFC_cruise_Ns);
else
    Rtotal_p4 = (0.01*handles.neta_cruise_estimated*abs(log(W3W2_p4))*LDcruise_p4)/ ...
     (handles.g*handles.SFC_cruise_Ws);
end
%Alcance com reservas
Rtotal_p4_km = Rtotal_p4/1000; 

%Alcance sem reservas
Rnominal_p4_km = Rtotal_p4_km - 0.1*Rtotal_p4_km - handles.Range_extra;

%Posições dos pontos 1, 2 3 e 4
x1 = 0;
y1 = handles.Wpayload_kg;

x2 = handles.Range_equivalente;
y2 = handles.Wpayload_kg;

x3 = handles.Rtotal_ff_reducpld_km;
y3 = handles.Wpayload_ff_reducpld;

handles.Rtotal_p4_km = Rtotal_p4_km;

x4 = Rtotal_p4_km;
y4 = 0;

axes(handles.payload_range_grafico)
plot ([x1 x2 x3 x4],[y1 y2 y3 y4]); grid on; xlabel ('Range with Reserves [km]'); ylabel ('Payload weight [kg]');
xlim([0 x4+0.1*x4]);
ylim([0 y1+0.1*y1]);
title('Diagrama Payload-Range')

guidata(hObject,handles);


% --- Executes on button press in calculate_dimensions.
function calculate_dimensions_Callback(hObject, eventdata, handles)
% hObject    handle to calculate_dimensions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject,handles);


function wing_area_answer_Callback(hObject, eventdata, handles)
% hObject    handle to wing_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of wing_area_answer as text
%        str2double(get(hObject,'String')) returns contents of wing_area_answer as a double


% --- Executes on selection change in landing_gear_type1.
function landing_gear_type1_Callback(hObject, eventdata, handles)
% hObject    handle to landing_gear_type1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns landing_gear_type1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from landing_gear_type1
tipo_trem_de_pouso = get(handles.landing_gear_type1,'Value');


% if tipo_trem_de_pouso == 1  
% elseif tipo_trem_de_pouso == 2
% elseif tipo_trem_de_pouso == 3
% elseif tipo_trem_de_pouso == 4   
% end

% if handles.selected_category == 3 %Ultra-leve ou homebuilt
%     if tipo_trem_de_pouso == 1 %Convencional 
%        handles.rTP = 0; handles.rTS = 0.96;
%     elseif tipo_trem_de_pouso == 2 %Triciclo
%         handles.rTP = 0.6; handles.rTS = 0.12;
%     end
    
if handles.selected_category == 1 || handles.selected_category == 2 %Geral e Utilitária Monotora a Pistão/Turbo-hélice
    if tipo_trem_de_pouso == 1 %Convencional 
       handles.rTP = 0.03; handles.rTS = 0.96;
    elseif tipo_trem_de_pouso == 2 %Triciclo
        handles.rTP = 0.50; handles.rTS = 0.13;
    end
end
guidata(hObject,handles);


% --- Executes on selection change in landing_gear_type2.
function landing_gear_type2_Callback(hObject, eventdata, handles)
% hObject    handle to landing_gear_type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns landing_gear_type2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from landing_gear_type2
tipo_trem_de_pouso = get(handles.landing_gear_type2,'Value');

if handles.selected_category == 7 %Transporte de passageiros a hélice
    if tipo_trem_de_pouso == 1 %TdP na Fuselagem 
       handles.rTP = 0.52; handles.rTS = 0.1;
    elseif tipo_trem_de_pouso == 2 %TdP na Asa
        handles.rTP = 0.57; handles.rTS = 0.09;
    end
end
guidata(hObject,handles);


function aileron_area_answer_Callback(hObject, eventdata, handles)
% hObject    handle to aileron_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of aileron_area_answer as text
%        str2double(get(hObject,'String')) returns contents of aileron_area_answer as a double


function profundor_area_answer_Callback(hObject, eventdata, handles)
% hObject    handle to profundor_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of profundor_area_answer as text
%        str2double(get(hObject,'String')) returns contents of profundor_area_answer as a double


function leme_area_answer_Callback(hObject, eventdata, handles)
% hObject    handle to leme_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of leme_area_answer as text
%        str2double(get(hObject,'String')) returns contents of leme_area_answer as a double


% --- Executes on selection change in proporcoes_geometricas_listbox.
function proporcoes_geometricas_listbox_Callback(hObject, eventdata, handles)
% hObject    handle to proporcoes_geometricas_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns proporcoes_geometricas_listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from proporcoes_geometricas_listbox
cat_prop_geometricas = get(handles.proporcoes_geometricas_listbox,'Value');

if cat_prop_geometricas == 1
    handles.xLD = 8.2; handles.xND = 1.2; handles.xTD = 2.6;   
    
elseif cat_prop_geometricas == 2
    handles.xLD = 11.5; handles.xND = 1.7; handles.xTD = 2.8;  
    
elseif cat_prop_geometricas == 3
    handles.xLD = 10.8; handles.xND = 1.3; handles.xTD = 2.3;   
    
elseif cat_prop_geometricas == 4
    handles.xLD = 9.3; handles.xND = 1.4; handles.xTD = 3.0;   
    
elseif cat_prop_geometricas == 5
    handles.xLD = 8.3; handles.xND = 1.3; handles.xTD = 2.3;   
    
elseif cat_prop_geometricas == 6
    handles.xLD = 8.4; handles.xND = 1.8; handles.xTD = 2.8;   
    
elseif cat_prop_geometricas == 7
    handles.xLD = 11.5; handles.xND = 1.7; handles.xTD = 2.8;   
    
elseif cat_prop_geometricas == 8
    handles.xLD = 10.3; handles.xND = 1.1; handles.xTD = 2.3;   
    
elseif cat_prop_geometricas == 9
    handles.xLD = 11.4; handles.xND = 1.4; handles.xTD = 2.4;   
    
elseif cat_prop_geometricas == 10
    handles.xLD = 7.2; handles.xND = 2.1; handles.xTD = 2.6;   
    
elseif cat_prop_geometricas == 11
    handles.xLD = 8.3; handles.xND = 2.1; handles.xTD = 3.4;   
    
elseif cat_prop_geometricas == 12
    handles.xLD = 8.8; handles.xND = 1.9; handles.xTD = 3.3;   
    
elseif cat_prop_geometricas == 13
    handles.xLD = 10.8; handles.xND = 1.7; handles.xTD = 3.9;   
    
elseif cat_prop_geometricas == 14
    handles.xLD = 11.4; handles.xND = 1.9; handles.xTD = 3.6;   
    
elseif cat_prop_geometricas == 15
    handles.xLD = 10.9; handles.xND = 1.5; handles.xTD = 2.7;   
end                                                

guidata(hObject,handles);


function diam_fuselagem_answer_Callback(hObject, eventdata, handles)
% hObject    handle to diam_fuselagem_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of diam_fuselagem_answer as text
%        str2double(get(hObject,'String')) returns contents of diam_fuselagem_answer as a double


function length_nariz_answer_Callback(hObject, eventdata, handles)
% hObject    handle to length_nariz_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of length_nariz_answer as text
%        str2double(get(hObject,'String')) returns contents of length_nariz_answer as a double


function length_cauda_answer_Callback(hObject, eventdata, handles)
% hObject    handle to length_cauda_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of length_cauda_answer as text
%        str2double(get(hObject,'String')) returns contents of length_cauda_answer as a double


function length_cabine_answer_Callback(hObject, eventdata, handles)
% hObject    handle to length_cabine_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of length_cabine_answer as text
%        str2double(get(hObject,'String')) returns contents of length_cabine_answer as a double


% --- Executes on selection change in diedro_popup.
function diedro_popup_Callback(hObject, eventdata, handles)
% hObject    handle to diedro_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns diedro_popup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from diedro_popup
tipo_de_asa = get(handles.diedro_popup,'Value');

valor_enflechamento = str2double(get(handles.enflechamento_answer,'String'));

velocidade_som = 1224; %[km/h] ao nivel do mar (340m/s)
valor_mach = str2double(get(handles.velocidade_cruzeiro_answer,'String'))/velocidade_som;

if tipo_de_asa == 1 %Asa baixa
    if valor_enflechamento == 0
        handles.diedro_w = 6;
    else
        if valor_mach < 1 || valor_mach == 1
            handles.diedro_w = 5;
        else
            handles.diedro_w = 2.5;
        end
    end
    
elseif tipo_de_asa == 2 %Asa media
    if valor_enflechamento == 0
        handles.diedro_w = 3;
    else
        if valor_mach < 1 || valor_mach == 1
            handles.diedro_w = 0;
        else
            handles.diedro_w = -2.5;
        end
    end
    
elseif tipo_de_asa == 3 %Asa alta
    if valor_enflechamento == 0
        handles.diedro_w = 1;
    else
        if valor_mach < 1 || valor_mach == 1
            handles.diedro_w = -3.5;
        else
            handles.diedro_w = -2.5;
        end
    end   
end

set(handles.diedro_answer,'String',handles.diedro_w);

guidata(hObject,handles);



function diedro_answer_Callback(hObject, eventdata, handles)
% hObject    handle to diedro_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of diedro_answer as text
%        str2double(get(hObject,'String')) returns contents of diedro_answer as a double

function lvt_e_lht_answer_Callback(hObject, eventdata, handles)
% hObject    handle to lvt_e_lht_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lvt_e_lht_answer as text
%        str2double(get(hObject,'String')) returns contents of lvt_e_lht_answer as a double


% --- Executes on button press in aero_eff_graph.
function aero_eff_graph_Callback(hObject, eventdata, handles)
% hObject    handle to aero_eff_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
afilamento_ar10 = [0.0 0.0159292 0.0383481 0.0619469 0.0761062 0.104425 ...
    0.144543 0.181121 0.230678 0.266077 0.310914 0.342773 0.39705 0.448968 0.516224 ...
    0.5941 0.702655 0.781711 0.852507 0.924484 1.0];

eficiencia_ar10 = [0.160473 0.130909 0.0992166 0.077694 0.0663415 0.0486031 ...
    0.0313378 0.0211678 0.0128899 0.00981523 0.00863267 0.00910569 0.0124169 ...
    0.0166741 0.0242424 0.0344124 0.0514412 0.0658684 0.0786401 0.0921212 0.106312];

afilamento_ar08 = [0.0 0.0194690 0.0359882 0.0607670 0.0808260 0.110324 ...
    0.148083 0.197640 0.246018 0.290855 0.342773 0.395870 0.441888 0.502065 0.569322...
    0.643658 0.715634 0.786431 0.848968 0.906785 0.943363 0.979941 1.0]; 

eficiencia_ar08 = [0.124760 0.100399 0.0826608 0.0637398 0.0495492 0.0348854 0.0228234 ...
    0.0124169 0.00863267 0.00626755 0.00626755 0.00957871 0.0121803 0.0171471 0.0240059 ...
    0.0325203 0.0426903 0.0523873 0.0620843 0.0708352 0.0762749 0.0821877 0.0859719];

afilamento_ar06 = [0.0 0.0121091 0.0277286 0.0430678 0.0666667 ...
    0.0926254 0.120944 0.155162 0.197640 0.247198 0.300295 0.352212 0.399410 ...
    0.451327 0.520944 0.578761 0.654277 0.746313 0.853687 1.0];

eficiencia_ar06 = [0.110096 0.0966149 0.0812417 0.0651589 0.0490761 0.0351220 ...
    0.0242424 0.0157280 0.00910569 0.00508500 0.00366593 0.00437546 0.00603104 ...
    0.00815964 0.0131264 0.0178566 0.0247154 0.0339394 0.0460015 0.0623208];

afilamento_ar04 = [0.0 0.0194690 0.0430678 0.0808260 0.111504 ...
    0.141003 0.171681 0.215339 0.302655 0.358112 0.444248 ...
    0.526844 0.627139 0.722714 0.893805 1.0];

eficiencia_ar04 = [0.0845528 0.0594826 0.0410347 0.0228234 0.0126534 ...
    0.00839616 0.00413895 0.000827790 0.000827790 0.00153732 0.00413895 ...
    0.00815964 0.0138359 0.0204582 0.0334664 0.0415078];

figure(1)
% plot(afilamento_ar10,eficiencia_ar10)
xx_ar10 = 0:.01:1;
yy_ar10 = spline(afilamento_ar10,eficiencia_ar10,xx_ar10);
plot(xx_ar10,yy_ar10)

hold on

% plot(afilamento_ar08,eficiencia_ar08)
xx_ar08 = 0:.01:1;
yy_ar08 = spline(afilamento_ar08,eficiencia_ar08,xx_ar08);
plot(xx_ar08,yy_ar08)

% plot(afilamento_ar06,eficiencia_ar06)
xx_ar06 = 0:.01:1;
yy_ar06 = spline(afilamento_ar06,eficiencia_ar06,xx_ar06);
plot(xx_ar06,yy_ar06)

% plot(afilamento_ar04,eficiencia_ar04)
xx_ar04 = 0:.01:1;
yy_ar04 = spline(afilamento_ar04,eficiencia_ar04,xx_ar04);
plot(xx_ar04,yy_ar04)

hold off;

grid on
legend('AR = 10','AR = 08','AR = 06','AR = 04');
xlabel('Afilamento ({\lambda})')
ylabel('Eficiência Aerodinâmica (1-e)/e')
title('Eficiência Aerodinâmica em Função do Alongamento e Afilamento')


% --- Executes on button press in enflech_graph.
function enflech_graph_Callback(hObject, eventdata, handles)
% hObject    handle to enflech_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

M = [0 0.0998865 0.196368 0.247446 0.296254 0.345062 0.385358 0.42622 ...
    0.464245 0.49546 0.528377 0.564132 0.603292 0.651532 0.685585 0.761067...
    0.804767 0.846197 0.87798 0.913167 0.957435 1.00207 1.11767 1.20659...
    1.30735 1.4985 1.6852 1.93263 2.1208 2.38896 2.59786 2.79935 2.99639]; 

sweep = [0.0 0.05 0.1 0.15 0.247253 0.494505 0.906593...
    1.64835 2.55494 3.58516 5.10989 7.37637 10.1786 14.9588 18.4203 26.3324...
    30.4121 33.6676 35.7692 37.706 39.8901 41.6305 44.8603 47.048...
    49.027 51.7863 53.8159 55.5839 56.6752 57.9216 58.7519 59.3218 59.7354];

xx_M = 0:.01:3;
yy_sweep = spline(M,sweep,xx_M);

figure(1)
% plot(M,sweep)
plot(xx_M,yy_sweep)
% plot(M,sweep,'o',xx_M,yy_sweep)

grid on
legend('Enflechamento da asa');
xlabel('Número de Mach máximo')
ylabel('Enflechamento da asa no bordo de ataque [graus]')
title('Número de Mach máximo vs Enflechamento da asa no bordo de ataque')


% --- Executes on button press in clmax_graph.
function clmax_graph_Callback(hObject, eventdata, handles)
% hObject    handle to clmax_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sweep_tsfs = [0 3.22508 6.35327 9.71676 14.0651 17.1493 ...
    21.2184 25.6938 31.4318 34.9639 38.0461 43.033 46.4356 49.9233];
clmax_tsfs = [3.39742 3.39167 3.37819 3.34925 3.28823 3.23503 ...
    3.15085 3.03573 2.86203 2.73264 2.60549 2.38991 2.22632 2.03843];

sweep_dsfs = [0 3.34263 8.03477 11.6767 16.3678 21.1867 25.4484 ...
    30.1164 34.698 40.4994 44.6091 48.9538];
clmax_dsfs = [2.99789 2.99434 2.96861 2.93412 2.87087 2.78222 2.68589 ...
    2.56414 2.4148 2.20909 2.04324 1.85088];

sweep_dsf = [0 4.57718 8.45504 12.2041 15.7815 19.4015 23.4279 ...
    27.2185 30.3234 34.9055 38.1812 42.1846 46.9151];
clmax_dsf = [2.6999 2.69515 2.66948 2.63609 2.59389 2.54065 2.46309 ...
    2.38114 2.30255 2.17088 2.0691 1.93084 1.74508];

sweep_fowler = [0 3.47879 7.44264 10.9348 14.2339 17.5113 ...
    20.5956 23.3371 28.1772 33.7877 38.3911 41.6881 44.9422];
clmax_fowler = [2.50124 2.49546 2.47972 2.45408 2.42293 2.37854 2.32755 ...
    2.27878 2.18241 2.04293 1.90905 1.80064 1.69114];

sweep_slf = [0 5.03468 10.5839 14.6757 18.703 23.0726 ...
    26.9921 30.8684 34.4447 36.9286 39.9906];
clmax_slf = [2.20435 2.19294 2.16384 2.12822 2.08046 2.01392 ...
    1.9452 1.86325 1.78021 1.71712 1.63522];

sweep_plain = [0 4.14515 7.83056 11.0443 15.1791 19.1852 ...
    22.8481 25.8684 29.8737];
clmax_plain = [1.80151 1.79789 1.78658 1.76869 1.73527 1.69524 ...
    1.64752 1.60425 1.53884];

sweep_no = [0 4.3653 8.44363 12.2146 16.071 19.9057];
clmax_no = [1.498 1.49399 1.48523 1.4695 1.44052 1.40603];

figure(1)
% plot(sweep_tsfs,clmax_tsfs);
xx_tsfs = 0:0.5:50;
yy_tsfs = spline(sweep_tsfs,clmax_tsfs,xx_tsfs);
plot(xx_tsfs,yy_tsfs)
hold on

% plot(sweep_dsfs,clmax_dsfs);
xx_dsfs = 0:0.5:49;
yy_dsfs = spline(sweep_dsfs,clmax_dsfs,xx_dsfs);
plot(xx_dsfs,yy_dsfs)

% plot(sweep_dsf,clmax_dsf);
xx_dsf = 0:0.5:47;
yy_dsf = spline(sweep_dsf,clmax_dsf,xx_dsf);
plot(xx_dsf,yy_dsf)

% plot(sweep_fowler,clmax_fowler);
xx_fowler = 0:0.5:45;
yy_fowler = spline(sweep_fowler,clmax_fowler,xx_fowler);
plot(xx_fowler,yy_fowler)

% plot(sweep_slf,clmax_slf);
xx_slf = 0:0.5:40;
yy_slf = spline(sweep_slf,clmax_slf,xx_slf);
plot(xx_slf,yy_slf)

% plot(sweep_plain,clmax_plain);
xx_plain = 0:0.5:30;
yy_plain = spline(sweep_plain,clmax_plain,xx_plain);
plot(xx_plain,yy_plain)

% plot(sweep_no,clmax_no);
xx_no = 0:0.5:20;
yy_no = spline(sweep_no,clmax_no,xx_no);
plot(xx_no,yy_no)

hold off

grid on
legend('Triple slotted flap and slat','Double slotted flap and slat', ...
    'Double slotted flap','Fowler flap','Single slotted flap','Plain flap','No flap');
xlabel('Enflechamento da asa em 0.25c [graus]')
ylabel('Coeficiente de Sustentação Maxima')
title('Enflechamento da asa vs CLmax para diferentes flaps')


% --- Executes on button press in dec_balanceada.
function dec_balanceada_Callback(hObject, eventdata, handles)
% hObject    handle to dec_balanceada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of dec_balanceada


function diam_helice_answer_Callback(hObject, eventdata, handles)
% hObject    handle to diam_helice_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of diam_helice_answer as text
%        str2double(get(hObject,'String')) returns contents of diam_helice_answer as a double


function qtd_blades_answer_Callback(hObject, eventdata, handles)
% hObject    handle to qtd_blades_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qtd_blades_answer as text
%        str2double(get(hObject,'String')) returns contents of qtd_blades_answer as a double
n_blades = str2double(get(handles.qtd_blades_answer,'String'));

if n_blades <2 
    msgbox('Entre com um número de blades maior ou igual a 2.')
end









%%%USELESS FUNCTIONS%%%
% --- Executes during object creation, after setting all properties.
function airplane_category_CreateFcn(hObject, eventdata, handles)
% hObject    handle to airplane_category (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function aspect_ratio_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aspect_ratio_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function lambda_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function envergadura_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to envergadura_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
% Hint: delete(hObject) closes the figure
user_answer = questdlg('Are you sure you want to close the program?', 'Exit confirmation', 'Yes', 'No', 'Yes');
switch user_answer
    case 'Yes'
        delete(hObject);
end

% --- Executes during object creation, after setting all properties.
function c_root_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_root_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function mac_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mac_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function posicao_mac_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posicao_mac_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function tail_type_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tail_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function aspect_ratio_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aspect_ratio_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function lambda_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function HT_area_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to HT_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function c_tip_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_tip_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function envergadura_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to envergadura_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function c_root_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_root_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function mac_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mac_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function posicao_mac_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posicao_mac_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function c_tip_HT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_tip_HT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function aspect_ratio_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aspect_ratio_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function lambda_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function VT_area_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VT_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function envergadura_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to envergadura_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function mac_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mac_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function posicao_mac_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to posicao_mac_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function c_root_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_root_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function c_tip_VT_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_tip_VT_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function ref_table_cfe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ref_table_cfe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function cfe_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cfe_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function swet_sref_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to swet_sref_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function C_D0_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to C_D0_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function eficiencia_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eficiencia_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function k2_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k2_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function engine_category_CreateFcn(hObject, eventdata, handles)
% hObject    handle to engine_category (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TSFC_takeoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TSFC_takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TSFC_loiter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TSFC_loiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function TSFC_cruise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TSFC_cruise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function SFC_takeoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SFC_takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function SFC_loiter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SFC_loiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function SFC_cruise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SFC_cruise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function neta_takeoff_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neta_takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function neta_loiter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neta_loiter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function neta_cruise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neta_cruise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function range_sem_reserva_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to range_sem_reserva_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function velocidade_cruzeiro_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocidade_cruzeiro_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function carga_paga_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carga_paga_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function tempo_comb_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tempo_comb_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function alternativa_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alternativa_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function tempo_espera_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tempo_espera_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function cond_cruzeiro_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cond_cruzeiro_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function W0_1_est_answer_Callback(hObject, eventdata, handles)
% hObject    handle to W0_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of W0_1_est_answer as text
%        str2double(get(hObject,'String')) returns contents of W0_1_est_answer as a double

% --- Executes during object creation, after setting all properties.
function W0_1_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W0_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function W0_2_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W0_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Wempty_1_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wempty_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Wempty_2_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wempty_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Wfuel_1_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wfuel_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Wfuel_2_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wfuel_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function iteracoes_1_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracoes_1_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function iteracoes_2_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracoes_2_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function W0_3_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to W0_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Wempty_3_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wempty_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function Wfuel_3_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Wfuel_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function iteracoes_3_est_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracoes_3_est_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function wing_area_emp_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wing_area_emp_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function v_stall_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_stall_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function enflechamento_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enflechamento_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function CL_max_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CL_max_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function T_por_engine_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T_por_engine_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function empuxo_peso_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to empuxo_peso_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function qtd_motores_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qtd_motores_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function acres_fuel_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to acres_fuel_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function dist_decolagem_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dist_decolagem_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function dist_aterrissagem_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dist_aterrissagem_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function T_cruise_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T_cruise_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function T_takeoff_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T_takeoff_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function carga_alar_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carga_alar_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function wing_area_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wing_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function aileron_area_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aileron_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function profundor_area_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to profundor_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function leme_area_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to leme_area_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function landing_gear_type1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to landing_gear_type1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function landing_gear_type2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to landing_gear_type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function proporcoes_geometricas_listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to proporcoes_geometricas_listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function diam_fuselagem_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diam_fuselagem_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function length_nariz_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length_nariz_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function length_cauda_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length_cauda_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function length_cabine_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length_cabine_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function diedro_popup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diedro_popup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function diedro_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diedro_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function lvt_e_lht_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lvt_e_lht_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function engine_category_prop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to engine_category_prop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function prop_bi_quadri_CreateFcn(hObject, eventdata, handles)
% hObject    handle to prop_bi_quadri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function cond_decolagem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cond_decolagem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function diam_helice_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to diam_helice_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function qtd_blades_answer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qtd_blades_answer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
