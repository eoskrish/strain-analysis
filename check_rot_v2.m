%--------------------PURE COMPRESSION-----------------
%------------------------------------------------------
close all
%inital positoions of points of a polygon
% pos_i = [0,0; 0,1; 1,1; 1,0];
pos_i = [-1,0; 0,1; 1,0; 0,-1];
%final positions (after deformation) of the same points
pos_f = pos_i;
% pos_f = [0.1,0.1; 0.1,0.9; 0.9,0.9; 0.9,0.1];

%sketch the initial and final positions
fname =sprintf('pure compression v2');
func_sketch(pos_i,pos_f,fname)

%calculate strain using the ref.
% del_t = 1;
% disp('strain tensor')
[s, dsq] = func_strain_v2(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2
e2 = (s(1,1)-s(2,2)) /2
e3 = (s(1,2)+s(2,1)) /2

% disp([e1,e2,e3])
% disp(dsq)
pause
pos_i = [0,0; 0,1; 1,1; 1,0];
%final positions (after deformation) of the same points
pos_f = [0.1,0.1; 0.1,0.9; 0.9,0.9; 0.9,0.1];

%sketch the initial and final positions
fname =sprintf('pure compression v2');
func_sketch(pos_i,pos_f,fname)

%calculate strain using the ref.
% del_t = 1;
disp('strain tensor')
[s, dsq] = func_strain_v2(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2
e2 = (s(1,1)-s(2,2)) /2
e3 = (s(1,2)+s(2,1)) /2

% disp([e1 e2 e3])
pause

%--------------------now rotate-----------------------
close all
theta = 10/180*pi;
pos_f = func_rotate(pos_i,theta);

%sketch the initial and final positions
fname =sprintf('pure compression v2 rotated');
func_sketch(pos_i,pos_f,fname)

%calculate strain using the ref.
% del_t = 1;
disp('strain tensor')
[s,dsq] = func_strain_v2(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2
e2 = (s(1,1)-s(2,2)) /2
e3 = (s(1,2)+s(2,1)) /2

% disp([e1,e2,e3])
% disp(dsq)
% disp([e1 e2 e3])
pause
%------------------------
close all
theta = 10/180*pi;
pos_f = pos_i - [0.5,0.5; 0.5,0.5; 0.5,0.5; 0.5,0.5];
pos_f = func_rotate(pos_f,theta);
pos_f = pos_f + [0.5,0.5; 0.5,0.5; 0.5,0.5; 0.5,0.5];

%sketch the initial and final positions
fname =sprintf('pure compression v2 rotated');
func_sketch(pos_i,pos_f,fname)

%calculate strain using the ref.
% del_t = 1;
disp('strain tensor')
[s,dsq] = func_strain_v2(pos_i, pos_f)

%pure compression component of the strain tensor
disp('hydrostatic compression')
pc = 0.5*trace(s)*[1,0; 0,1]
%pure shear
disp('pure shear')
ps = s - 0.5*trace(s)*[1,0; 0,1]

e1 = (s(1,1)+s(2,2)) /2
e2 = (s(1,1)-s(2,2)) /2
e3 = (s(1,2)+s(2,1)) /2
