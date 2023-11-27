
#include<stdio.h>

int main(){
    __int64_t t[1000000];
	// Read time data
    FILE *fp=fopen("re.txt","r");
    for(int i=0;i<10000;i++){
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
		if(t[j]>2600){
    		count[0]++;
		}else if(t[j]<2310&&t[j]>2200){
    		count[1]++;
		}else if(t[j]<2200){
    		count[2]++;
		}else if(t[j]<2600&&t[j]>2310){
    		count[3]++;
		}
		int res=0,max=count[0];
		for(int z=1;z<4;z++){
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
