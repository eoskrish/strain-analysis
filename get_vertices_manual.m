clc
clear all
close all

[filename filepath] = uigetfile('*.tif')

FileTif=[filename];
InfoImage=imfinfo(FileTif);
mImage=InfoImage(1).Width;
nImage=InfoImage(1).Height;
NumberImages=length(InfoImage);
FinalImage=zeros(nImage,mImage,NumberImages,'uint16');

TifLink = Tiff(FileTif, 'r');

for i=1:NumberImages
   TifLink.setDirectory(i);
   FinalImage(:,:,i)=TifLink.read();

end
TifLink.close();

for t = 1 : NumberImages
  imagesc(FinalImage(:,:,t))
  [xcoords(:,t),ycoords(:,t)] = ginput;   %make the vertex detection step automatic
end

dlmwrite('vertex_xcoords.dat', [xcoords], 'delimiter', '\t');
dlmwrite('vertex_ycoords.dat', [ycoords], 'delimiter', '\t');
