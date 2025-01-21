#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

# Create two files
touch file1.txt
touch file2.txt

# Create a lock file
lock_file="file1.txt.lock"

# Function to acquire the lock
function acquire_lock() {
  while ! flock -n "$lock_file"; do
    sleep 0.1
  done
}

# Function to release the lock
function release_lock() {
  flock -u "$lock_file"
  rm -f "$lock_file"
}

# Process 1
(acquire_lock; echo "Process 1"; release_lock) &

# Process 2
(acquire_lock; echo "Process 2"; release_lock) &

# Wait for both processes to finish
wait

# Check the contents of file1.txt. The content will be predictable
cat file1.txt

# Clean up
rm file1.txt file2.txt $lock_file