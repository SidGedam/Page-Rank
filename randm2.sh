#!/bin/bash

# Specify the number of pages
NUM_PAGES=18000

# Create a new text file for input
INPUT_FILE="18k.txt"

# Generate random links between pages
for ((i = 1; i <= NUM_PAGES; i++)); do
    # Randomly select the number of links for each page (between 1 and 5)
    NUM_LINKS=$((RANDOM % 5 + 1))

    # Generate links for the current page
    for ((j = 1; j <= NUM_LINKS; j++)); do
        # Randomly select a target page (excluding the current page)
        TARGET_PAGE=$((RANDOM % NUM_PAGES + 1))
        while [[ $TARGET_PAGE -eq $i ]]; do
            TARGET_PAGE=$((RANDOM % NUM_PAGES + 1))
        done

        # Write the link to the input file
        echo "$i $TARGET_PAGE" >> "$INPUT_FILE"
    done
done

# Calculate total number of pages and total links
TOTAL_PAGES=$NUM_PAGES
TOTAL_LINKS=$(wc -l < "$INPUT_FILE")
echo "$TOTAL_PAGES"
echo "$TOTAL_LINKS"
# Add header to the output file
