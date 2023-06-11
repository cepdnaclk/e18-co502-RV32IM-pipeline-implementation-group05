---
layout: home
permalink: index.html

# Please update this with your repository name and title
repository-name: eYY-XXX-project-template
title: e18-co502-RV32IM-pipeline-implementation-group05
---

# RV32IM Pipeline Implementation

---


## Table of Contents
1. [Introduction](#introduction)
2. [Pipeline Datapath](#pipeline_datapath)
3. [Hardware Units](#hardware_units)
4. [Team](#team)
5. [Supervisors](#supervisors)
6. [Links](#links)

---

## Introduction

The aim of this project is to design and implement a pipelined processor which supports RISC-V Instruction Set Architecture. VerilogHDL and Icarus verilog is used to implement this CPU. Gtkwave is used to observe the behaviour of the CPU.

## Pipeline Datapath
### Instruction Memory

responsible for storing program instructions that the CPU will execute.The program counter (PC) holds the address of the next instruction to be fetched from the Instruction Memory



### Data Memory

responsible for storing data that the CPU uses and manipulates during program execution.During program execution, the CPU may read data from the Data Memory or write data to the Data Memory. 



### Cache Memory

stores frequently used data and instructions to improve the performance.


### Register File
 - 32 x registers (x0 to x31), each 32 bits wide (i.e. XLEN=32)
 - Register x0 is hardwired with all bits equal to 0.
 - 31 General Purpose Registers (x1–x31)



### Control Unit

manages and coordinates the operations of the other hardware units, and directs the flow of data through the datapath to execute instructions



### Pipeline Registers

temporarily store data between stages of the pipeline





.....

## Hardware Units

## Team
-  E/18/010 - A.K.D.A.S. Abeywickrama [email](mailto:e18010@eng.pdn.ac.lk)
-  E/18/227 - D.H. Mudalige [email](mailto:e18227@eng.pdn.ac.lk)
-  E/18/329 - D.W.S.N. Sewwandi [email](mailto:e18329@eng.pdn.ac.lk)


## Supervisors
-  Dr. Mahanama Wickramasinghe [email](mailto:mahanamaw@eng.pdn.ac.lk)


## Links

- [Project Repository](https://github.com/cepdnaclk/e18-co502-RV32IM-pipeline-implementation-group05)
- [Project Page](https://cepdnaclk.github.io/e18-co502-RV32IM-pipeline-implementation-group05/)
- [Department of Computer Engineering](http://www.ce.pdn.ac.lk/)
- [University of Peradeniya](https://eng.pdn.ac.lk/)


[//]: # (Please refer this to learn more about Markdown syntax)
[//]: # (https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
