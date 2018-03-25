#include <stdio.h>
#include <sys/time.h>
#include <time.h>
#include <cuda.h>
#include <curand.h>
#include <curand_kernel.h>

const int boardSize = 21; 
const int totalSize = boardSize * boardSize;

struct BoardPoint{
  int color;
  int groupID;
  int libertyNumber;
  bool isBlackLegal;
  bool isWhiteLegal;
};


__global__
void randomInit(curandState *state, long randSeed){
  int index = threadIdx.y*boardSize + threadIdx.x;
  //curandState state;
//  long seed = 123456;
  curand_init(randSeed, index, 0, &state[index]);
//  boardPoint[index].color = curand(&state);

}


__global__
void randomTest(BoardPoint *boardPoint, curandState *state){
  int index = threadIdx.y*boardSize + threadIdx.x;
//  curandState state;
//  long seed = 123456;
//  curand_init(seed, index, 0, &state);
  boardPoint[index].color = (curand(&state[index])>>16)%361;

}

int main()
{
  BoardPoint boardHost[totalSize];
  BoardPoint *boardDevice;
  curandState *stateDevice;
//  DebugFlag debugFlagHost[totalSize];
//  DebugFlag *debugFlagDevice;
//
  const int valueSizeDevice = totalSize*sizeof(BoardPoint);
//  const int debugFlagSize = totalSize*sizeof(DebugFlag);
//
  cudaMalloc( (void**)&boardDevice, valueSizeDevice );
  cudaMalloc( (void**)&stateDevice, valueSizeDevice );
//  cudaMalloc( (void**)&debugFlagDevice, debugFlagSize );
//
//  
  dim3 threadShape( boardSize, boardSize );
  int numberOfBlock = 1;

  srand((unsigned int)time(NULL));

  randomInit<<<numberOfBlock, threadShape>>>(stateDevice, rand());

  struct timeval start_tv;
  gettimeofday(&start_tv,NULL);
  
  
  randomTest<<<numberOfBlock, threadShape>>>(boardDevice, stateDevice);
  
//  for (int i=0; i<19; i++){
//    playBoard<<<numberOfBlock, threadShape>>>(boardDevice, globalFlag, i, i, 2);
//  }
  cudaDeviceSynchronize();

  cudaMemcpy( boardHost, boardDevice, valueSizeDevice, cudaMemcpyDeviceToHost );
//  cudaMemcpy( debugFlagHost, debugFlagDevice, debugFlagSize, cudaMemcpyDeviceToHost );
//
//
  cudaFree( boardDevice );
//  cudaFree( debugFlagDevice );
//  
  cudaDeviceSynchronize();
//
  struct timeval end_tv;
  gettimeofday(&end_tv,NULL);

  for (int i=boardSize-1; i>=0; i--){
    for (int j=0; j<boardSize; j++){
      int index = i*boardSize + j;
      printf("%d| ",boardHost[index].color);
    }
    printf("\n");
   
  }

 

  if(end_tv.tv_usec >= start_tv.tv_usec){
    printf("time %lu:%lu\n",end_tv.tv_sec - start_tv.tv_sec,  end_tv.tv_usec - start_tv.tv_usec);
  }else{
    printf("time %lu:%lu\n",end_tv.tv_sec - start_tv.tv_sec - 1,  1000000 - start_tv.tv_usec + end_tv.tv_usec);
  }

  
  return EXIT_SUCCESS;
  
}
