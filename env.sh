#!/bin/bash
#SBATCH --job-name=sample
#SBATCH -A research
#SBATCH -p long
#SBATCH -c 10
#SBATCH --gres=gpu:1
#SBATCH --time=4-00:00:00
#SBATCH --output env-log.log
#SBATCH --mail-type=ALL
#SBATCH --mail-user=harsha.vasamsetti@research.iiit.ac.in

echo "mkdir"
mkdir /scratch/harsha.vasamsetti

echo "chdir"
cd /scratch/harsha.vasamsetti

# Setting up the conda environment
echo "Creating Conda Environment"
conda create --name slices python=3.9 -y

echo "Activating the environment"
echo $(ls)
source /home2/harsha.vasamsetti/miniconda3/bin/activate slices

# Installing packages
echo "Installing SLICES and other dependencies"
pip install slices
pip install protobuf==3.20.0
pip install setuptools>=18.0
pip install numpy==1.23.5
pip install m3gnet==0.2.4
pip install scikit-learn<=1.3.1
pip install smact
pip install matplotlib
pip install pandas
pip install torch

# Additional setup commands can be added here

echo "Setup complete"
