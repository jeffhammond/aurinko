__global__ void init(const int n, const double value, double * A)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        A[i] = value;
    }
}

__global__ void copy(const int n, const double scalar, const double * A, double * C)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        C[i] = A[i];
    }
}

__global__ void scale(const int n, const double scalar, const double * C, double * B)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        B[i] = scalar * C[i];
    }
}

__global__ void add(const int n, const double * A, const double * B, double * C)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        C[i] = A[i] + B[i];
    }
}

__global__ void triad(const int n, const double scalar, double * A, const double * B, const double * C)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        A[i] = B[i] + scalar * C[i];
    }
}
