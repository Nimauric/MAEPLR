#!/bin/bash
#SBATCH --job-name=mapler 
#SBATCH --time=3-00:00:00
#SBATCH --mem=5G

output_directory=$(grep "output_directory:" config/config.yaml | cut -d " " -f 2)
analysis_name=$(grep "analysis_name:" config/config.yaml | cut -d " " -f 2)


if [ -d "$output_directory/logs/$analysis_name" ]; then
    echo "analysis already exists. Please use a different name."
    exit 1
fi

mkdir -p $output_directory/logs/$analysis_name
cp config/config.yaml $output_directory/logs/$analysis_name/config.yaml
export SBATCH_DEFAULTS=" --output=$output_directory/logs/$analysis_name/"


snakemake all --cores all  --slurm --jobs 10 \
    --use-conda --rerun-triggers mtime \
    --configfile $output_directory/logs/$analysis_name/config.yaml \
    --default-resources mem_mb=5000 mem_mb_per_cpu=None runtime=2*60 
    
