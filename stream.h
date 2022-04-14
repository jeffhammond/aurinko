__global__ void copy(const size_t n, const double scalar, const double * A, double * C)
{
    const size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        C[i] = A[i];
    }
}

__global__ void scale(const size_t n, const double scalar, const double * C, double * B)
{
    const size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        B[i] = scalar * C[i];
    }
}

__global__ void add(const size_t n, const double * A, const double * B, double * C)
{
    const size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}

__global__ void triad(const size_t n, const double scalar, double * A, const double * B, const double * C)
{
    const size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        A[i] = B[i] + scalar * C[i];
    }
}
