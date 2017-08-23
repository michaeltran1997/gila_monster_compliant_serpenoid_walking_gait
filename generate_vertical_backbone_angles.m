% This function generates angles for vertical modules given values of
% body_raise
function verticalBackboneAngles = generate_vertical_backbone_angles(body_raise, reversed_vert)
    
    verticalBackboneAngles = body_raise * reversed_vert;
    
end