#!/bin/bash

# Define the input and output directories
INPUT_DIR="02_trim_galore"
OUTPUT_DIR="04_fq.gz_to_fasta"

# Create the output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Find all .fq.gz files in the input directory and process them
for file in $INPUT_DIR/*.fq.gz; do
    # Get the base name of the file (without path and extension)
    base_name=$(basename "$file" .fq.gz)
    
    # Define the output file name
    output_file="$OUTPUT_DIR/${base_name}.fa"
    
    # Convert the .fq.gz file to FASTA format and save it
    zcat "$file" | \
        awk 'NR%4==1 {print ">"$1} NR%4==2' > "$output_file"
    
    echo "Converted $file to $output_file"
done
