#!/bin/bash

# Function to process files
process_files() {
  local folder="$1"
  
  # Modify the index.qmd file
  awk '{gsub("image: \"../", "image: \"../../")} 1' "$folder/index.qmd" > "$folder/index_tmp.qmd"
  mv "$folder/index_tmp.qmd" "$folder/index.qmd"
}

# Replace "/path/to/root" with the root directory containing the subfolders
root="./staff/"

# Find and process index.qmd files
find "$root" -type f -name "index.qmd" -print0 | while IFS= read -r -d $'\0' file; do
  folder=$(dirname "$file")
  process_files "$folder"
done
