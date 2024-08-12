#!/bin/bash
set -ex

echo "Compiling test program..."
gcc -o test_htslib test_htslib.c $(pkg-config --cflags --libs htslib)

echo "Running test program..."
./test_htslib

echo "Checking for htslib executables..."
which bgzip
which tabix

echo "All tests passed successfully!"