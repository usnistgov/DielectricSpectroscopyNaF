function [Vel] = ReadFile(file)
ColVar=2; % which input column to read from the file
fid = fopen(file);
C = textscan(fid,'%f %f');
Vel=C{ColVar};
fclose(fid);
length(Vel);
end