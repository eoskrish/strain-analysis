function [u, dr, epsilon] = func_strain_v1(posi, posf)

  n_points = size(posi,1);
  t_points = size(posi,2);

  %defining the displacement for each point
  u = posf - posi;

  %inital lengths choosing ref point to be the first point
  dr = zeros(n_points-1,2);
  for n = 1 : n_points-1
    dr(n,:) = posi(n+1,:) - posi(1,:);
  end

  s = cell(n_points-1,1);

  for n = 1 : n_points-1
    dudx = zeros(2,2);
    for i = 1 : 2
      for j = 1 : 2
        %calculating the differentials
        du = u(n+1,i) - u(1,i);
        if du ~= 0 && dr(n,j) ~= 0
          dudx(i,j) = du / dr(n,j);
        end
      end
    end
    %writing out the strain tensor for each point w.r.t the first point
    % s{i}(1,1) = 0.5*(2*du1_dx1(i) + (du1_dx1(i))^2 + (du2_dx1(i))^2);
    % s{i}(1,2) = 0.5*(du1_dx2(i) + du2_dx1(i) + (du1_dx1(i))*(du1_dx2(i)) + (du2_dx1(i))*(du2_dx2(i)));
    % s{i}(2,1) = s{i}(1,2);
    % s{i}(2,2) = 0.5*(2*du2_dx2(i) + (du1_dx2(i))^2 + (du2_dx2(i))^2);

    s{n} = 0.5*(dudx + transpose(dudx));
  end

  epsilon = zeros(2,2);

  for n = 1 : n_points-1
    epsilon = epsilon + s{n};
  end
  % epsilon = epsilon / (n_points-1);
