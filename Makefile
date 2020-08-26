	CXX = g++-9
	CXXFLAGS = -fopenmp -O3 -std=c++17 -funroll-loops -march=native -Wno-unused -Wall -I. -g

default: qpesim

qpesim: main.cc $(SRCS) $(HEADERS)
	$(CXX) -DDOCTEST_CONFIG_DISABLE $(CXXFLAGS) -o omp-assess main.cc $(SRCS) $(LDFLAGS)

.PHONY: all clean

clean:
	rm -f *.o *~
	rm -f tests
	rm -f qpesim
