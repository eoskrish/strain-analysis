function [fin_pos] = rotate(init_pos, th)

  R = [cos(th), sin(th); -sin(th) cos(th)];

  fin_pos = R*transpose(init_pos);
  fin_pos = transpose(fin_pos);
