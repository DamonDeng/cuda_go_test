#include <stdio.h>
 
const int N = 16; 
 
__global__ 
void hello(char *a, int *b) 
{
	a[threadIdx.x] += b[threadIdx.x];
}

__global__ 
void SumMultiple(int inputArray[N][N], int outputArray[N][N]){
  int i = threadIdx.x;
  int j = threadIdx.y;
  
  outputArray[i][j] = 0;

  if (i > 0 && i < N-1){
    if (j > 0 && j < N-1){
      outputArray[i][j] = outputArray[i][j] + inputArray[i-1][j-1];
      outputArray[i][j] = outputArray[i][j] + inputArray[i][j-1];
      outputArray[i][j] = outputArray[i][j] + inputArray[i][j-1];
      outputArray[i][j] = outputArray[i][j] + inputArray[i+1][j-1];

      outputArray[i][j] = outputArray[i][j] + inputArray[i-1][j];
      outputArray[i][j] = outputArray[i][j] + inputArray[i][j];
      outputArray[i][j] = outputArray[i][j] + inputArray[i][j];
      outputArray[i][j] = outputArray[i][j] + inputArray[i+1][j];

      outputArray[i][j] = outputArray[i][j] + inputArray[i-1][j+1];
      outputArray[i][j] = outputArray[i][j] + inputArray[i][j+1];
      outputArray[i][j] = outputArray[i][j] + inputArray[i][j+1];
      outputArray[i][j] = outputArray[i][j] + inputArray[i+1][j+1];

    }
    
  } 

}
 
int main()
{
  
  int inputArray[N][N];
  int outputArray[N][N];

  for (int i=0; i<N; i++){
    for (int j=0; j<N; j++){
      inputArray[i][j] = i*N+j;
      outputArray[i][j] = 0;
    }
  }

  const int arraySize = N*N*sizeof(int);

  int* inputDevice;
  int* outputDevice;

  size_t inputSizeT;
  size_t outputSizeT;

	cudaMallocPitch( (void**)&inputDevice, &inputSizeT, N*sizeof(int), N ); 
  cudaMallocPitch( (void**)&outputDevice, &outputSizeT, N*sizeof(int), N );

	cudaMemcpy( inputDevice, inputArray, arraySize, cudaMemcpyHostToDevice ); 
  cudaMemcpy( outputDevice, outputArray, arraySize, cudaMemcpyHostToDevice);
	
	int numberOfBlock = 1;
	dim3 threadPerBlock( N, N );

	SumMultiple<<<numberOfBlock, threadPerBlock>>>(inputDevice, outputDevice);
  
	cudaMemcpy( outputArray, outputDevice, arraySize, cudaMemcpyDeviceToHost ); 
	cudaFree( inputDevice );
	cudaFree( outputDevice );
	
	
  for (int i=0; i<N; i++){
    for (int j=0; j<N; j++){
      inputArray[i][j] = i*N+j;
      printf("%d ", outputArray[i][j]); 
    }
    printf("/n");
  }

	return EXIT_SUCCESS;
}
