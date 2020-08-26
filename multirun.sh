echo ""
echo "The following script will assess your device's capabilities for OMP parallelization"
echo "WARNING: The script will also reset the number of OMP threads by default to 1"
echo "It is recommended that you capture all output"
echo "Beginning now!"

make

for thread_num in 1 2 4 8 16 32 64 128
do
    export OMP_NUM_THREADS=$thread_num
    ./omp-assess
done

export OMP_NUM_THREADS=1

echo "Complete"