#include <stdio.h>
#include <sys/time.h>
#include <time.h>

 
const int N = 16; 
const int blocksize = 16; 
 
__global__ 
void hello(int *a, int *b) 
{
  for (int i=0; i<10000000; i++){
  	a[threadIdx.x] += b[threadIdx.x];

  }
}
 
int main()
{
	int a[N]; // = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
	int b[N]; // = {15, 10, 6, 0, -11, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
 
  for (int i=0; i<N; i++){
    a[i] = 1;
    b[i] = 1;
  }

  struct timeval start_tv;
  gettimeofday(&start_tv,NULL);
  //printf("time %u:%u\n",tv.tv_sec,tv.tv_usec);

  //time_t t = time(NULL);
  //struct tm tm = *localtime(&t);

  //printf("year: %d \n", tm.tm_year);

  //std::time_t startTime = std::time(nullptr);
  //time_t startTime = time(NULL);
  //time(&startTime);
  
	int *ad;
	int *bd;
	const int csize = N*sizeof(int);
	const int isize = N*sizeof(int);

  //for (int j=0; j<10000; j++){
	  cudaMalloc( (void**)&ad, csize ); 
	  cudaMalloc( (void**)&bd, isize ); 
	  cudaMemcpy( ad, a, csize, cudaMemcpyHostToDevice ); 
	  cudaMemcpy( bd, b, isize, cudaMemcpyHostToDevice ); 
	  
	  dim3 dimBlock( blocksize, 1 );
	  dim3 dimGrid( 1, 1 );
	  hello<<<dimGrid, dimBlock>>>(ad, bd);
	  cudaMemcpy( a, ad, csize, cudaMemcpyDeviceToHost ); 
	  cudaFree( ad );
	  cudaFree( bd );


  //}
  
  cudaDeviceSynchronize();

  //time_t endTime;
  //time(&endTime);
  struct timeval end_tv;
  gettimeofday(&end_tv,NULL);
 
  for (int i=0; i<N; i++){
    printf("%d ", a[i]);
	   
  }

  printf("\n");

  //printf("start time: %f \n", startTime);
  //printf("end time: %f \n", endTime);
  //printf("time used: %f \n", endTime-startTime);
  if(end_tv.tv_usec >= start_tv.tv_usec){
    printf("time %u:%u\n",end_tv.tv_sec - start_tv.tv_sec,  end_tv.tv_usec - start_tv.tv_usec);
  }else{
    printf("time %u:%u\n",end_tv.tv_sec - start_tv.tv_sec,  1000000 - start_tv.tv_usec + end_tv.tv_usec);
  }

  
  return EXIT_SUCCESS;
}
