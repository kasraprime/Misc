#!/bin/bash

for num_epochs in 100
do
sbatch /home/bq93815/ferraro_user/manifold_runner.slurm  $num_epochs
done