# Report
2020 Operating System Project 1
B07902077 資工二 黃嘉宏
## Design
### 1. FIFO
* Sort every process according to its ready time.
* For each process, if the ready time is equal to the current time, then put the process into a waiting queue.
* If there are no any running processes, and some processes are in the queue, pop out and execute the process until the end of its execution.
* The running process will have higher priority.
* Functions:
    * `change_priority()` : examine if there is a running process and if there are some processes waiting in the queue. If no process is running and there are some processes waiting in the queue, run the next process. Otherwise, raise the priority of the next process.
    * `sig_child()` : wait for complete child process and count the number of them. Once the number of complete processes is equal to the total number, exit the function.
    * `FIFO()` : Sort the processes first. While there are some unfinished tasks, pop one out and execute the process until the end of its execution. For all processes that are ready, create process (fork and execute), put the next ready process into queue, change priorities, and run a unit of time.
* References:
    * Mr. Opengate:  https://mropengate.blogspot.com/2015/01/operating-system-ch5-cpu-scheduling.html
    * Quora: https://www.quora.com/How-do-I-write-a-simple-code-in-C-for-FIFO-scheduling

### 2. RR
* Use timer to get the period fixed. After the running process has been executed for a period, put it into the waiting queue and select the next ready process.
* Sort every process according to its ready time.
* For each process, if the ready time is equal to the current time, then put the process into a waiting queue.
* If there are no any running processes, and some processes are in the queue, pop out and execute the process. Calculate if the process will end in a period. If not, reduce a period from its remaining execution time after the execution, and put the process back into the queue.
* The running process will have higher priority.
* Functions:
    * `change_priority()` : examine if there is a running process and if there are some processes waiting in the queue. If no process is running and there are some processes waiting in the queue, run the next process. Otherwise, raise the priority of the next process.
    * `sig_child()` : wait for complete child process and count the number of them. Once the number of complete processes is equal to the total number, exit the function.
    * `RR()` : Sort the processes first. While there are some unfinished tasks, pop one out and execute the process for a period. For all processes that are ready, create process (fork and execute), put the next ready process into queue, change priorities, and run a unit of time. Calculate if the process will end in a period. If not, reduce a period from its remaining execution time after the execution, and put the process back into the queue.
* References:
    * Mr. Opengate:  https://mropengate.blogspot.com/2015/01/operating-system-ch5-cpu-scheduling.html
    * The Crazy Programmer: https://www.thecrazyprogrammer.com/2015/09/round-robin-scheduling-program-in-c.html

### 3. SJF (Non-preemptive)
* Sort every process according to its ready time. If there are two processes have the same ready time, use execution time.
* For each process, if the ready time is equal to the current time, then put the process into a heap (sorted according to the execution time).
* If there are no any running processes, and some processes are in the heap, pop out the process with minimum execution time and execute it until the end of the execution.
* The running process will have higher priority.
* Functions:
    * `change_priority()` : examine if there is a running process and if there are some processes waiting in the queue. If no process is running and there are some processes waiting in the queue, run the next process. Otherwise, raise the priority of the next process.
    * `sig_child()` : wait for complete child process and count the number of them. Once the number of complete processes is equal to the total number, exit the function.
    * `SJF()` : Sort every process according to its ready time. If there are two processes have the same ready time, use execution time. For all processes that are ready, decrease the priority of the next process. Create process (fork and execute), put the next ready process into the min heap, change priorities, and run a unit of time. 
* References:
    * Edureka: https://www.edureka.co/blog/sjf-scheduling-in-c/

### 4. PSJF (Preemptive)
* Sort every process according to its ready time. If there are two processes have the same ready time, use execution time.
* For each process, if the ready time is equal to the current time, then put the process into a heap (sorted according to the execution time).
* Once the remaining execution time of the running process is larger than that of the process with minimum execution time in the heap, put the running process back into the heap and execute the rocess with minimum execution time in the heap instead.
* If there are no any running processes, and some processes are in the heap, pop out the process with minimum execution time and execute it.
* The running process will have higher priority.
* Function:
    * `change_priority()` : examine if there is a running process and if there are some processes waiting in the queue. If no process is running and there are some processes waiting in the queue, run the next process. Otherwise, raise the priority of the next process.
    * `sig_child()` : wait for complete child process and count the number of them. Once the number of complete processes is equal to the total number, exit the function.
    * `PSJF()` : Sort every process according to its ready time. If there are two processes have the same ready time, use execution time. For all processes that are ready, decrease the priority of the next two processes. Create process (fork and execute), put the next ready process into the min heap, change priorities, and run a unit of time.

## Kernel version
 based on `Linux 4.14.25`

## Outputs
### 1. FIFO_1.txt
Input: 
```
FIFO
5
P1 0 500
P2 0 500
P3 0 500
P4 0 500
P5 0 500
```
Output:
```
P1 0 500
P2 500 1000
P3 1000 1500
P4 1500 2000
P5 2000 2500
```
```
[Project1] 0 1588152739.288386059 1588152740.042406818
[Project1] 1 1588152740.042885515 1588152740.832715414
[Project1] 2 1588152740.833204176 1588152741.643088211
[Project1] 3 1588152741.643562671 1588152742.435482586
[Project1] 4 1588152742.435934906 1588152743.239773767
```
### 2. FIFO_2.txt
Input:
```
FIFO
4
P1 0 80000
P2 100 5000
P3 200 1000
P4 300 1000
```
Output:
```
P1 0 80000
P2 80000 85000
P3 85000 86000
P4 86000 87000
```
```
[Project1] 0 1588152743.247400398 1588152870.233453017
[Project1] 1 1588152870.233902831 1588152878.262984160
[Project1] 2 1588152878.263430150 1588152879.840801194
[Project1] 3 1588152879.841275882 1588152881.404541335
```
### 3. FIFO_3.txt
Input:
```
FIFO
7
P1 0 8000
P2 200 5000
P3 300 3000
P4 400 1000
P5 500 1000
P6 500 1000
P7 600 4000

```
Output:
```
P1 0 8000
P2 8000 13000
P3 13000 16000
P4 16000 17000
P5 17000 18000
P6 18000 19000
P7 19000 23000
```
```
[Project1] 0 1588152881.414018601 1588152893.960833841
[Project1] 1 1588152893.961322654 1588152901.852134554
[Project1] 2 1588152901.852621497 1588152906.490839410
[Project1] 3 1588152906.491338860 1588152908.006580373
[Project1] 4 1588152908.007033411 1588152909.571122423
[Project1] 5 1588152909.571580991 1588152911.095815973
[Project1] 6 1588152911.096264436 1588152917.412762426
```
### 4. FIFO_4.txt
Input:
```
FIFO
4
P1 0 2000
P2 500 500
P3 500 200
P4 1500 500
```
Output:
```
P1 0 2000
P2 2000 2500
P3 2500 2700
P4 2700 3200
```
```
[Project1] 0 1588152917.420573404 1588152920.525996256
[Project1] 1 1588152920.526474031 1588152921.312351236
[Project1] 2 1588152921.312801518 1588152921.625921234
[Project1] 3 1588152921.626461950 1588152922.489479815
```
### 5. FIFO_5.txt
Input:
```
FIFO
7
P1 0 8000
P2 200 5000
P3 200 3000
P4 400 1000
P5 400 1000
P6 600 1000
P7 600 4000
```
Output:
```
P1 0 8000
P2 8000 13000
P3 13000 16000
P4 16000 17000
P5 17000 18000
P6 18000 19000
P7 19000 23000
```
```
[Project1] 0 1588152922.496672905 1588152936.322000164
[Project1] 1 1588152936.322476216 1588152944.635353854
[Project1] 2 1588152944.635802067 1588152949.498633343
[Project1] 3 1588152949.499211222 1588152951.105169024
[Project1] 4 1588152951.105672472 1588152952.765258042
[Project1] 5 1588152952.765741053 1588152954.392118814
[Project1] 6 1588152954.392593800 1588152960.988896339
```
### 6. RR_1.txt
Input:
```
RR
5
P1 0 500
P2 0 500
P3 0 500
P4 0 500
P5 0 500
```
Output:
```
P1 0 500
P2 500 1000
P3 1000 1500
P4 1500 2000
P5 2000 2500
```
```
[Project1] 0 1588152369.165387873 1588152369.888245305
[Project1] 1 1588152369.888703313 1588152370.687144580
[Project1] 2 1588152370.687597259 1588152371.482527017
[Project1] 3 1588152371.482981013 1588152372.268557123
[Project1] 4 1588152372.269049324 1588152372.998646143
```
### 7. RR_2.txt
Input:
```
RR
2
P1 600 4000
P2 800 5000
```
Output:
```
P1 600 8100
P2 1100 9600
```
```
[Project1] 0 1588152373.876284838 1588152385.239674331
[Project1] 1 1588152374.582459519 1588152387.835003417
```
### 8. RR_3.txt
Input:
```
RR
6
P1 1200 5000
P2 2400 4000
P3 3600 3000
P4 4800 7000
P5 5200 6000
P6 5800 5000
```
Output:
```
P3 4200 18200
P1 1200 19700
P2 2700 20200
P6 8200 28200
P5 6700 30200
P4 6200 31200
```
```
[Project1] 2 1588152393.916646437 1588152414.800927127
[Project1] 0 1588152389.548823211 1588152416.702338578
[Project1] 1 1588152391.714018989 1588152418.440141073
[Project1] 5 1588152399.881069981 1588152430.692956261
[Project1] 4 1588152398.438714207 1588152434.019804300
[Project1] 3 1588152396.921566651 1588152435.871284521

```
### 9. RR_4.txt
Input:
```
RR
7
P1 0 8000
P2 200 5000
P3 300 3000
P4 400 1000
P5 500 1000
P6 500 1000
P7 600 4000
```
Output:
```
P4 1500 5500
P5 2000 6000
P6 2500 6500
P3 1000 14500
P7 3500 18500
P2 500 20000
P1 0 23000
```
```
[Project1] 3 1588152438.376375508 1588152444.661047005
[Project1] 4 1588152439.863641257 1588152446.319742304
[Project1] 5 1588152440.653884639 1588152447.104391797
[Project1] 2 1588152437.546608468 1588152459.064675036
[Project1] 6 1588152441.481656514 1588152465.476039155
[Project1] 1 1588152436.703080423 1588152468.123848756
[Project1] 0 1588152435.877999006 1588152473.242056824
```
### 10. RR_5.txt
Input:
```
RR
7
P1 0 8000
P2 200 5000
P3 200 3000
P4 400 1000
P5 400 1000
P6 600 1000
P7 600 4000
```
Output:
```
P4 1500 5500
P5 2000 6000
P6 3000 7000
P3 1000 14500
P7 3500 18500
P2 500 20000
P1 0 23000
```
```
[Project1] 3 1588152475.666476850 1588152481.946566728
[Project1] 4 1588152476.442880508 1588152482.738670648
[Project1] 5 1588152477.995499393 1588152484.364565311
[Project1] 2 1588152474.839963090 1588152495.972694470
[Project1] 6 1588152478.828189039 1588152502.243252186
[Project1] 1 1588152474.002291971 1588152504.811441333
[Project1] 0 1588152473.249548351 1588152509.882925786
```
### 11. SJF_1.txt
Input:
```
SJF
4
P1 0 7000
P2 0 2000
P3 100 1000
P4 200 4000
```
Output:
```
P2 0 2000
P3 2000 3000
P4 3000 7000
P1 7000 14000
```
```
[Project1] 1 1588152509.890080280 1588152513.000372019
[Project1] 2 1588152513.000890851 1588152514.615783419
[Project1] 3 1588152514.616246169 1588152520.989719103
[Project1] 0 1588152520.990213246 1588152532.048705044
```
### 12. SJF_2.txt
Input:
```
SJF
5
P1 100 100
P2 100 4000
P3 200 200
P4 200 4000
P5 200 7000
```
Output:
```
P1 100 200
P3 200 400
P2 400 4400
P4 4400 8400
P5 8400 15400
```
```
[Project1] 0 1588152532.200630615 1588152532.347376347
[Project1] 2 1588152532.347788553 1588152532.641797241
[Project1] 1 1588152532.642333708 1588152538.850319436
[Project1] 3 1588152538.850805878 1588152545.061148213
[Project1] 4 1588152545.061647272 1588152556.050941488
```
### 13. SJF_3.txt
Input:
```
SJF
8
P1 100 3000
P2 100 5000
P3 100 7000
P4 200 10
P5 200 10
P6 300 4000
P7 400 4000
P8 500 9000
```
Output:
```
P1 100 3100
P4 3100 3110
P5 3110 3120
P6 3120 7120
P7 7120 11120
P2 11120 16120
P3 16120 23120
P8 23120 32120
```
```
[Project1] 0 1588152556.201114351 1588152560.872730922
[Project1] 3 1588152560.873240657 1588152560.887480979
[Project1] 4 1588152560.887814251 1588152560.902655987
[Project1] 5 1588152560.902946685 1588152567.186479683
[Project1] 6 1588152567.186930183 1588152573.417878887
[Project1] 1 1588152573.418414041 1588152581.395662101
[Project1] 2 1588152581.396121373 1588152592.502436191
[Project1] 7 1588152592.502911731 1588152606.794865794
```
### 14. SJF_4.txt
Input:
```
SJF
5
P1 0 3000
P2 1000 1000
P3 2000 4000
P4 5000 2000
P5 7000 1000
```
Output:
```
P1 0 3000
P2 3000 4000
P3 4000 8000
P5 8000 9000
P4 9000 11000
```
```
[Project1] 0 1588152606.802186500 1588152611.497293916
[Project1] 1 1588152611.497919061 1588152612.993664493
[Project1] 2 1588152612.994138103 1588152619.482305574
[Project1] 4 1588152619.482779920 1588152620.971503567
[Project1] 3 1588152620.972014056 1588152624.331455657
```
### 15. SJF_5.txt
Input:
```
SJF
4
P1 0 2000
P2 500 500
P3 1000 500
P4 1500 500
```
Output:
```
P1 0 2000
P2 2000 2500
P3 2500 3000
P4 3000 3500
```
```
[Project1] 0 1588152624.339683865 1588152627.463094139
[Project1] 1 1588152627.463566096 1588152628.237931783
[Project1] 2 1588152628.238471448 1588152628.987427643
[Project1] 3 1588152628.987905070 1588152629.774374620
```
### 16. PSJF_1.txt
Input:
```
PSJF
4
P1 0 10000
P2 1000 7000
P3 2000 5000
P4 3000 3000
```
Output:
```
P4 3000 6000
P3 2000 10000
P2 1000 16000
P1 0 25000
```
```
[Project1] 3 1588152634.343419940 1588152639.057615934
[Project1] 2 1588152632.807577588 1588152645.441656279
[Project1] 1 1588152631.314731509 1588152654.889382495
[Project1] 0 1588152629.781863490 1588152669.220120457
```
### 17. PSJF_2.txt
Input:
```
PSJF
5
P1 0 3000
P2 1000 1000
P3 2000 4000
P4 5000 2000
P5 7000 1000
```
Output:
```
P2 1000 2000
P1 0 4000
P4 5000 7000
P5 7000 8000
P3 4000 11000
```
```
[Project1] 1 1588152670.711822176 1588152672.282245257
[Project1] 0 1588152669.228687842 1588152675.500191326
[Project1] 3 1588152676.780600635 1588152679.975367842
[Project1] 4 1588152679.975894149 1588152681.583417068
[Project1] 2 1588152675.500641195 1588152686.598996556
```
### 18. PSJF_3.txt
Input:
```
PSJF
4
P1 0 2000
P2 500 500
P3 1000 500
P4 1500 500
```
Output:
```
P2 500 1000
P3 1000 1500
P4 1500 2000
P1 0 3500
```
```
[Project1] 1 1588152687.362983899 1588152688.112703228
[Project1] 2 1588152688.113195408 1588152688.900749116
[Project1] 3 1588152688.901183865 1588152689.692775947
[Project1] 0 1588152686.607538833 1588152692.027727491
```
### 19. PSJF_4.txt
Input:
```
PSJF
4
P1 0 7000
P2 0 2000
P3 100 1000
P4 200 4000
```
Output:
```
P3 100 1100
P2 0 3000
P4 3000 7000
P1 7000 14000
```
```
[Project1] 2 1588152692.221955190 1588152693.779935548
[Project1] 1 1588152692.035799005 1588152696.800659354
[Project1] 3 1588152696.801145052 1588152703.207090182
[Project1] 0 1588152703.207573285 1588152714.512581156
```
### 20. PSJF_5.txt
Input:
```
PSJF
5
P1 100 100
P2 100 4000
P3 200 200
P4 200 4000
P5 200 7000
```
Output:
```
P1 100 200
P3 200 400
P2 400 4400
P4 4400 8400
P5 8400 15400
```
```
[Project1] 0 1588152714.664529976 1588152714.817795819
[Project1] 2 1588152714.818238659 1588152715.127123745
[Project1] 1 1588152715.127585794 1588152727.961612246
[Project1] 3 1588152715.129803937 1588152728.208831942
[Project1] 4 1588152728.209380359 1588152739.282253023
```

### 21. TIME_MEASUREMENT.txt
Input:
```
FIFO
10
P0 0 500
P1 1000 500
P2 2000 500
P3 3000 500
P4 4000 500
P5 5000 500
P6 6000 500
P7 7000 500
P8 8000 500
P9 9000 500
```
Output:
```
P0 0 500
P1 1000 1500
P2 2000 2500
P3 3000 3500
P4 4000 4500
P5 5000 5500
P6 6000 6500
P7 7000 7500
P8 8000 8500
P9 9000 9500
```
```
[Project1] 0 1588153296.722568723 1588153297.461913278
[Project1] 1 1588153298.163087453 1588153298.894600242
[Project1] 2 1588153299.579557165 1588153300.294398768
[Project1] 3 1588153300.993475888 1588153301.711367201
[Project1] 4 1588153302.404045831 1588153303.143343370
[Project1] 5 1588153303.815820907 1588153304.547058725
[Project1] 6 1588153305.240292366 1588153305.975886151
[Project1] 7 1588153306.667394803 1588153307.414333691
[Project1] 8 1588153308.079349257 1588153308.796339772
[Project1] 9 1588153309.485478038 1588153310.218855737
```

## Comparison: Actual and Theoretical Results
According to the output of `TIMEMEASUREMENT.txt`, the time unit for this project in my machine is the average execution time of these 10 processes divided by 500, which is `0.00146883`.
### FIFO_1.txt:
* The execution time:
```
exec_finish[0]: 1588152740.04240680, exec_start[0]: 1588152739.28838611
exec_finish[1]: 1588152740.83271551, exec_start[1]: 1588152740.04288554
exec_finish[2]: 1588152741.64308810, exec_start[2]: 1588152740.83320427
exec_finish[3]: 1588152742.43548250, exec_start[3]: 1588152741.64356256
exec_finish[4]: 1588152743.23977375, exec_start[4]: 1588152742.43593502
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.03625684
error of P2: start time: 0.03577809, finish time: 0.03622565
error of P3: start time: 0.03573689, finish time: 0.01613059
error of P4: start time: 0.01565614, finish time: 0.01401372
error of P5: start time: 0.01356120, finish time: 0.00000000
total error = 0.20335913
```

### FIFO_2.txt:
* The execution time:
```
exec_finish[0]: 1588152870.23345304, exec_start[0]: 1588152743.24740028
exec_finish[1]: 1588152878.26298428, exec_start[1]: 1588152870.23390293
exec_finish[2]: 1588152879.84080124, exec_start[2]: 1588152878.26343012
exec_finish[3]: 1588152881.40454125, exec_start[3]: 1588152879.84127593
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.05499642
error of P2: start time: 0.05454652, finish time: -0.03446925
error of P3: start time: -0.03491509, finish time: -0.02427310
error of P4: start time: -0.02474779, finish time: 0.00000000
total error = 0.22794817
```
### FIFO_3.txt:
* The execution time:
```
exec_finish[0]: 1588152893.96083379, exec_start[0]: 1588152881.41401863
exec_finish[1]: 1588152901.85213447, exec_start[1]: 1588152893.96132255
exec_finish[2]: 1588152906.49083948, exec_start[2]: 1588152901.85262156
exec_finish[3]: 1588152908.00658035, exec_start[3]: 1588152906.49133897
exec_finish[4]: 1588152909.57112241, exec_start[4]: 1588152908.00703335
exec_finish[5]: 1588152911.09581590, exec_start[5]: 1588152909.57158089
exec_finish[6]: 1588152917.41276240, exec_start[6]: 1588152911.09626436
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: -0.02551298
error of P2: start time: -0.02600173, finish time: -0.09099979
error of P3: start time: -0.09148688, finish time: -0.03421649
error of P4: start time: -0.03471597, finish time: 0.01520541
error of P5: start time: 0.01475242, finish time: 0.01582613
error of P6: start time: 0.01536765, finish time: 0.05629542
error of P7: start time: 0.05584695, finish time: 0.00000000
total error = 0.47622782
```
### FIFO_4.txt:
* The execution time:
```
exec_finish[0]: 1588152920.52599621, exec_start[0]: 1588152917.42057347
exec_finish[1]: 1588152921.31235123, exec_start[1]: 1588152920.52647400
exec_finish[2]: 1588152921.62592125, exec_start[2]: 1588152921.31280160
exec_finish[3]: 1588152922.48947978, exec_start[3]: 1588152921.62646198
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.06264371
error of P2: start time: 0.06216592, finish time: 0.06830530
error of P3: start time: 0.06785493, finish time: 0.07154192
error of P4: start time: 0.07100119, finish time: 0.00000000
total error = 0.40351295
```
### FIFO_5.txt:
* The execution time:
```
exec_finish[0]: 1588152936.32200027, exec_start[0]: 1588152922.49667287
exec_finish[1]: 1588152944.63535380, exec_start[1]: 1588152936.32247615
exec_finish[2]: 1588152949.49863338, exec_start[2]: 1588152944.63580203
exec_finish[3]: 1588152951.10516906, exec_start[3]: 1588152949.49921131
exec_finish[4]: 1588152952.76525807, exec_start[4]: 1588152951.10567236
exec_finish[5]: 1588152954.39211893, exec_start[5]: 1588152952.76574111
exec_finish[6]: 1588152960.98889637, exec_start[6]: 1588152954.39259386
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: -0.43672792
error of P2: start time: -0.43720380, finish time: -0.38220678
error of P3: start time: -0.38265501, finish time: -0.22476156
error of P4: start time: -0.22533949, finish time: -0.15772230
error of P5: start time: -0.15822560, finish time: -0.14423638
error of P6: start time: -0.14471941, finish time: -0.09752230
error of P7: start time: -0.09799723, finish time: 0.00000000
total error = 2.88931777
```
### RR_1.txt:
* The execution time:
```
exec_finish[0]: 1588152369.88824534, exec_start[0]: 1588152369.16538787
exec_finish[1]: 1588152370.68714452, exec_start[1]: 1588152369.88870335
exec_finish[2]: 1588152371.48252702, exec_start[2]: 1588152370.68759727
exec_finish[3]: 1588152372.26855707, exec_start[3]: 1588152371.48298097
exec_finish[4]: 1588152372.99864626, exec_start[4]: 1588152372.26904941
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.04379420
error of P2: start time: 0.04333620, finish time: 0.01154671
error of P3: start time: 0.01109395, finish time: -0.01718411
error of P4: start time: -0.01763806, finish time: -0.03656249
error of P5: start time: -0.03705482, finish time: 0.00000000
total error = 0.21821055
```
### RR_2.txt:
* The execution time:
```
exec_finish[0]: 1588152385.23967433, exec_start[0]: 1588152373.87628484
exec_finish[1]: 1588152387.83500338, exec_start[1]: 1588152374.58245945
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.26887596
error of P2: start time: 0.06930975, finish time: 0.00000000
total error = 0.33818571
```
### RR_3.txt:
* The execution time:
```
exec_finish[2]: 1588152414.80092716, exec_start[2]: 1588152393.91664648
exec_finish[0]: 1588152416.70233870, exec_start[0]: 1588152389.54882312
exec_finish[1]: 1588152418.44014096, exec_start[1]: 1588152391.71401906
exec_finish[5]: 1588152430.69295621, exec_start[5]: 1588152399.88106990
exec_finish[4]: 1588152434.01980424, exec_start[4]: 1588152398.43871427
exec_finish[3]: 1588152435.87128448, exec_start[3]: 1588152396.92156672
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 1.41200227
error of P2: start time: 0.15092713, finish time: 0.44624102
error of P3: start time: 0.26442277, finish time: 0.99729073
error of P4: start time: 0.34766662, finish time: 0.00000000
error of P5: start time: -0.39743990, finish time: 0.30739820
error of P6: start time: 0.47632754, finish time: 0.54608214
total error = 5.34579831
```
### RR_4.txt:
* The execution time:
```
exec_finish[3]: 1588152444.66104698, exec_start[3]: 1588152438.37637544
exec_finish[4]: 1588152446.31974220, exec_start[4]: 1588152439.86364126
exec_finish[5]: 1588152447.10439181, exec_start[5]: 1588152440.65388465
exec_finish[2]: 1588152459.06467509, exec_start[2]: 1588152437.54660845
exec_finish[6]: 1588152465.47603917, exec_start[6]: 1588152441.48165655
exec_finish[1]: 1588152468.12384868, exec_start[1]: 1588152436.70308042
exec_finish[0]: 1588152473.24205685, exec_start[0]: 1588152435.87799907
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.00000000
error of P2: start time: -0.01281922, finish time: 0.24463542
error of P3: start time: -0.04408513, finish time: 0.36892562
error of P4: start time: -0.06158999, finish time: 0.15183547
error of P5: start time: -0.73659369, finish time: -0.69459763
error of P6: start time: -0.71457495, finish time: -0.66698511
error of P7: start time: 0.08217740, finish time: 0.45565854
total error = 4.23447817
```
### RR_5.txt:
* The execution time:
```
exec_finish[3]: 1588152481.94656682, exec_start[3]: 1588152475.66647696
exec_finish[4]: 1588152482.73867059, exec_start[4]: 1588152476.44288039
exec_finish[5]: 1588152484.36456537, exec_start[5]: 1588152477.99549937
exec_finish[2]: 1588152495.97269440, exec_start[2]: 1588152474.83996320
exec_finish[6]: 1588152502.24325228, exec_start[6]: 1588152478.82818913
exec_finish[1]: 1588152504.81144142, exec_start[1]: 1588152474.00229192
exec_finish[0]: 1588152509.88292575, exec_start[0]: 1588152473.24954844
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.00000000
error of P2: start time: 0.04363429, finish time: 0.29321772
error of P3: start time: 0.00234077, finish time: 0.37180930
error of P4: start time: -0.02779523, finish time: 0.06313706
error of P5: start time: -0.00782089, finish time: 0.06741106
error of P6: start time: 0.03231567, finish time: 0.03427181
error of P7: start time: -0.00399633, finish time: 0.47227356
total error = 1.42002368
```

### SJF_1.txt
* The execution time:
```
exec_finish[1]: 1588152513.00037193, exec_start[1]: 1588152509.89008021
exec_finish[2]: 1588152514.61578345, exec_start[2]: 1588152513.00089073
exec_finish[3]: 1588152520.98971915, exec_start[3]: 1588152514.61624622
exec_finish[0]: 1588152532.04870510, exec_start[0]: 1588152520.99021316
```
* The error of each process:
```
error of P1: start time: -0.02082050, finish time: 0.00000000
error of P2: start time: 0.00000000, finish time: 0.05522612
error of P3: start time: 0.05470732, finish time: 0.02257352
error of P4: start time: 0.02211075, finish time: -0.02032650
total error = 0.19576471
```
### SJF_2.txt
* The execution time:
```
exec_finish[0]: 1588152532.34737635, exec_start[0]: 1588152532.20063066
exec_finish[2]: 1588152532.64179730, exec_start[2]: 1588152532.34778857
exec_finish[1]: 1588152538.85031939, exec_start[1]: 1588152532.64233375
exec_finish[3]: 1588152545.06114817, exec_start[3]: 1588152538.85080576
exec_finish[4]: 1588152556.05094147, exec_start[4]: 1588152545.06164718
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.00913870
error of P2: start time: 0.02595007, finish time: 0.05333981
error of P3: start time: 0.00872648, finish time: 0.02648651
error of P4: start time: 0.05285343, finish time: 0.07788640
error of P5: start time: 0.07738739, finish time: 0.00000000
```
### SJF_3.txt
* The execution time:
```
exec_finish[0]: 1588152560.87273097, exec_start[0]: 1588152556.20111442
exec_finish[3]: 1588152560.88748097, exec_start[3]: 1588152560.87324071
exec_finish[4]: 1588152560.90265608, exec_start[4]: 1588152560.88781428
exec_finish[5]: 1588152567.18647957, exec_start[5]: 1588152560.90294671
exec_finish[6]: 1588152573.41787887, exec_start[6]: 1588152567.18693018
exec_finish[1]: 1588152581.39566207, exec_start[1]: 1588152573.41841412
exec_finish[2]: 1588152592.50243616, exec_start[2]: 1588152581.39612126
exec_finish[7]: 1588152606.79486585, exec_start[7]: 1588152592.50291181
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.06858502
error of P2: start time: 0.19504074, finish time: 0.11812873
error of P3: start time: 0.11766954, finish time: 0.07182497
error of P4: start time: 0.06807528, finish time: 0.06963568
error of P5: start time: 0.06930238, finish time: 0.07026125
error of P6: start time: 0.06997062, finish time: 0.10670652
error of P7: start time: 0.10625591, finish time: 0.19557599
error of P8: start time: 0.07134933, finish time: 0.00000000
total error = 1.39838196
```
### SJF_4.txt
* The execution time:
```
exec_finish[0]: 1588152611.49729395, exec_start[0]: 1588152606.80218649
exec_finish[1]: 1588152612.99366450, exec_start[1]: 1588152611.49791908
exec_finish[2]: 1588152619.48230553, exec_start[2]: 1588152612.99413800
exec_finish[4]: 1588152620.97150350, exec_start[4]: 1588152619.48277998
exec_finish[3]: 1588152624.33145571, exec_start[3]: 1588152620.97201395
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.08560233
error of P2: start time: 0.08497719, finish time: 0.18280170
error of P3: start time: 0.18232820, finish time: 0.06844039
error of P4: start time: 0.17230190, finish time: 0.00000000
error of P5: start time: 0.06796594, finish time: 0.17281235
total error = 1.01723001
```
### SJF_5.txt
* The execution time:
```
exec_finish[0]: 1588152627.46309423, exec_start[0]: 1588152624.33968377
exec_finish[1]: 1588152628.23793173, exec_start[1]: 1588152627.46356606
exec_finish[2]: 1588152628.98742771, exec_start[2]: 1588152628.23847151
exec_finish[3]: 1588152629.77437472, exec_start[3]: 1588152628.98790503
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: -0.01787278
error of P2: start time: -0.01834461, finish time: -0.01632585
error of P3: start time: -0.01686563, finish time: 0.01056259
error of P4: start time: 0.01008528, finish time: 0.00000000
total error = 0.09005673
```

### PSJF_1.txt
* The execution time:
```
exec_finish[3]: 1588152639.05761600, exec_start[3]: 1588152634.34342003
exec_finish[2]: 1588152645.44165635, exec_start[2]: 1588152632.80757761
exec_finish[1]: 1588152654.88938260, exec_start[1]: 1588152631.31473160
exec_finish[0]: 1588152669.22012043, exec_start[0]: 1588152629.78186345
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.00000000
error of P2: start time: 0.04466213, finish time: 0.13296532
error of P3: start time: 0.12934640, finish time: 0.11550989
error of P4: start time: 0.17103426, finish time: 0.18942913
total error = 0.78294713
```
### PSJF_2.txt
* The execution time:
```
exec_finish[1]: 1588152672.28224516, exec_start[1]: 1588152670.71182227
exec_finish[0]: 1588152675.50019121, exec_start[0]: 1588152669.22868776
exec_finish[3]: 1588152679.97536778, exec_start[3]: 1588152676.78060055
exec_finish[4]: 1588152681.58341718, exec_start[4]: 1588152679.97589421
exec_finish[2]: 1588152686.59899664, exec_start[2]: 1588152675.50064111
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.04497251
error of P2: start time: 0.09598448, finish time: 0.10468058
error of P3: start time: 0.04452261, finish time: 0.00000000
error of P4: start time: 0.34368216, finish time: 0.30715290
error of P5: start time: 0.30662647, finish time: 0.27822250
total error = 1.52584421
```
### PSJF_3.txt
* The execution time:
```
exec_finish[1]: 1588152688.11270332, exec_start[1]: 1588152687.36298394
exec_finish[2]: 1588152688.90074921, exec_start[2]: 1588152688.11319542
exec_finish[3]: 1588152689.69277596, exec_start[3]: 1588152688.90118384
exec_finish[0]: 1588152692.02772760, exec_start[0]: 1588152686.60753894
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.00000000
error of P2: start time: 0.01886766, finish time: 0.04346095
error of P3: start time: 0.04296885, finish time: 0.02972773
error of P4: start time: 0.02929309, finish time: 0.01201364
total error = 0.17633193
```
### PSJF_4.txt
* The execution time:
```
exec_finish[2]: 1588152693.77993560, exec_start[2]: 1588152692.22195530
exec_finish[1]: 1588152696.80065942, exec_start[1]: 1588152692.03579903
exec_finish[3]: 1588152703.20709014, exec_start[3]: 1588152696.80114508
exec_finish[0]: 1588152714.51258111, exec_start[0]: 1588152703.20757318
```
* The error of each process:
```
error of P1: start time: 0.06661689, finish time: 0.00000000
error of P2: start time: 0.00000000, finish time: 0.05159291
error of P3: start time: -0.02560783, finish time: 0.02189631
error of P4: start time: 0.05110725, finish time: 0.06709993
total error = 0.28392112
```
### PSJF_5.txt
* The execution time:
```
exec_finish[0]: 1588152714.81779575, exec_start[0]: 1588152714.66453004
exec_finish[2]: 1588152715.12712383, exec_start[2]: 1588152714.81823874
exec_finish[1]: 1588152727.96161222, exec_start[1]: 1588152715.12758589
exec_finish[3]: 1588152728.20883203, exec_start[3]: 1588152715.12980390
exec_finish[4]: 1588152739.28225303, exec_start[4]: 1588152728.20938039
```
* The error of each process:
```
error of P1: start time: 0.00000000, finish time: 0.00763444
error of P2: start time: 0.01964460, finish time: -6.37837573
error of P3: start time: 0.00719145, finish time: 0.02010666
error of P4: start time: 6.45343260, finish time: -0.18958952
error of P5: start time: -0.19013788, finish time: 0.00000000
total error = 13.26611287
```

### TIME_MEASUREMENT.txt
* The execution time:
```
exec_finish[0]: 1588155020.41130829, exec_start[0]: 1588155019.68080354
exec_finish[1]: 1588155021.81023002, exec_start[1]: 1588155021.09461451
exec_finish[2]: 1588155023.22338367, exec_start[2]: 1588155022.50229001
exec_finish[3]: 1588155024.63924313, exec_start[3]: 1588155023.91696358
exec_finish[4]: 1588155026.05388737, exec_start[4]: 1588155025.33303952
exec_finish[5]: 1588155027.50321555, exec_start[5]: 1588155026.76138330
exec_finish[6]: 1588155028.93177509, exec_start[6]: 1588155028.20678043
exec_finish[7]: 1588155030.35124874, exec_start[7]: 1588155029.61146879
exec_finish[8]: 1588155031.74722457, exec_start[8]: 1588155031.03047395
exec_finish[9]: 1588155033.14174724, exec_start[9]: 1588155032.43838477
```
* The error of each process:
```
error of P0: start time: 0.00000000, finish time: -0.02203403
error of P1: start time: 0.00313047, finish time: -0.00401432
error of P2: start time: 0.01239641, finish time: -0.00022652
error of P3: start time: 0.01466429, finish time: 0.00085546
error of P4: start time: 0.01552978, finish time: 0.00315266
error of P5: start time: 0.00412745, finish time: -0.02923408
error of P6: start time: -0.02432824, finish time: -0.04085218
error of P7: start time: -0.01207516, finish time: -0.04338439
error of P8: start time: -0.01413887, finish time: -0.02241878
error of P9: start time: -0.00510826, finish time: 0.00000000
total error = 0.27167136
```
## Conclusion
* stability: FIFO > RR > PSJF > SJF
* speed: SJF > FIFO ~= PSJF > RR
* The possible reasons leading to the error:
    1. `scheduler` has other jobs to do. For example, changing the priority of each process, executing new processes, etc. All of these jobs take time.
    2. The time unit of each process might differ while executing loops. Plus, the timer of `scheduler` might not be synchronized with the timer of each process, which might lead to the error.
    3. There are not only the processes of this project on the computer. The processes of this project might be interrupted by context switch.

## Reference
* Mr. Opengate:  https://mropengate.blogspot.com/2015/01/operating-system-ch5-cpu-scheduling.html
* Quora: https://www.quora.com/How-do-I-write-a-simple-code-in-C-for-FIFO-scheduling
* The Crazy Programmer: https://www.thecrazyprogrammer.com/2015/09/round-robin-scheduling-program-in-c.html
* Edureka: https://www.edureka.co/blog/sjf-scheduling-in-c/
* Discuss with 陳柏瑋、董函





