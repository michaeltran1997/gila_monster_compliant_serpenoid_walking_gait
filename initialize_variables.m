% initialize all variables

% initialize the command structure
cmdLatBackbone = CommandStruct(); 
cmdVertBackbone = CommandStruct();
cmdLeg1 = CommandStruct();
cmdLeg2 = CommandStruct();
cmdLeg3 = CommandStruct();
cmdLeg4 = CommandStruct();

% constants
mod_len      = 0.066; % meter (length of a SEA-module)
spl_len      = 0.07;  % meter (length of a splitter module)
mod_mass     = 0.223; % kg (mass of a SEA-module)
spl_mass     = 0.564; % kg (mass of a splitter module)
eta          = 2*pi/(10*mod_len); % half wavelength equals the distance between 2 splitters to create a standing wave
omega        = 0.1; % speed of wave progression
A            = 0.5; % tested up to 1.2
A_el         = pi/3; % amplitude elbow
len          = [0 2 4 6 8].*mod_len;
omega_t      = 0;
offset       = 0; %+ve turn left, -ve turn right
scale        = 1;
body_raise   = 0;

fudge_factor = [0; 0.2; 0.02; 0.08]; % [A; omega_t; offset; body_raise]
lat_tau_fforward  = [0; 0; 0]; % [1st lateral module; 2nd lateral module; ...]
vert_tau_fforward = [-0.5; 1.2]; % [1st vertical module; ...] from tail
% [-0.5; 1.2];
reversed_lat  = [1 -1 1];
reversed_vert = [1 -1];

% variables
% [A; omega_t; offset; body_raise]
sigma      = zeros(4, 1);
sigma0     = [A; omega_t; offset; body_raise];
sigma_dot  = zeros(4, 1);
sigma_ddot = zeros(4, 1);

M  = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
B  = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
K  = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];

% for plotting real-time variables
% linkdata on
X = []; Y1 = []; Y2 = []; Y3 = [];
