# DielectricSpectroscopyNaF
Within this directory are the tools required to duplicate the work performed in the paper titled "Detecting ion pairing in sodium halide solutions with dielectric spectroscopy".

The Matlab script titled "Fitting_Script.m" can be used to calculate the coefficients of the polarization density for the total simulation box and the water within that simulation box for a 1.0 mol/L NaF solution. This also includes the ability to calculate the contribution due to the ions alone for that same simulation box. Sample LAMMPS outputs are provided with the following names: Total.Polarization.1fs, Water.Polarization.1fs, Fl_z_velocities.1fs and Na_z_velocities.1fs.
The files "ReadFile.m", "ReadFile2.m", "Polarization_Fit.m" and "Current_Fit.m" are used to read the data, and to fit the parameters.

There is also a sample LAMMPS input script titled "Lammps.input" with the parameters to reproduce this data, along with the "Positions.input" which contains the positions of the atoms in the fluid.

We include a sample output from this script, "Fit_Output.csv".
