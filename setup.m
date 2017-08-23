% Setting up directories and groups of modules

currentDir = '/Users/apple/Box Sync/Robotics Lab';
addpath(fullfile(currentDir , 'hebi 0.5'));

% list of backbone modules
% be aware of the order of modules
lateral_backbone  = HebiLookup.newGroupFromNames('*', {'SA017','SA051','SA022'});
vertical_backbone = HebiLookup.newGroupFromNames('*', {'SA028','SA047'});
leg1 = HebiLookup.newGroupFromNames('*', {'SA045','SA020'});
leg2 = HebiLookup.newGroupFromNames('*', {'SA031','SA029'});
leg3 = HebiLookup.newGroupFromNames('*', {'SA011','SA035'});
leg4 = HebiLookup.newGroupFromNames('*', {'SA032','SA052'});
% list of leg modules
% 1----------2
%       |
%       |
%       |
%       |
% 3----------4

% get number of modules
numModLat  = lateral_backbone.getNumModules;
numModVert = vertical_backbone.getNumModules;
numModLegs = leg1.getNumModules;

% setting up joystick
joy = vrjoystick(1);