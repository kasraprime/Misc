#!/bin/bash
#SBATCH --job-name=random_experiment         # Job name
#SBATCH --gres=gpu:4						 # Number of GPUs you want to use
#SBATCH --mem=20000 						 # 20000 or 20G
#SBATCH --constraint=rtx_8000				 # rtx_8000 or rtx_2080 or hpcf2018
#SBATCH --time=5:00:00						 # Max amount of time your job will be running before termination
#SBATCH --partition=develop         	     # Partition. change to gpu for actually using clusters
#SBATCH --qos=medium+                   	 # if --time is not available to use 
#SBATCH --nodes=1                    		 # Number of nodes
#SBATCH --ntasks-per-node=1             	 # MPI processes per node
#SBATCH --output=slurm.out
#SBATCH --workdir=/path/to/save/your/outputs
#SBATCH --error=slurm.err
#SBATCH --account=pi_ferraro 


# get variable arguments (hyperparameters) from sbatch command in order of appearance, and call your python code.
num_epochs="${1}"	# or num_epochs=$1
model="${2}"

# Mostly constant arguments
script_file=/path/to/your/code.py
exp_name=random-experiment
task_name=uw

printf "\n"
echo "${exp_name} using ${model} submitted"
printf "\n"

for iter in 1
do
echo "iter number $iter"
python ${script_file} --experiment_name $exp_name --num_epochs $num_epochs --task_name $task_name --model $model
done