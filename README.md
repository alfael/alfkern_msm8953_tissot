**********************************************************
==========================INFO===========================
*********************************************************
    - KERNEL NAME -> [ALFKERN]
    - LINUX KERNEL VERSION -> [4.9.337]
    - LAST CAF TAG ANDROID 12 -> [LA.UM.10.6.2.r1-02500-89xx.0]
    - VERSION CODENAME -> [8.0]
    - LAST TOOLCHAIN VERSION AT RELEASE KERNEL DATE -> [TRB (clang v16)]
    - TARGET ANDROID VERSION -> [12]
    - LAST VERSION DATE -> [2023-01-16]
    - Main purpose of this kernel is to be up to the
      latest tag of linux 4.9 with the best delivery of
      performance and battery to use as is.

    - NOTE: application like FDE.AI/LSPEED/NFS INJECTOR/... are not blocked but please
      don't use it, best settings are already applied in the kernel for optimal operation

    - TESTED ON ROM: Lineage OS 19.1[2023.01.10]

*********************************************************
=========================FEATURE=========================
*********************************************************
    - OC FROM LOKUM KERNEL -> CPU: [MIN]652Mhz [MAX]3150Mhz
                           -> GPU: [MIN]19Mhz [MAX]850Mhz
    - DEFAULT GOVERNOR -> [SCHEDUTIL]
    - DEFAULT I/O SCHEDULER -> [CFQ TWEAKED]
    - DEFAULT TCP CONGESTION CONTROL -> [BBR]
    - DEFAULT NETWORK SCHEDULER -> [FQ_CODEL]
    - TOOLCHAIN OPTIMIZATION -> [O3/POLLY/ARMV8-A/CORTEX-A53/CRC/CRYPTO]
    - LAST WIFI CAF DRIVER LA.UM.10.6.2.r1-02500-89xx.0
    - CLEAN USELESS ARM64_ERRATUM
    - MANY DEBUGGER/STATS DISABLED
    - FIX DIRECT REFERENCE TO HZ
    - CONFIG_HZ -> 300HZ
    - ARM64 OPTIMIZATIONS
    - MSM8953 OPTIMIZATIONS
    - RAPID GC F2FS by arter97
    - F2FS OPTIMIZATIONS
    - EXT4 OPTIMIZATIONS
    - WIREGUARD 1.0.20220627
    - NETWORK IMPROVEMENT
    - KSM ENABLED BY DEFAULT
    - GSM/4G IMPROVEMENT
    - GPU IMPROVEMENT
    - SOUND QUALITY IMPROVEMENT
    - MEMORY MANAGEMENT IMPROVEMENT
    - I/O IMPROVEMENT
    - BATTERY IMPROVEMENT
    - BOEFFLA WAKELOCK BLOCKER
    - HIGH PRIORITY WORKQUEUE
    - POWER EFFICIENT WORKQUEUE
    - SCHED_RR IN PLACE OF SCHED_FIFO -> [BETTER LATENCY]
    - CPU SCHEDULER (CFS) TWEAKED
    - DTS EAGLE
    - FRANDOM DRIVER
    - LASTER K'S AUDIO DRIVER
    - DYNAMIC FSYNC V2 -> ENABLED BY DEFAULT
    - ADRENOBOOST -> ENABLED BY DEFAULT
    - ADRENOIDLER -> ENABLED BY DEFAULT
    - PRLMK REPLACEMENT OF LOW MEMORY KILLER -> BY DARKHZ
    - SCREEN COLOR CONTROL
    - SOUND CONTROL
    - VIBRATION CONTROL
    - DROP CACHE -> AUTOMATIC when screen off
    - POWER SUSPEND -> HYBRID ENABLED BY DEFAULT
    - FAST CHARGE USB -> ENABLED BY DEFAULT
    - BACKPORT OPTIMIZATION FROM UPSTREAM KERNEL VERSION 
    - ZRAM WITH ZSTD COMPRESSION (WARNING because if the rom has already defined the ZRAM block, to modify the algorithm used, please modify a file which is possibly in this location "/system/vendor/etc/init/hw/", for my case it is is about the file "init.qcom.rc")
