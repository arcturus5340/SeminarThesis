#!/usr/bin/zsh

### SBATCH Section
#SBATCH --beeond
#SBATCH --nodes=1

#SBATCH --ntasks-per-node=16

# Ask for less than 4 GB memory per (cpu) task=MPI rank
#SBATCH --mem-per-cpu=3900M

# Name the job
#SBATCH --job-name=H5Bench

# Declare file where the STDOUT/STDERR outputs will be written
# SBATCH --output=output.%J.txt

### Your Program Section
cp -r $HOME/h5bench $BEEOND
cd $BEEOND/h5bench/bin
module load HDF5
./h5bench sync-write-1d-contig-contig.json
rsync -av --exclude=storage/test.h5 storage $HOME
