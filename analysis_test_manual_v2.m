close all

xcoords = load('vertex_xcoords.dat');
ycoords = load('vertex_ycoords.dat');

range_n = size(xcoords,1);
range_t = size(xcoords,2) - 1;
% range_t = 2;

position = cell(range_t+1, 1);
for t = 1 : range_t+1
    position{t} = [xcoords(:,t) ycoords(:,t)];
end

X = cell(range_t+1,1);
Y = cell(range_t+1,1);
length = cell(range_t+1,1);
del_l = cell(range_t+1,1);
strain = cell(range_t+1,1);
del_t = 1;


for t = 1 : range_t
    length{t} = zeros(6,6);
    for n = 1 : range_n
        for m = 1 : n
            length{t}(n,m) = sqrt((position{t}(n,:) - position{t}(m,:))*transpose(position{t}(n,:) - position{t}(m,:)));
            length{t}(m,n) = length{t}(n,m);
        end
    end
end

for t = 1+del_t : range_t
    del_l{t} = length{t} - length{t-del_t};
end



for t = 1+del_t : range_t
    X{t} = zeros(2,2);
    Y{t} = zeros(2,2);
    for i = 1 : 2
       for j = 1 : 2
          for n = 1:range_n
              X{t}(i,j) = X{t}(i,j) + (position{t}(n,i) - position{t}(1,i))*(position{t-del_t}(n,j) - position{t-del_t}(1,j));
              Y{t}(i,j) = Y{t}(i,j) + (position{t-del_t}(n,i) - position{t-del_t}(1,i))*(position{t-del_t}(n,j) - position{t-del_t}(1,j));
          end
       end
    end
end

s11 = [];
s12 = [];
s21 = [];
s22 = [];

for t = 1+del_t : range_t
    strain{t} = zeros(2,2);
    for i = 1 : 2
      for j = 1 : 2
        for k = 1 : 2
          strain{t}(i,j) = strain{t}(i,j) + (X{t}(i,k) / Y{t}(j,k));
        end
      end
    end

    strain{t} = strain{t} - [1 0; 0 1];
    s11 = [s11 strain{t}(1,1)];
    s12 = [s12 strain{t}(1,2)];
    s21 = [s21 strain{t}(2,1)];
    s22 = [s22 strain{t}(2,2)];

end

fig= figure;
[f,x] = hist(s11, 25);
bar(x, f/sum(f))
title('s11')

fig= figure;
[f,x] = hist(s12, 25);
bar(x, f/sum(f))
title('s12')

fig= figure;
[f,x] = hist(s21, 25);
bar(x, f/sum(f))
title('s21')

fig= figure;
[f,x] = hist(s22, 25);
bar(x, f/sum(f))
title('s22')
