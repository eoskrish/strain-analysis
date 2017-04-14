%-------------------PURE COMPRESSION---------------------
%---------------------------------------------------------
% for pure compression in 2D

%inital positions of points of a polygon
pos_i = [0,0; 0,1; 1,1; 1,0];
%final positions (after deformation) of the same four points
pos_f = [0.1,0.1; 0.1,0.9; 0.9,0.9; 0.9,0.1];

%sketch the initial and final configurations
fname = sprintf('pure compression');
func_sketch(pos_i,pos_f,fname)

%calculating strain
[u,dr,s] = func_strain_v1(pos_i, pos_f)

% %pure compression component of the strain tensor
% disp('hydrostatic compression')
% pc = 0.5*trace(s)*[1,0; 0,1]
% %pure shear
% disp('pure shear')
% ps = s - 0.5*trace(s)*[1,0; 0,1]
%
% e1 = (s(1,1)+s(2,2)) /2;
% e2 = (s(1,1)-s(2,2)) /2;
% e3 = (s(1,2)+s(2,1)) /2;
%
% disp([e1 e2 e3])
% pause

%{

%--------------------------now rotate----------------------------

% now rotate globally
theta = 30/180*pi;
pos_f = func_rotate(pos_f,theta);

%sketch the inital and the final configurations
fname = sprintf('pure compression with rotation');
func_sketch(pos_i,pos_f,fname)

%calculating strain
s = func_strain_v1(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp([e1 e2 e3])
pause

%--------------------------PURE SHEAR----------------------------
%----------------------------------------------------------------

%check for global rotations in case of pure shear

% for simple shear in x-dir
pos_i = [0,0; 0,1; 1,1; 1,0];
pos_f = [0,0; 0.1,1; 1.1,1; 1,0];

%sketch the inital and the final configurations
fname = sprintf('pure shear');
func_sketch(pos_i,pos_f,fname)

%calculating strain
s = func_strain_v1(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp([e1 e2 e3])
pause

%--------------------------now rotate----------------------------

% now rotate globally
theta = 30/180*pi;
pos_f = func_rotate(pos_f,theta);

%sketch the inital and the final configurations
fname = sprintf('pure shear with rotation');
func_sketch(pos_i,pos_f,fname)

%calculating strain
s = func_strain_v1(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp([e1 e2 e3])
pause

%---------------------------PURE SHEAR----------------------
%-----------------------------------------------------------

%check for global rotations in case of pure shear

% for simple shear in y-dir
pos_i = [0,0; 0,1; 1,1; 1,0];
pos_f = [0,0; 0,1; 1,1.1; 1,0.1];

%sketch the inital and the final configurations
fname = sprintf('pure shear in y-dir');
func_sketch(pos_i,pos_f,fname)

%calculating strain
s = func_strain_v1(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp([e1 e2 e3])
pause

%----------------------rotate-------------------------------------

% now rotate globally
theta = 30/180*pi;
pos_f = func_rotate(pos_f,theta);

%sketch the initial and final configurations
fname = sprintf('pure shear with rotation in y-dir');
func_sketch(pos_i,pos_f,fname)

%calculating strain
s = func_strain_v1(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2;
e2 = (s(1,1)-s(2,2)) /2;
e3 = (s(1,2)+s(2,1)) /2;

disp([e1 e2 e3])
pause

%}
