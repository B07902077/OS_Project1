
# all: cnt
all: process scheduler cnt

process:
	gcc -O2 process.c tools.c -o process

scheduler:
	gcc -O2 FIFO.c tools.c merge_sort.c -o FIFO
	gcc -O2 RR.c tools.c merge_sort.c -o RR
	gcc -O2 SJF.c tools.c merge_sort.c heap.c -o SJF
	gcc -O2 PSJF.c tools.c merge_sort.c heap.c -o PSJF
	gcc -O2 scheduler.c tools.c -o scheduler

cnt:
	gcc -O2 cnt.c tools.c merge_sort.c heap.c -o cnt

clean:
	@rm process scheduler FIFO SJF RR PSJF cnt
