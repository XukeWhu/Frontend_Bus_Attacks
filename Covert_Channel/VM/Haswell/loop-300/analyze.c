
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
		int temp=j&0x7;
		int count[8];
		for(int n=0;n<8;n++){
			count[n]=0;
		}
		// Data decode
		for(int n=0;n<6;n++){
			if(t[j*6+n]>3100 && t[j*6+n]<3400){
    			count[0]++;
			}else if(t[j*6+n]>3400 && t[j*6+n]<3600){
    			count[1]++;
			}else if(t[j*6+n]>3600 && t[j*6+n]<3800){
    			count[2]++;
			}else if(t[j*6+n]>3800 && t[j*6+n]<3880){
    			count[3]++;
			}else if(t[j*6+n]>2600 && t[j*6+n]<3100){
    			count[4]++;
			}else if(t[j*6+n]>3880 && t[j*6+n]<4100){
    			count[5]++;
			}else if(t[j*6+n]>4650 && t[j*6+n]<6000){
    			count[6]++;
			}else if(t[j*6+n]>4100 && t[j*6+n]<4650){
    			count[7]++;
			}
		}
		// Voting for result
		int res=0,max=count[0];
		for(int z=1;z<8;z++){
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
