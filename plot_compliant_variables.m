% plotting real-time compliant variables: offset and body_raise vs time

X = [X sigma0(2)];
Y1 = [Y1 omega_t];
Y2 = [Y2 offset];
Y3 = [Y3 body_raise];

hold on
%p1 = scatter(X, Y1, '.r');
%l1 = line(X, Y1, 'Color','red');
p2 = scatter(X, Y2, '.b');
l2 = line(X, Y2, 'Color','blue');
p3 = scatter(X, Y3, '.g');
l3 = line(X, Y3, 'Color','green');

