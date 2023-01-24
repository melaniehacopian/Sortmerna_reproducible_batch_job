#!/bin/bash -l

#SBATCH --job-name=sortmerna         ## Name of the job.
#SBATCH  -A <account>                        ## Account to charge
#SBATCH -p standard                 ## Partition/queue name
#SBATCH --cpus-per-task=36           ## number of cpus
#SBATCH --mem-per-cpu=3G           ## memory per cpu
#SBATCH --mail-user= <your email>    ## Be notified by email when your job starts, ends or is killed.
#SBATCH --mail-type=ALL
#SBATCH --time=1-00:00:00          ##Specify desired time limit
#SBATCH -o myoutput_%j.out          ## File to which STDOUT will be written, %j inserts jobid
#SBATCH -e myerrors_%j.err          ## File to which STDERR will be written, %j inserts jobid

conda activate <your_conda_environment>

FPATH=/path/to/your/trimmed/reads

DPATH=/path/to/your/reference/databases

/miniconda3/envs/your_conda_environment/bin/sortmerna --workdir . --ref $DPATH/silva-arc-16s-id95.fasta --ref $DPATH/rfam-5.8s-database-id98.fasta --ref $DPATH/rfam-5s-database-id98.fasta --ref $DPATH/silva-arc-23s-id98.fasta --ref $DPATH/silva-bac-16s-id90.fasta --ref $DPATH/silva-bac-23s-id98.fasta --ref $DPATH/silva-euk-18s-id95.fasta --ref $DPATH/silva-euk-28s-id98.fasta --reads $FPATH/trimmed_reads_1_paired.fq --reads $FPATH/trimmed_reads_2_paired.fq --fastx  --aligned rRNA --other mRNA --out2 --sout --threads 36 

