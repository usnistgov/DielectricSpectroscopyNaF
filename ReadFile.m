function [Pzz] = ReadFile(file);
ColVar=8; % which input column to read from the file
fid = fopen(file);
C = textscan(fid,'%f %f \n %f %f \n %f %f \n %f %f');
Pzz=C{ColVar};
fclose(fid);
length(Pzz);
end