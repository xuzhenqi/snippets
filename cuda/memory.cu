#include <cuda_runtime.h>
#include <iostream>
using namespace std;

int main(int argc, char* argv[]) {
  long long size = 0;
  if (argc < 2) {
    size = 2000000000;
  } else {
    size = stoll(argv[1]) * 1000000;
  }
  cout << "size: " << size << endl;
  float *pd[10];
  cudaError_t err = cudaSuccess;
  for (int i = 0; i < 10; ++i) {
    err = cudaMalloc(pd+i, size/10);
    if (err != cudaSuccess) {
      cout << i << "cudaMalloc Failed" << endl;
    }
  }
  cout << "Type a key: ";
  cin.ignore();
  for (int i = 0; i < 10; ++i) {
    cudaFree(pd + i);
  }
  return 0;
}
