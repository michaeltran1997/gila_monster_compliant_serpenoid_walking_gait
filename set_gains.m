function [] = set_gains(lateral_backbone, vertical_backbone, leg1, leg2, leg3, leg4)
    gains_lateral = lateral_backbone.getGains();
    ones_n = ones(1,lateral_backbone.getNumModules);
    gains_lateral.controlStrategy = ones_n*4;
    gains_lateral.positionKp = ones_n*6; % important. I had it as 4.
    gains_lateral.positionKi = ones_n*.01; % should be low
    gains_lateral.positionKd = ones_n*1; % important
    gains_lateral.torqueKp= ones_n*1;
    gains_lateral.torqueKi= ones_n*0;
    gains_lateral.torqueKd= ones_n*.1;
    gains_lateral.velocityKp = ones_n*1;
    lateral_backbone.set('gains',gains_lateral);
    
    gains_vertical = vertical_backbone.getGains();
    ones_n = ones(1,vertical_backbone.getNumModules);
    gains_vertical.controlStrategy = ones_n*4;
    gains_vertical.positionKp = ones_n*6; % important. I had it as 4.
    gains_vertical.positionKi = ones_n*.01; % should be low
    gains_vertical.positionKd = ones_n*1; % important
    gains_vertical.torqueKp= ones_n*1;
    gains_vertical.torqueKi= ones_n*0;
    gains_vertical.torqueKd= ones_n*.1;
    gains_vertical.velocityKp = ones_n*1;
    vertical_backbone.set('gains',gains_vertical);
    
    gains_leg = leg1.getGains();
    ones_n = ones(1,leg1.getNumModules);
    gains_leg.controlStrategy = ones_n*3;
    gains_leg.positionKp = ones_n*6; % important. I had it as 4.
    gains_leg.positionKi = ones_n*.01; % should be low
    gains_leg.positionKd = ones_n*1; % important
    gains_leg.torqueKp= ones_n*1;
    gains_leg.torqueKi= ones_n*0;
    gains_leg.torqueKd= ones_n*.1;
    gains_leg.velocityKp = ones_n*1;
    
    leg1.set('gains',gains_leg);
    leg2.set('gains',gains_leg);
    leg3.set('gains',gains_leg);
    leg4.set('gains',gains_leg);
end