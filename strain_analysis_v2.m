close all

xcoords = load('vertex_xcoords.dat');
ycoords = load('vertex_ycoords.dat');

range_n = size(xcoords,1);
range_t = size(xcoords,2);
% range_t = 2;

position = cell(range_t, 1);
for t = 1 : range_t
    position{t} = [xcoords(:,t) ycoords(:,t)];
end

del_t = 1;
X = cell(range_t-del_t,1);
Y = cell(range_t-del_t,1);
strain = cell(range_t-del_t,1);


% for t = 1 : range_t
%     length{t} = zeros(6,6);
%     for n = 1 : range_n
%         for m = 1 : n
%             length{t}(n,m) = sqrt((position{t}(n,:) - position{t}(m,:))*transpose(position{t}(n,:) - position{t}(m,:)));
%             length{t}(m,n) = length{t}(n,m);
%         end
%     end
% end


for t = 1+del_t : range_t
    X{t-del_t} = zeros(2,2);
    Y{t-del_t} = zeros(2,2);
    for i = 1 : 2
       for j = 1 : 2
          for n = 2:range_n
              X{t-del_t}(i,j) = X{t-del_t}(i,j) + (position{t}(n,i) - position{t}(1,i))*(position{t-del_t}(n,j) - position{t-del_t}(1,j));
              Y{t-del_t}(i,j) = Y{t-del_t}(i,j) + (position{t-del_t}(n,i) - position{t-del_t}(1,i))*(position{t-del_t}(n,j) - position{t-del_t}(1,j));
          end
       end
    end
    Y{t-del_t} = inv(Y{t-del_t});
end

D_sq = cell(range_t-del_t,1);
I = [1,0;0,1];

for t = 1 : range_t-del_t
    strain{t} = zeros(2,2);
    for i = 1 : 2
      for j = 1 : 2
        for k = 1 : 2
          strain{t}(i,j) = strain{t}(i,j) + (X{t}(i,k) * Y{t}(j,k));
        end
      end
    end
    strain{t} = strain{t} - I;

    D_sq{t} = 0;
    for n = 2 : range_n
      dummyn = 0;
      for i = 1 : 2
        % dummy1 = 0;
        % dummy1 = dummy1 + (position{t+del_t}(n,i) - position{t+del_t}(1,i));
        dummy = 0;
        for j = 1 : 2
          dummy = dummy + (I(i,j) + strain{t}(i,j))*(position{t}(n,j) - position{t}(1,j));
        end
        dummyn = dummyn + ((position{t+del_t}(n,i) - position{t+del_t}(1,i)) - dummy)^2;
        % dummyn = dummyn + dummy1^2;
      end
      D_sq{t} = D_sq{t} + dummyn;
    end
end

s1 = [];
s2 = [];
s3 = [];

for i = 1 : range_t-del_t
  s1 = [s1, 0.5*trace(strain{i})];
  s2 = [s2, 0.5*(strain{i}(1,1)-strain{i}(2,2))];
  s3 = [s3, 0.5*(strain{i}(1,2)+strain{i}(2,1))];
end

[val,pos] = hist(s1);
plot(pos, val/trapz(pos,val), '*-');
hold on
[val,pos] = hist(s2);
plot(pos, val/trapz(pos,val), 'r*-');
[val,pos] = hist(s3);
plot(pos, val/trapz(pos,val), 'g*-');
legend('e1','e2','e3')
