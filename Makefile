MPICC = mpicc
NVCC  = nvcc

CUBLAS_INCLUDE = -I/usr/local/cuda-11.6/targets/x86_64-linux/include

CFLAGS = -g
MPICFLAGS = $(CFLAGS) -Wall -std=c11 -cudalib=cublas
NVCCFLAGS = $(CFLAGS) $(CUBLAS_INCLUDE)

all: aurinko

aurinko: main.o gpu_test.o
	$(MPICC) $(MPICFLAGS) $^ -o $@

%.o: %.c
	$(MPICC) $(MPICFLAGS) -c $< -o $@

%.o: %.cu
	$(NVCC) $(NVCCFLAGS) -c $< -o $@

clean:
	-rm -f *.o
	-rm -f aurinko

