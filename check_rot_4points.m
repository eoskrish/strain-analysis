% for pure compression in 2D

%inital positoions of four points of a polygon
pos_i = [0,0; 0,1; 1,1; 1,0];
%final positions (after deformation) of the same four points
pos_f = [0.1,0.1; 0.1,0.9; 0.9,0.9; 0.9,0.1];

disp(pos_i)
disp(pos_f)

%plotting the points to describe the inital and final structures
xi = pos_i(:,1);
yi = pos_i(:,2);
xi = [xi; xi(1)];
yi = [yi; yi(1)];

xf = pos_f(:,1);
yf = pos_f(:,2);
xf = [xf; xf(1)];
yf = [yf; yf(1)];

plot(xi, yi,'*-k', xf, yf,'*-r')
legend('old','new')

%calculating strain
s = calc_strain(pos_i, pos_f);

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp('pure compression without correcting for global translation');
disp('strain tensor calculated');
disp(s)

disp([e1 e2 e3])
pause

% now rotate globally
theta = 30/180*pi;
pos_f = rotate(pos_f,theta);
disp(pos_i);
disp(pos_f);

%plotting the points to describe the inital and final structures
xi = pos_i(:,1);
yi = pos_i(:,2);
xi = [xi; xi(1)];
yi = [yi; yi(1)];

xf = pos_f(:,1);
yf = pos_f(:,2);
xf = [xf; xf(1)];
yf = [yf; yf(1)];

plot(xi, yi,'*-k', xf, yf,'*-r')
legend('old','new')

%calculating strain
s = calc_strain(pos_i, pos_f);

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp('strain tensor calculated');
disp(s)

disp([e1 e2 e3])
pause


%check for global rotations in case of pure shear

% for simple shear in x-dir
pos_i = [0,0; 0,1; 1,1; 1,0];
pos_f = [0,0; 0.1,1; 1.1,1; 1,0];

disp(pos_i);
disp(pos_f);

%plotting the points to describe the inital and final structures
xi = pos_i(:,1);
yi = pos_i(:,2);
xi = [xi; xi(1)];
yi = [yi; yi(1)];

xf = pos_f(:,1);
yf = pos_f(:,2);
xf = [xf; xf(1)];
yf = [yf; yf(1)];

plot(xi, yi,'*-k', xf, yf,'*-r')
legend('old','new')

%calculating strain
s = calc_strain(pos_i, pos_f);

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp('strain tensor calculated');
disp(s)

disp([e1 e2 e3])
pause

% now rotate globally
theta = 30/180*pi;
pos_f = rotate(pos_f,theta);
disp(pos_i);
disp(pos_f);

%plotting the points to describe the inital and final structures
xi = pos_i(:,1);
yi = pos_i(:,2);
xi = [xi; xi(1)];
yi = [yi; yi(1)];

xf = pos_f(:,1);
yf = pos_f(:,2);
xf = [xf; xf(1)];
yf = [yf; yf(1)];

plot(xi, yi,'*-k', xf, yf,'*-r')
legend('old','new')

%calculating strain
s = calc_strain(pos_i, pos_f);

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp('strain tensor calculated');
disp(s)

disp([e1 e2 e3])
pause

%

%check for global rotations in case of pure shear

% for simple shear in y-dir
pos_i = [0,0; 0,1; 1,1; 1,0];
pos_f = [0,0; 0,1; 1,1.1; 1,0.1];

disp(pos_i);
disp(pos_f);

%plotting the points to describe the inital and final structures
xi = pos_i(:,1);
yi = pos_i(:,2);
xi = [xi; xi(1)];
yi = [yi; yi(1)];

xf = pos_f(:,1);
yf = pos_f(:,2);
xf = [xf; xf(1)];
yf = [yf; yf(1)];

plot(xi, yi,'*-k', xf, yf,'*-r')
legend('old','new')

%calculating strain
s = calc_strain(pos_i, pos_f);

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp('strain tensor calculated');
disp(s)

disp([e1 e2 e3])
pause

% now rotate globally
theta = 30/180*pi;
pos_f = rotate(pos_f,theta);
disp(pos_i);
disp(pos_f);

%plotting the points to describe the inital and final structures
xi = pos_i(:,1);
yi = pos_i(:,2);
xi = [xi; xi(1)];
yi = [yi; yi(1)];

xf = pos_f(:,1);
yf = pos_f(:,2);
xf = [xf; xf(1)];
yf = [yf; yf(1)];

plot(xi, yi,'*-k', xf, yf,'*-r')
legend('old','new')

%calculating strain
s = calc_strain(pos_i, pos_f);

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp('strain tensor calculated');
disp(s)


disp([e1 e2 e3])
pause
