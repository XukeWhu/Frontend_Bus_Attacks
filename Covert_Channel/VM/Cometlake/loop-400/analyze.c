
#include<stdio.h>

int main(){
    __int64_t t[1000000];
	// Read time data
    FILE *fp=fopen("re.txt","r");
    for(int i=0;i<60000;i++){
		fscanf(fp,"%ld",&t[i]);
    }
    int  result=0;
    for(int j=0;j<10000;j++){
		int temp=j&0x3;
		int count[4];
		for(int n=0;n<4;n++){
			count[n]=0;
		}
		// Data decode
		for(int n=0;n<6;n++){
			if(t[j*6+n]>3100){
    			count[0]++;
			}else if(t[j*6+n]<2900&&t[j*6+n]>2600){
					count[1]++;
			}else if(t[j*6+n]<2600){
					count[2]++;
			}else if(t[j*6+n]<3100&&t[j*6+n]>2900){
					count[3]++;
			}
		}
		// Voting for result
		int res=0, max=count[0];
		for(int z=1;z<4;z++){
			if(count[z]>max){
				res=z;
				max=count[z];
			}
		}
		// Cumulative correct results and output the error results
		if(res==temp)result++;
		else printf("%d,%ld,%ld,%ld,%ld,%ld,%ld\n",temp,t[j*6],t[j*6+1],t[j*6+2],t[j*6+3],t[j*6+4],t[j*6+5]);
    }
    printf("%d\n",result);
    return 1;
}
