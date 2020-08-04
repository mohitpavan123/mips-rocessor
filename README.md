# mips-rocessor

*Architechtural diagram:

in the report file :)

**memory design :
 
1.little indian,

2. harward ,

3.and implemented in the form of arrays of size of 32*256 and can be extended easily


***instructions supported : LW , SW 

all R-type(add,xor,sub,and,or,slt,sll,nor)

1 v type-sllv,

1 u type- addu,subu,andu,

3 i type-addi,subi,slti,xori,ori,

2 branch type-beq,bne,

1 jump -jump

totally 24 instructions listed are fetched and can be extended towards the requirement

**** instructions not supported :

 JAL,BGTZ,BLEZ,SRAV,(because only 2 to 3 instructions are implemented of each type)


LB,SB(because we have implemented lw,sw)


***** clock frequency – 

processor is working on frequency of 1 ns to 5 ns;


******special features: 

The processor is based on pipeline architechture and all the instructions working on it are written in 

the execute itself.

It is the most efficient architechture with respect to the time :

because 1 instruction gets executed in average for 1 clock cycle;
and the usage of arrays gives the flexibility

the registers gets initialised only when the processor is restarted

P_C starts with 0 automatically which is given by itself

and P_C gets updated at every instruction and waits for that
