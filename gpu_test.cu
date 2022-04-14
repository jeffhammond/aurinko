#include <stdio.h>
#include <stdlib.h>

#in

#ifndef __NVCC__
#warning Please compile CUDA code with CC=nvcc.
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cuda_device_runtime_api.h>
#endif

static const int print_errors = 1;

static inline int cuda_check(cudaError_t rc)
{
    if (rc!=cudaSuccess && print_errors) {
        printf("CUDA error: %s\n", cudaGetErrorString(rc));
    }
    return rc;
}

int gpu_per_node()
{
    int nd;
    cuda_check( cudaGetDeviceCount(&nd) );
}

int gpu_stream(size_t n, float * copy, float * add, float * scale, float * triad)
{
    size_t bytes = n * sizeof(double);
    double * A;
    double * B;
    double * C;

    cuda_check( cudaMalloc((void**)&A, bytes);
    cuda_check( cudaMalloc((void**)&B, bytes);
    cuda_check( cudaMalloc((void**)&C, bytes);



    cuda_check( cudaFree((void**)&A);
    cuda_check( cudaFree((void**)&B);
    cuda_check( cudaFree((void**)&C);

}
