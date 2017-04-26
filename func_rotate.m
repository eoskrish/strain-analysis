function [fin_pos] = rotate(init_pos, th)

  R = [cos(th), -sin(th); sin(th) cos(th)];
  fin_pos = [];
  for i = 1 : size(init_pos,1)
    rotated_vector = R*transpose(init_pos(i,:));
    fin_pos = [fin_pos; transpose(rotated_vector)];
  end
