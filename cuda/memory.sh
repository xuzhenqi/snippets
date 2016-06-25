set -e

get_memory_size() {
  echo `nvidia-smi -q -d MEMORY | sed -n '12p' | cut -d':' -f2 | cut -d' ' -f2`
  return 0
}

nvcc -std=c++11 memory.cu -o build/caffe.bin

size=`get_memory_size`
while [ "$size" -lt 2000 ]
do
  echo $size
  sleep 60 
  size=`get_memory_size`
done
avail_size=$(($size-200))
./build/caffe.bin $avail_size --solver=fcn_solver.prototxt
