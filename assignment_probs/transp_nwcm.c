#include <stdio.h>
#include <stdlib.h>

/*
	get minimum
	size of arr
	diff b/w 2 nos.
*/

#define SIZE(x) (sizeof(x)/(sizeof(x)[0]))
#define DIFF(a,b) (a-b)

int getMin(int arr[],int size){
	int min = *arr;
	for(int i=0;i<size;i++)
		if(min>arr[i])
			min=arr[i];
	return min;
}

int main(){
	int a[] = {13,22,33,14,5,6}, p;
	p=getMin(a,SIZE(a));
	printf("Min is %d",p);
	getchar();
	return 0;
}