function func_sketch(posi, posf, fname)

  %plotting the points to describe the inital and final structures
  xi = posi(:,1);
  yi = posi(:,2);
  xi = [xi; xi(1)];
  yi = [yi; yi(1)];

  xf = posf(:,1);
  yf = posf(:,2);
  xf = [xf; xf(1)];
  yf = [yf; yf(1)];

  fig = figure;
  plot(xi, yi,'*-k', xf, yf,'*-r')
  legend('old','new')
  print(fig, fname, '-djpeg')
