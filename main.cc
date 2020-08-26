#include <chrono>
#include <iostream>
#include <omp.h>
#include <vector>

inline int fib(int n)
{
    if (n < 2)
    {
        return 1;
    }
    return fib(n - 2) + fib(n - 1);
}

int main(int argc, char *argv[])
{
    const unsigned ITER_NUM = 100;
    const unsigned FIB_NUM = 39;

    std::vector<unsigned> vals(ITER_NUM);

    auto start = std::chrono::high_resolution_clock::now();

// parallel code timing
#pragma omp parallel for
    for (size_t i = 0; i < ITER_NUM; i++)
    {
        vals[i] = fib(FIB_NUM);
    }

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> diff = end - start;

    std::cout << "THREAD #: " << omp_get_max_threads() << " | TIME: " << diff.count() << std::endl;
}