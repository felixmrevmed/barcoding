#!/bin/bash

# Define the base directory and output directory
BASE_DIR="20240827_abundant_emu"
OUTPUT_DIR="01_fastqc"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Find all .fastq.gz files and run FastQC on them
find $BASE_DIR -type f -name "*.fastq.gz" | while read file; do
    echo "Running FastQC on $file"
    fastqc "$file" --outdir="$OUTPUT_DIR"
done
