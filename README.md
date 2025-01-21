# Race Condition Bug in Bash
This repository demonstrates a simple race condition bug in a bash script.  Two processes attempt to write to the same file simultaneously, resulting in unpredictable and potentially corrupted output. The solution showcases a proper way to handle concurrent file access using locking mechanisms.

## Bug Description
The `bug.sh` script creates two processes that race to write to the `file1.txt` file. The final content of `file1.txt` is unpredictable due to the race condition.

## Solution
The `bugSolution.sh` script addresses the race condition by using a lock file to ensure that only one process can write to `file1.txt` at a time.