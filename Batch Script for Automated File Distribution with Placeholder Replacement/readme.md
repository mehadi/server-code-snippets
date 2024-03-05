# Batch Script for Automated File Distribution with Placeholder Replacement

This script is useful for automating the process of copying a specific file to multiple subdirectories under a specified root directory. It is particularly handy when you have a template file that you need to distribute to various subfolders, with each copy customized based on the name of the subfolder.

## Usage

1. Ensure you have Windows operating system.
2. Modify the variables in the script to match your requirements:
    - `sourceDir`: The directory where the source file is located.
    - `fileName`: The name of the source file.
    - `destinationRoot`: The root directory where the file will be copied to.
3. Run the batch script by double-clicking it or executing it via the command line.

## Description

- This script utilizes a nested loop to iterate over all subdirectories under the specified root directory.
- It extracts the name of each subdirectory and incorporates it into the filename of the copied file.
- The script dynamically replaces a placeholder (in this case, `COMPANY`) in the filename with the name of each subdirectory.
- It checks for the existence of the source directory, source file, and destination root directory before proceeding with the copying process.

## Notes

- Make sure to replace `COMPANY` with a placeholder that accurately represents the part of the filename you want to replace with the subdirectory names.
- This script relies on the presence of a specific file in the source directory with a fixed filename. Modify the script accordingly if you want to handle different filenames or file types.

