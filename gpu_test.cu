#include <stdio.h>
#include <stdlib.h>

#ifndef __NVCC__
#warning Please compile CUDA code with CC=nvcc.
#include <cuda.h>
#include <cuda_runtime.h>
#include <cuda_runtime_api.h>
#include <cuda_device_runtime_api.h>
#endif

#include <cublas_v2.h>

#include "stream.h"

static const int print_errors = 1;

static inline int cuda_check(cudaError_t rc)
{
    if (rc!=cudaSuccess && print_errors) {
        printf("CUDA error: %s\n", cudaGetErrorString(rc));
    }
    return rc;
}

static inline int cublas_check(cublasStatus_t rc)
{
    if (rc!=CUBLAS_STATUS_SUCCESS && print_errors) {
        printf("CUBLAS error: %d\n", rc);
    }
    return rc;
}

int gpu_per_node()
{
    int nd;
    cuda_check( cudaGetDeviceCount(&nd) );
    return nd;
}

int gpu_stream(int times, int n, float * copy, float * add, float * scale, float * triad)
{
    cublasHandle_t handle;
    cublas_check( cublasCreate( &handle) );

    size_t bytes = n * sizeof(double);
    double * A;
    double * B;
    double * C;
    double * R;

    cuda_check( cudaMalloc((void**)&A, bytes) );
    cuda_check( cudaMalloc((void**)&B, bytes) );
    cuda_check( cudaMalloc((void**)&C, bytes) );
    cuda_check( cudaMalloc((void**)&R, bytes) );

    double value;
    {
        value = 1.0;
        cublas_check( cublasSetVector(n, sizeof(double), &value, 0, A, 1) );
        value = 2.0;
        cublas_check( cublasSetVector(n, sizeof(double), &value, 0, B, 1) );
        value = 0.0;
        cublas_check( cublasSetVector(n, sizeof(double), &value, 0, C, 1) );
    }

    for (int i=0; i<times; ++i) {

    }

    cuda_check( cudaFree((void**)&A) );
    cuda_check( cudaFree((void**)&B) );
    cuda_check( cudaFree((void**)&C) );
    cuda_check( cudaFree((void**)&R) );

    cublas_check( cublasDestroy(handle) );

    return 0;
}
