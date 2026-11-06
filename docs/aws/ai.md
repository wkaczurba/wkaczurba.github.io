Some basic training on GPT training

Training GPT using AWS EKS and Amazon ParallelCluster
- 

Elastic Fabric Adapter for building networks to scale high performance network communication
 - https://aws.amazon.com/hpc/efa/


ECMP-enabled packet spraying
 - Equal cost multi-path routing (ECMP)


ML training storage hierarchy
- instant store only ?for transient data
-  FSX for lustre -  highly performance shared data sets checkpoints outputs.  Not efficient for long-term storage
- S3

FSX and S3 are integrated

----

parallel cluster
 - https://aws.amazon.com/hpc/parallelcluster/

----

pyTorch

----

staining power cluster with py torch

-----

distributed training using eks:

on the input we have user kubernetes that goes into the eks cluster underneath we have EFA and on the back end we can have FSX S3 Lustre or other stuff

------

ML Frameworks layer

distributed data parallel fast training fsdp compared to DDP. 

DDP= sharding batch

------

Fully Sharded Data Parellel = FSDP

-------

Pipeline parallel - we assign different layers to different layers...; partition models to different GPUs. Each layer to a single --GPU.  

--------





