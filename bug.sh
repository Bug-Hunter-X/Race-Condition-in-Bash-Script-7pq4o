#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously that try to write to file1.txt
(echo "Process 1" > file1.txt) &
(echo "Process 2" > file1.txt) &

# Wait for both processes to finish
wait

# Check the contents of file1.txt.  The content will be unpredictable
cat file1.txt

# Clean up
rm file1.txt file2.txt