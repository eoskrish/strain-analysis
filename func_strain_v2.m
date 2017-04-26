%Describe what the function does
%
%

<<<<<<< HEAD
function [epsilon, D_sq] = func_strain_v2(posi, posf)
=======
function [epsilon] = func_strain_v2(posi, posf)
>>>>>>> 8f23945a8537fe6747582c219b253c0f1cd88b90

n_points = size(posi,1);
t_points = size(posf,2);
r = cell(2,1);
X = zeros(2,2);
Y = zeros(2,2);

r{1} = posi;
r{2} = posf;

for i = 1 : 2
  for j = 1 : 2
    for n = 2 : n_points
      X(i,j) = X(i,j) + (r{2}(n,i) - r{2}(1,i))*(r{1}(n,j) - r{1}(1,j));
      Y(i,j) = Y(i,j) + (r{1}(n,i) - r{1}(1,i))*(r{1}(n,j) - r{1}(1,j));
    end
  end
end

Y = inv(Y);
epsilon = zeros(2,2);
for i = 1 : 2
  for j = 1 : 2
    for k = 1 : 2
      epsilon(i,j) = epsilon(i,j) + X(i,k)*Y(j,k);
    end
  end
end
epsilon = epsilon - [1,0; 0,1];

I = [1,0;0,1];
D_sq = 0;
dummy1 = 0;
for n = 2 : n_points
  for i = 1 : 2
    dummy1 = dummy1 + (r{2}(n,i) - r{2}(1,i));
    dummy = 0;
    for j = 1 : 2
      dummy = dummy + (I(i,j) + epsilon(i,j))*(r{1}(n,j) - r{1}(1,j));
    end
    dummy = dummy - dummy1;
    D_sq = D_sq + dummy1^2;
  end
end
