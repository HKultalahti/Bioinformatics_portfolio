#!/bin/bash

# This is an example of a script for running lazypipe by Henna Kultalahti
# The names and locations are not important since this is for skill demonstration purposes only so I will not explain them

#SBATCH --job-name=lazypipe_GAGA0366
#SBATCH --output=logs/GAGA0366_%j.out
#SBATCH --error=logs/GAGA0366_%j.err
#SBATCH --time=08:00:00
#SBATCH --mem=32G
#SBATCH --cpus-per-task=8

# Loading required environments and modules
module load r-env-singularity
module load biokit
module load lazypipe

# Define input and output paths aka telling where all the datas are located
READ1="/scratch/project_2004676/GAGA_RNAseq/GAGA-IDs/GAGA-0366/worker/GAGA-0366_Lneg_worker_rep3_1.fastq.gz"
READ2="/scratch/project_2004676/GAGA_RNAseq/GAGA-IDs/GAGA-0366/worker/GAGA-0366_Lneg_worker_rep3_2.fastq.gz"
HOSTGENOME="/scratch/project_2004676/GAGA_genomes/GAGA_all_final_assemblies_softmasked/GAGA-0366_Masurca_SLR-superscaffolder_ntJoin_final_dupsrm_filt.softMasked.fasta.gz"
OUTPUT_DIR="/scratch/project_2004676/results/GAGA-0366"

# Creating output directory 
mkdir -p $OUTPUT_DIR

# Running Lazypipe
echo "Starting Lazypipe analysis for ant sample GAGA-0366 at $(date)"
sbatch-lazypipe -1 $READ1 -2 $READ2 -S lneg -p main --hostgen $HOSTGENOME -o $OUTPUT_DIR
echo "Lazypipe job completed."
