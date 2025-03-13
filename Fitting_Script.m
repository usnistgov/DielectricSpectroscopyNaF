%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file was created by Michael Woodcox on: 02/26/2025             %
% PURPOSE: To read in a LAMMPS output file that contains the          %
% polarization density of the total box and the water component,      %
%  as well as the velocity information of additional components,      %
% then fit those values to a linear combination of sin and cos        %
% functions. This requires reading the ReadFile and ReadFile2,        %
% along with the Polarization_Fit and Current_Fit files, which        %
% accompany this script.                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
omega=1E9; %simulation frequency in Hz
stepCount=500000; %number of steps in simulation
dt=1*10^-15; %time step of simulation in seconds
f=(2*pi*omega*dt); %conversion between linear and angular frequency

%Reading in each data type
file='Total.Polarization.1fs'; %Polarization of the total simulation box
[Pzz]=ReadFile(file); %reading in polarization density from z-direction
Pz=Pzz(1:1+stepCount);

file='Water.Polarization.1fs'; %Polarization of water in the simulation box
[Pzzw]=ReadFile(file); %reading in polarization density from z-direction
Pzw=Pzzw(1:1+stepCount);

file='Fl_z_velocities.1fs'; %Velocitites of Fl atoms in the simulation box
[Vel]=ReadFile2(file); %reading in z-component of the velocity
fl=Vel(1:1+stepCount);
fl_c=fl*-1; %multiplying by charge on Fl
fl_cw=fl_c/f; %converting between linear and angular frequency

file='Na_z_velocities.1fs'; %Velocitites of Na atoms in the simulation box
[Vel]=ReadFile2(file); %reading in z-component of the velocity
na=Vel(1:1+stepCount);
na_c=na*1; %multiplying by charge on Na
na_cw=na_c/f; %converting between linear and angular frequency

joint = fl_cw+na_cw; %combinine Fl and Na data

step = [1:stepCount+1]; 
t= step*dt; %conversion of step number to time in seconds
u = 2*pi*t*omega; % conversion to omega*t form

%Fitting different components of the data
f1=Polarization_Fit(u,Pz);
c1= coeffvalues(f1);
a=c1(1,1);
b=c1(1,2);

f2=Polarization_Fit(u,Pzw);
c2= coeffvalues(f2);
c=c2(1,1);
d=c2(1,2);

f3=Current_Fit(u,joint);
c3= coeffvalues(f3);
e=c3(1,1);
f=c3(1,2);

writematrix([a, c, e; b, d, f], 'Full_Run_Fit_results.csv');
