MPICC = mpicc
NVCC  = nvcc

CFLAGS = -g -Wall -std=c11

all: aurinko

aurinko: main.o
	$(MPICC) $^ -o $@

%.o: %.c
	$(MPICC) $(CFLAGS) -c $< -o $@

%.o: %.cu
	$(NVCC) $(CFLAGS) -c $< -o $@

clean:
	-rm -f *.o
	-rm -f aurinko

