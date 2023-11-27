# Frontend_Bus_Attacks
Frontend bus covert channel and Spectre attack.

/* Covert channel */

PM is the code on the physical machine with the captured data.

VM is the code on the virtual machine with the captured data.

loop-200 is that the number of iterations of the receiver's nop-receiver is 200.

4000 is the time sample taken when the sampling period is 4000.

6sample is the time sample taken when the receiver is sampled 6 times.

analyze.c is responsible for calculating the transmission correctness of the collected samples.

receiver.c is the receiver code, and the contents of the transfer loop are modified in receiver.s.

sender.c is the sender code, and the contents of the transfer loop are modified in sender.s.

/* Spectre */

analyze0.c is responsible for calculating the transmission correctness of the collected samples when secret is 0.

analyze1.c is responsible for calculating the transmission correctness of the collected samples when secret is 1.

victim.c is the victim code, and the contents of the transfer loop are modified in victim0.s (secret is 0) and victim1.s (secret is 1).

attacker.c is the attacker code, and the contents of the transfer loop are modified in attacker.s.

94.3 represents an accuracy of 94.3%, where re0.txt is the sampled data when the secret is 0 and re1.txt is the sampled data when the secret is 1.

/* Before the attack */

Prior to the attack, the cores to which the set_cpu function is bound need to be adjusted according to the information in /proc/cpuinfo to ensure that the attacker and the victim (or sender and receiver) are on two logical cores of a physical core.

