#!/bin/bash

# loop over all the arguments you want to tune in this file, and then pass it to sbatch.

for num_epochs in 50 100
do
for model in vae gan
do
sbatch code_runner.slurm $num_epochs $model
done
done