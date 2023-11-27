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

int i=0;
int m=0;


void set_cpu(int id);

int main()
{
    register u_int64_t time1, time2;
    // CPU binding
    set_cpu(0);
    u_int64_t t[1000000];
    // Preliminary synchronization
    int start=0;
    while(1){
	    time2=rdtsc();
        // nop-receiver, change in receiver.s
    	for(i=0;i<300;i++)
    	{
		    m=m+23323;
    	}
	    time2=rdtsc()-time2;
	    if(time2<3300&&time2>3100)start++;
	    m++;
        if(m%100==0){
            if(start>70)break;
            else start=0;
        }
    }
    // Accurate synchronization
    time1=rdtsc();
    u_int64_t divide=time1%10000;
    time1=time1-divide+20000;
    // Start transmission
    for(int j=0;j<10000;j++){
        time2=rdtsc();
        while(time2<time1)time2=rdtsc();
        time2=rdtsc();
        // nop-receiver, change in receiver.s
        for(i=0;i<200;i++)
        {
            m=m+23323;
        }
        t[j]=rdtsc()-time2;
        time1+=10000;
    }
    // Sample time output
    for(int j=0;j<10000;j++){
    	printf("%ld\n",t[j]);
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
