#!/bin/bash
input=$1
workernum=$2
output=$3

inter_dir="temp"
min_height=49.9
max_height=250.1
gap=$(python -c "print ($max_height - $min_height) / $workernum")

# map
for i in `seq $workernum`
do
	awk -v i="$i" -v min="$min_height" -v gap="$gap" '{
	if ($2 >= (min + (i-1)*gap) && $2 < (min + i*gap)) {
		print $0;
	}
	}' $input > $inter_dir/$i.txt 
done

# reduce
for i in `seq $workernum`
do
	python reduce.py $inter_dir/$i.txt $inter_dir/${i}_sort.txt
done

# get_output
rm -f $output
touch $output
for i in `seq $workernum`
do
	cat $inter_dir/${i}_sort.txt >> $output
done
rm -rf $inter_dir
