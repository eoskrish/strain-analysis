function [s] = func_calc_strain_v1(pos_i, pos_f)

  %defining the displacement for each point
  u = pos_f - pos_i;

  %inital lengths
  dx = pos_i(4,1) - pos_i(1,1);
  dy = pos_i(2,2) - pos_i(1,2);

  %calculating the differentials
  du1_dx1 = (u(3,1) - u(2,1)) / dx;
  du1_dx2 = (u(3,1) - u(4,1)) / dy;
  du2_dx1 = (u(3,2) - u(2,2)) / dx;
  du2_dx2 = (u(3,2) - u(4,2)) / dy;

  %writing out the strain tensor
  s(1,1) = 0.5*(2*du1_dx1 + (du1_dx1)^2 + (du2_dx1)^2);
  s(1,2) = 0.5*(du1_dx2 + du2_dx1 + (du1_dx1)*(du1_dx2) + (du2_dx1)*(du2_dx2));
  s(2,1) = s(1,2);
  s(2,2) = 0.5*(2*du2_dx2 + (du1_dx2)^2 + (du2_dx2)^2);
