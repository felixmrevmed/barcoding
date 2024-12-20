#!/bin/bash

# Define the base directory and output directory
BASE_DIR="20240827_abundant_emu"
OUTPUT_DIR="02_trim_galore"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Find all .fastq.gz files and run Trim Galore on them
find $BASE_DIR -type f -name "*.fastq.gz" | while read file; do    
    # Run Trim Galore
    echo "Running Trim Galore on $file"
    TrimGalore-0.6.10/trim_galore "$file" \
    --output_dir "$OUTPUT_DIR" \
    --cores 8 \
    --fastqc
done
