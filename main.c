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

    MPI_Comm node;
    MPI_Comm_split_type(MPI_COMM_WORLD, MPI_COMM_TYPE_SHARED, me, MPI_INFO_NULL, &node);

    int node_rank, node_size;
    MPI_Comm_rank(node, &node_rank);
    MPI_Comm_size(node, &node_size);


    MPI_Comm_free(&node);

    MPI_Finalize();

    return 0;
}
