#!/bin/bash

# Function to process files
process_files() {
  local file="$1"
  local dir=$(dirname "$file")
  local new_dir="$dir/$(basename "$file" .qmd)"
  
  mkdir -p "$new_dir" && mv "$file" "$new_dir/index.qmd"
}

# Replace "/path/to/root" with the root directory containing the subfolders
root="./staff/"

# Find and process .qmd files
find "$root" -type f -name "*.qmd" -print0 | while IFS= read -r -d $'\0' file; do
  process_files "$file"
done


