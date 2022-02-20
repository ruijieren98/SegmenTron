#!/bin/sh
### General options
### –- specify queue -- (gpuv100/gpua100) --
#BSUB -q gpua100 
### -- set the job Name --
JOB="danet"
#BSUB -J "danet" 
### -- ask for number of cores (default: 1) --
#BSUB -n 12
#BSUB -R "span[hosts=1]" 
### -- Select the resources: 2 gpu in exclusive process mode --
#BSUB -gpu "num=2:mode=exclusive_process"
### -- specify gpu memory
###BSUB -R "select[gpu32gb]"
### -- set walltime limit: hh:mm --  maximum 24 hours for GPU-queues right now
#BSUB -W 24:00
# request 5GB of system-memory
#BSUB -R "rusage[mem=10GB]"
### -- set the email address --
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u s210203@student.dtu.dk
### -- send notification at start --
#BSUB -B
### -- send notification at completion--
#BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -o gpu_%J.out
#BSUB -e gpu_%J.err
# -- end of LSF options --

nvidia-smi
# Load the cuda module
## module load cuda/11.5
module load python3/3.6.2
###python3 -m venv torch2
###source torch2/bin/activate
###python -m pip install pyhocon

echo "=> $JOB start"

cd /zhome/f9/4/160189/ 
source env_a100/bin/activate
cd /zhome/f9/4/160189/SegmenTron/
bash train_danet_mul_gpus.sh
