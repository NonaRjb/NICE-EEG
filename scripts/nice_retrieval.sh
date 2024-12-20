#!/usr/bin/env bash
#SBATCH -A berzelius-2024-324
#SBATCH --mem 60GB
#SBATCH --gpus=1
#SBATCH --ntasks=3
#SBATCH --cpus-per-task=4
#SBATCH -t 2-00:00:00
#SBATCH --mail-type FAIL
#SBATCH --mail-user nonar@kth.se
#SBATCH --output /proj/rep-learning-robotics/users/x_nonra/NICE-EEG/logs/%J_slurm.out
#SBATCH --error  /proj/rep-learning-robotics/users/x_nonra/NICE-EEG/logs/%J_slurm.err

cd /proj/rep-learning-robotics/users/x_nonra/NICE-EEG/

module load Mambaforge/23.3.1-1-hpc1-bdist
mamba activate BCI

result_dir="/proj/rep-learning-robotics/users/x_nonra/NICE-EEG/outputs/"

python nice_stand.py --result_path "$result_dir" --dnn "harmonization_vitb16" --epoch 200 \
--num_sub 10 --batch-size 1000 --seed 42