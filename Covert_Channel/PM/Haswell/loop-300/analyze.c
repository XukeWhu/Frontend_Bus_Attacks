
#include<stdio.h>

int main(){
    __int64_t t[1000000];
	// Read time data
    FILE *fp=fopen("re.txt","r");
    for(int i=0;i<110000;i++){
		fscanf(fp,"%ld",&t[i]);
    }
    int  result=0;
	// Consider the first 10,000 collections as samples that are susceptible to noise and disregard them
    for(int j=10000;j<110000;j++){
		int temp=j&0x7;
		int count[8];
		for(int n=0;n<8;n++){
			count[n]=0;
		}
		// Data decode
		if(t[j]>2900 && t[j]<3350){
			count[0]++;
		}else if(t[j]>3350 && t[j]<3450){
			count[1]++;
		}else if(t[j]>3450 && t[j]<3600){
			count[2]++;
		}else if(t[j]>3600 && t[j]<3750){
			count[3]++;
		}else if(t[j]>2600 && t[j]<2900){
			count[4]++;
		}else if(t[j]>3750 && t[j]<4000){
			count[5]++;
		}else if(t[j]>4400 && t[j]<6000){
			count[6]++;
		}else if(t[j]>4000 && t[j]<4400){
			count[7]++;
		}
		int res=0,max=count[0];
		for(int z=1;z<8;z++){
			if(count[z]>max){
				res=z;
				max=count[z];
			}
		}
		// Cumulative correct results and output the error results
		if(res==temp)result++;
		else printf("%d,%ld\n",temp,t[j]);
    }
    printf("%d\n",result);
    return 1;
}
