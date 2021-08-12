#!/usr/bin/env bash

OUT_DIR=results/fastqc/
mkdir -p $OUT_DIR

THREADS=4


docker run --user=$UID:1002 --rm -v $PWD:/proj/ pegi3s/fastqc \
	-t $THREADS \
	-o /proj/$OUT_DIR \
	$(find raw/X201SC21060946-Z01-F002/ -type f -name "*.fq.gz" -exec echo /proj/{} \;)

docker run --user=$UID:1002 --rm -v $PWD:/proj ewels/multiqc:latest \
	/proj/$OUT_DIR -o /proj/$OUT_DIR
