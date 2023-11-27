
#include<stdio.h>

int main(){
	__int64_t t[1000000];
	int  point=0;
	int result = 0;
	__int64_t mean = 0;
	int times = 0;
	// read data
	FILE *fp=fopen("re0.txt","r");
	for(int i=0;i<600000;i++){
		fscanf(fp,"%ld",&t[i]);
	}
	// decode secret
	for(int j=0;j<40000;j++){
		// Remove the very first time samples that are affected by noise
		for(int i = 6; i < 15; i++) {
			// Locate the nop-receiver corresponding to the victim's execution of nop-DI
			if (t[j * 15 + i] > 900) {
				// Locate the nop-receiver that encoded the secret and decode the secret
				if (t[j * 15 + i - 1] < 795) {
					times++;
				}
				break;
			}
		}
		// Vote for the final result
		if (j % 20 == 19) {
			if(times > 3)result++;
			times = 0;
		} 
	}
	// Output the number of private messages decoded to 0
        printf("result:%d\n", result);
        return 1;
}
