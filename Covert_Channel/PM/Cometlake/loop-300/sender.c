#define _GNU_SOURCE
#include <sched.h>
#include <sys/times.h>
#include "cacheutils.h"
#include <errno.h>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/un.h>
#include <sys/shm.h>
#include <sys/types.h>
#include <sys/sem.h>
#include <sys/stat.h>
#include <sys/socket.h>

void set_cpu(int id);
int m=0;
int i=0;

int main()
{
    register u_int64_t time1, time2;
    // CPU binding
    set_cpu(1);
    int start=0;
    // Preliminary synchronization
    while(1){
	    time2=rdtsc();
        // nop-receiver, change in sender.s
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
    int temp=0;
    for(int j=0;j<10000;j++){
        temp=j&0x3;
        time2=rdtsc();
        while(time2<time1)time2=rdtsc();
        // The for loop changes in the sender.s
        if(temp==0){
            for(i=0;i<300;i++)
            {
                m=m+23323;
            }
        }else if(temp==1){
            for(i=0;i<300;i++)
            {
                m=m+23323;
            }
        }else if(temp==2){
            for(i=0;i<300;i++)
            {
                m=m+23323;
            }
        }else if(temp==3){
            for(i=0;i<300;i++)
            {
                m=m+23323;
            }
        }
        time1+=10000;
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
