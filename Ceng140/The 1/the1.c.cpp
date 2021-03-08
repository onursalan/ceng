#include<stdio.h>
#include<math.h>
double f(double x){
	return x*x-2*x+1;
}


int main(){
	double x2,x1,arti,eksi,payda,fonk,turev,lower,lower1,upper,tolerance,temp;
	double arr[20000];
	double f(double x);
	int size=0,i,j,count=0;
	scanf("%lf %lf %lf",&lower,&upper,&tolerance);
	lower1 = lower;
	i=0;
	for(;lower<=upper;lower=lower+0.25){
	x1 = lower ;
	fonk =f(x1);
	arti = f(x1+0.000000001);
	eksi = f(x1-0.000000001);
	payda = 2*0.000000001;
	turev = (arti-eksi)/payda;	
	x2 = x1 - fonk/turev;
	for(;fabs(x2-x1)>10*tolerance;){
	x1 = x2;
	fonk =f(x1);
	arti = f(x1+0.000000001);
	eksi = f(x1-0.000000001);
	payda = 2*0.000000001;
	turev = (arti-eksi)/payda;
	x2 = x1 - fonk/turev;
	}
	if (x2>=lower1&&x2<=upper){
		arr[i]= x2;
		size++;
		i++;
	}
}
	for(i=0;i<size;i++){
		for(j=0; j<size-1-i; j++){
            if(arr[j] > arr[j+1]){
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
               
            }
		}
	}
	for(i=0;i<size;i++){
		
	
			if(fabs(arr[i+1]-arr[i])<10*tolerance&&(i+1)!=size){
				continue;
				
			}
		printf("%f ",arr[i]);
		count++;
	}
	printf("%d",count);
	return 0;
}
