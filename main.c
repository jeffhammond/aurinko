#include <stdio.h>
#include <stdlib.h>

#include <mpi.h>

int main(int argc, char * argv[])
{
    int me, np;
    {
        int required = MPI_THREAD_FUNNELED;
        int provided;
        MPI_Init_thread(&argc,&argv,required,&provided);

        MPI_Comm_rank(MPI_COMM_WORLD, &me);
        MPI_Comm_size(MPI_COMM_WORLD, &np);

        if (required < provided) {
            if (me == 0) {
                printf("MPI_THREAD_FUNNELED not provided\n");
            }
        }
    }






    MPI_Finalize();

    return 0;
}
