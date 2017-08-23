function lateralBackboneAngles = generate_lateral_backbone_angles(A, eta, omega_t, offset, ...
                                                                  len, reversed_lat, numModLat) 
    lateralBackboneAngles = zeros(1, numModLat);
    
    for i = 1:numModLat
        lateralBackboneAngles(i) =  (A*sin(eta*len(i)+omega_t) + offset) * reversed_lat(i);
    end
end