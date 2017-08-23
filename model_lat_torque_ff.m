clear all;

figure
hold on

A = 1.97; B = 0.0995; C =  10.1; D = -0.25;
X1 = [1:700];
Y1 = A*sin(B*X1-C)+D;
p1 = plot(X1,Y1,'c');


load('data5.mat');
p11 = scatter(data(:,1), data(:,2), '.b');
load('data6.mat');
p12 = scatter(data(:,1), data(:,2), '.r');
load('data7.mat');
p13 = scatter(data(:,1), data(:,2), '.g');
load('data8.mat');
p14 = scatter(data(:,1), data(:,2), '.k');


figure
hold on
A = 2.12; B = 0.0995; C =  12.75; D =  0.15;
X2 = [1:700];
Y2 = A*sin(B*X2-C)+D;
p2 = plot(X2,Y2,'c');

load('data5.mat');
p21 = scatter(data(:,1), data(:,3), '.b');
load('data6.mat');
p22 = scatter(data(:,1), data(:,3), '.r');
load('data7.mat');
p23 = scatter(data(:,1), data(:,3), '.g');
load('data8.mat');
p24 = scatter(data(:,1), data(:,3), '.k');
hold off


figure
hold on

A = 5.52; B = 0.0995; C =  10.35; D = 0.55;
X3 = [1:700];
Y3 = A*sin(B*X3-C)+D;
p3 = plot(X3,Y3,'c');

load('data5.mat');
p31 = scatter(data(:,1), data(:,4), '.b');
load('data6.mat');
p32 = scatter(data(:,1), data(:,4), '.r');
load('data7.mat');
p33 = scatter(data(:,1), data(:,4), '.g');
load('data8.mat');
p34 = scatter(data(:,1), data(:,4), '.k');
hold off


figure
hold on

X4 = [1:700];
Y4 = X4./X4.*-0.5;
p4 = plot(X4,Y4,'c');%+/-1

load('data5.mat');
p41 = scatter(data(:,1), data(:,5), '.b');
load('data6.mat');
p42 = scatter(data(:,1), data(:,5), '.r');
load('data7.mat');
p43 = scatter(data(:,1), data(:,5), '.g');
load('data8.mat');
p44 = scatter(data(:,1), data(:,5), '.k');
hold off

figure
hold on

X5 = [1:700];
Y5 = X5./X5;
p5 = plot(X5,Y5,'c'); %+/-2

load('data5.mat');
p51 = scatter(data(:,1), data(:,6), '.b');
load('data6.mat');
p52 = scatter(data(:,1), data(:,6), '.r');
load('data7.mat');
p53 = scatter(data(:,1), data(:,6), '.g');
load('data8.mat');
p54 = scatter(data(:,1), data(:,6), '.k');

while true
    x = input('');
    if x == 1
        set(p11,'Visible','off');
        set(p21,'Visible','off');
        set(p31,'Visible','off');
        set(p41,'Visible','off');
        set(p51,'Visible','off');
    elseif x == 2
        set(p12,'Visible','off');
        set(p22,'Visible','off');
        set(p32,'Visible','off');
        set(p42,'Visible','off');
        set(p52,'Visible','off');
    elseif x == 3
        set(p13,'Visible','off');
        set(p23,'Visible','off');
        set(p33,'Visible','off');
        set(p43,'Visible','off');
        set(p53,'Visible','off');  
    elseif x == 4
        set(p14,'Visible','off');
        set(p24,'Visible','off');
        set(p34,'Visible','off');
        set(p44,'Visible','off');
        set(p54,'Visible','off');
    elseif x == 11
        set(p11,'Visible','on');
        set(p21,'Visible','on');
        set(p31,'Visible','on');
        set(p41,'Visible','on');
        set(p51,'Visible','on');
    elseif x == 22
        set(p12,'Visible','on');
        set(p22,'Visible','on');
        set(p32,'Visible','on');
        set(p42,'Visible','on');
        set(p52,'Visible','on');
    elseif x == 33
        set(p13,'Visible','on');
        set(p23,'Visible','on');
        set(p33,'Visible','on');
        set(p43,'Visible','on');
        set(p53,'Visible','on');  
    elseif x == 44
        set(p14,'Visible','on');
        set(p24,'Visible','on');
        set(p34,'Visible','on');
        set(p44,'Visible','on');
        set(p54,'Visible','on');
    end
end

%{
X = [1:700];
A = 1.67; B = 0.0995; C =  9.85; D = -0.25;
Y = A*sin(B*X-C)+D;
p = plot(X,Y, 'c');
dA = 0.05; dB = 0.0001; dC = 0.05; dD = 0.05;
% A = 1.67; B = 0.0995; C =  9.85; D = -0.25; for 1st joint (2)
% A = 2.57; B = 0.0995; C =  12.7; D =  0.20; for 2nd joint (3)
% A = 4.42; B = 0.0995; C =  10.7; D = -0.25; for 3rd joint (4)

while true
    
    x = input('','s');
    if x == 'a'
        A = A + dA
    elseif x == 'b'
        B = B + dB
    elseif x == 'c'
        C = C + dC
    elseif x == 'd'
        D = D + dD
    elseif x == 'a-'
        A = A - dA
    elseif x == 'b-'
        B = B - dB
    elseif x == 'c-'
        C = C - dC
    elseif x == 'd-'
        D = D - dD
    else
        continue
    end
    
    delete(p);
    
    Y = A*sin(B*X-C)+D;
    p = plot(X,Y,'c');
end
%}
clear all;