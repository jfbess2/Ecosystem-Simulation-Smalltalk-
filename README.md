# Ecosystem-Simulation-Smalltalk-
Jacob Besse

Smalltalk Assignment

Description:
The program runs a simple simulation of an ecosystem between lynxes and rabbits.  If a lynxes does not
land on a rabbit (food), it dies.  If it lands on a cell with a rabbit, it eats the rabbit and reproduces.
If the rabbit lands on a cell with another rabbit it reproduces.

README:


When the status is printed out, each cell is represented by R_L_, this is for the number of Rabbits and Lynxes respectively. Also the total number of rabbits and lynxes that are alive is displayed.


TO RUN: Run in gst compiler. Once compiled type ‘step’ and hit enter.  This is step the progrom forward 1 month and print out the status. 


TO QUIT: type anything but ‘step’ and hit enter. This will exit the program.


>gst smalltalk.st
>step
>[status of 1st month]
>step
>[status of 2nd month]
>q
>[program exits]






Example Run:
coreopsis:~/CS450/smalltalk> gst smalltalk.st
step

R0L0 R0L0 R1L0 R1L0 R1L0 R1L0 R1L0 R0L0 R1L0 R1L0  
R0L0 R0L0 R2L0 R0L0 R0L1 R2L0 R1L0 R0L0 R0L0 R0L0  
R1L0 R0L0 R0L0 R1L0 R0L1 R1L0 R1L0 R1L0 R0L0 R0L0  
R2L0 R2L0 R0L0 R0L0 R0L0 R0L0 R0L0 R0L1 R0L0 R1L0  
R1L0 R0L1 R0L1 R0L0 R2L0 R0L0 R1L0 R0L0 R1L0 R1L0  
R0L0 R2L0 R0L1 R1L0 R2L1 R1L0 R1L0 R0L0 R1L0 R0L0  
R1L0 R0L0 R1L1 R0L0 R0L0 R1L0 R0L0 R0L0 R0L0 R0L0  
R1L0 R0L0 R0L0 R0L0 R0L0 R0L0 R1L0 R1L1 R0L0 R1L0  
R0L1 R1L0 R0L0 R0L0 R0L0 R0L0 R1L0 R0L0 R0L0 R1L0  
R1L0 R0L0 R0L0 R1L0 R0L0 R1L0 R0L0 R0L0 R1L0 R0L0  

Number of Rabbits: 50
Number of Lynxes: 10
step

R0L0 R0L0 R1L0 R1L0 R1L0 R1L0 R1L0 R0L0 R1L0 R1L0  
R0L0 R0L0 R6L0 R0L0 R0L0 R6L0 R1L0 R0L0 R0L0 R0L0  
R1L0 R0L0 R0L0 R1L0 R0L0 R1L0 R1L0 R1L0 R0L0 R0L0  
R6L0 R6L0 R0L0 R0L0 R0L0 R0L0 R0L0 R0L0 R0L0 R1L0  
R1L0 R0L0 R0L0 R0L0 R6L0 R0L0 R1L0 R0L0 R1L0 R1L0  
R0L0 R6L0 R0L0 R1L0 R6L1 R1L0 R1L0 R0L0 R1L0 R0L0  
R1L0 R0L0 R1L1 R0L0 R0L0 R1L0 R0L0 R0L0 R0L0 R0L0  
R1L0 R0L0 R0L0 R0L0 R0L0 R0L0 R1L0 R1L1 R0L0 R1L0  
R0L0 R1L0 R0L0 R0L0 R0L0 R0L0 R1L0 R0L0 R0L0 R1L0  
R1L0 R0L0 R0L0 R1L0 R0L0 R1L0 R0L0 R0L0 R1L0 R0L0  

Number of Rabbits: 78
Number of Lynxes: 3
step

R1L0 R0L0 R3L0 R1L0 R0L0 R3L0 R1L0 R1L0 R3L0 R0L0  
R0L0 R0L0 R15L0 R4L0 R0L0 R15L0 R3L0 R1L0 R0L0 R0L0  
R0L0 R0L0 R1L0 R0L0 R0L0 R3L0 R0L0 R0L0 R1L0 R1L0  
R18L0 R18L0 R1L0 R0L0 R0L0 R0L0 R1L0 R0L0 R0L0 R3L0  
R0L0 R0L0 R0L0 R0L0 R15L0 R7L0 R0L0 R0L0 R0L0 R1L0  
R4L0 R12L0 R1L0 R0L0 R12L1 R4L0 R3L0 R1L0 R0L0 R0L0  
R0L0 R1L0 R0L0 R1L0 R0L0 R0L0 R1L0 R0L0 R0L0 R4L0  
R0L0 R1L0 R0L0 R0L0 R0L0 R1L0 R6L0 R0L0 R0L0 R0L0  
R1L0 R0L0 R0L0 R0L0 R0L0 R0L0 R0L0 R0L0 R1L0 R0L0  
R0L0 R0L0 R0L0 R0L0 R1L0 R0L0 R1L0 R0L0 R0L0 R1L0  

Number of Rabbits: 178
Number of Lynxes: 1
quit
