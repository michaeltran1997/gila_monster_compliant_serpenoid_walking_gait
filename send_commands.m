% Sending commands to the Gila Monster

% input angles into command structs
cmdLatBackbone.position = lateralBackboneAngles;

cmdVertBackbone.position = verticalBackboneAngles;

%cmdVertBackbone.torque = -vert_tau_fforward';

cmdLeg1.position = legAngles(1,:);

cmdLeg2.position = legAngles(2,:);

cmdLeg3.position = legAngles(3,:);

cmdLeg4.position = legAngles(4,:);

% send the command structure
lateral_backbone.set(cmdLatBackbone); 

vertical_backbone.set(cmdVertBackbone);

leg1.set(cmdLeg1);

leg2.set(cmdLeg2);

leg3.set(cmdLeg3);

leg4.set(cmdLeg4);