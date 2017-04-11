% in this code ref point is fixed at the 1st frame

clc
%clear all
close all

% delete mytiff.tif
% file_xcoords = uigetfile('*.dat')
xcoords = load('vertex_xcoords.dat');
ycoords = load('vertex_ycoords.dat');

range_i = size(xcoords,1);
range_t = size(xcoords,2) - 1;

xcoords = [xcoords; xcoords(1,:)];
ycoords = [ycoords; ycoords(1,:)];

u = cell(range_i, range_t);
dx = cell(range_i, range_t);
s = cell(range_i, range_t);
s_comp = cell(range_i, range_t);

count = 1;

for t = 2 : range_t

  for i = 1 : range_i
    u{i,t} = [xcoords(i,t) - xcoords(i,1); ycoords(i,t) - ycoords(i,1)]; %displacement wrt initial position at t=0
    dx{i,t} = [xcoords(i+1,1) - xcoords(i,1); ycoords(i+1,1) - ycoords(i,1)]; %original radius vectors
  end
  u{7,t} = u{1,t};

  for i = 1 : range_i
    du{i,t} = u{i+1,t} - u{i,t};
    %strain_a,b wrt t=0
    for a = 1:2
      for b = 1:2
        s{i,t}(a,b) = (du{i,t}(a)/dx{i,t}(b) + du{i,t}(b)/dx{i,t}(a));
        for c = 1:2
          s{i,t}(a,b) = s{i,t}(a,b) + (du{i,t}(c)/dx{i,t}(a)) * (du{i,t}(c)/dx{i,t}(b));
        end
      end
    end
    s{i,t} = 0.5*s{i,t};
  end

  for i = 1 : range_i
    s_comp{i,t}(1) = ( s{i,t}(1,1) + s{i,t}(2,2) ) / 2;
    s_comp{i,t}(2) = ( s{i,t}(1,1) - s{i,t}(2,2) ) / 2;
    s_comp{i,t}(3) = ( s{i,t}(1,2) + s{i,t}(2,1) ) / 2 ;
    s1(count) = s_comp{i,t}(1);
    s2(count) = s_comp{i,t}(2);
    s3(count) = s_comp{i,t}(3);
    count = count + 1;
  end

end
count = count -1
close all;


nbins = 50;
figure(1)
[f,x] = hist(s1, nbins);
bar(x,f/trapz(x,f));
xlabel('s1')
ylabel('pdf of s1')
print('pdf_s1', '-djpeg')

figure(2)
[f,x] = hist(s2, nbins);
bar(x,f/trapz(x,f));
xlabel('s2')
ylabel('pdf of s2')
print('pdf_s2', '-djpeg')

figure(3)
[f,x] = hist(s3, nbins);
bar(x,f/trapz(x,f));
xlabel('s3')
ylabel('pdf of s3')
print('pdf_s3', '-djpeg')

% print('histogram')
