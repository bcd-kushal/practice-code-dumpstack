#include <stdio.h>
int global_row=0,global_col=0;

int allotValue(int allot_arr[global_row][global_col],int i,int j){
	int value=0;
	if(allot_arr[i][global_col-1]<allot_arr[global_row-1][j]){
		value=allot_arr[i][global_col-1];
		allot_arr[global_row-1][j]-=allot_arr[i][global_col-1];
		allot_arr[i][global_col-1]=0;
	} else {
		value=allot_arr[global_row-1][j];
		allot_arr[i][global_col-1]-=allot_arr[global_row-1][j];
		allot_arr[global_row-1][j]=0;
	}
	return value;
}

int sum(int allot_arr[global_row][global_col]){
	int i,sum=0;
	for(i=0;i<global_col-1;i++)
		sum+=allot_arr[global_row-1][i];
	if(sum>0)   return 1;
	for(i=0;i<global_row-1;i++)
		sum+=allot_arr[i][global_col-1];
	return sum;
}


//=======================[NWCM]=========================

int NWCM(int arr[global_row][global_col],int allot_arr[global_row][global_col]){
	int i,j,nwcm_cost=0,next_coord[2]={0,0},stepval=1;
	printf("\nUpon NWCM:\n");
	for(i=0;i<global_row-1;i++){
		for(j=0;j<global_col-1;j++){
			if(i==next_coord[0] && j==next_coord[1]){
				allot_arr[i][j]=allotValue(allot_arr,i,j);
				if(allot_arr[i][global_col-1]==0)
					next_coord[0]+=1;
				if(allot_arr[global_row-1][j]==0)
					next_coord[1]+=1;
				nwcm_cost+=allot_arr[i][j]*arr[i][j];
				printf("\nStep %d:\n",stepval);
				printArray(allot_arr);
				printf("\nCurrent Cost += (%d*%d) = %d\n---------------------\n",allot_arr[i][j],arr[i][j],nwcm_cost);
				++stepval;
			}
		}
	}
	printAllotedArray(arr,allot_arr);
	printf("\nFinal Cost = %d",nwcm_cost);
	
	return nwcm_cost;
}

//==================[Matrix Minima]=====================

int MatrixMinima(int arr[global_row][global_col],int allot_arr[global_row][global_col]){
	int i,j,matmin_cost=0,step=1,next_coord[2]={0,0};
	
	while(sum(allot_arr)!=0){
		printf("\nStep: %d\n",step++);
		getMinOfMatrix(arr,allot_arr,next_coord);
		i=next_coord[0];
		j=next_coord[1];
		allot_arr[i][j]=allotValue(allot_arr,i,j);
		matmin_cost+=allot_arr[i][j]*arr[i][j];
		printArray(allot_arr);
		printf("\nCurrent cost+= (%d*%d) = %d\n",allot_arr[i][j],arr[i][j],matmin_cost);
	}
	printAllotedArray(arr,allot_arr);
	return matmin_cost;
}

void getMinOfMatrix(int arr[global_row][global_col],int allot_arr[global_row][global_col],int loc[2]){
	int i,j,min=99999;
	for(i=0;i<global_row-1;i++)
		for(j=0;j<global_col-1;j++)
			if(arr[i][j]<min && allot_arr[i][global_col-1]!=0 && allot_arr[global_row-1][j]!=0){
				min=arr[i][j];
				loc[0]=i;
				loc[1]=j;
			}
}

//=======================[VAM]==========================








//==================[Printing array]====================

void printArray(int arr[global_row][global_col]){
	int i,j;
	for(i=0;i<global_row;i++){

		if(i==global_row-1){
			for(j=0;j<=global_col;j++)
				printf("========");
			printf("\n");
		}
				
		for(j=0;j<global_col;j++){
			if(j==global_col-1 && i<global_row-1)  		   printf("||\t%d    ",arr[i][j]);
			else if(j==global_col-1 && i==global_row-1)    printf("||");
			else								      	   printf("%d\t",arr[i][j]);
			if(i==0 && j==global_col-1)         printf("[ Capacities ]");
		}

		printf("\n");
	}
	printf("[ Requirements ]\n");
}

void printAllotedArray(int arr[global_row][global_col],int allot_arr[global_row][global_col]){
	int i,j;
	for(i=0;i<global_row;i++){
		if(i==global_row-1){
			for(j=0;j<=global_col;j++)
				printf("========");
			printf("\n");
		}
		for(j=0;j<global_col;j++){
			if(i<global_row-1 && j<global_col-1){
				if(allot_arr[i][j]>-1){
					printf("%d(%d)\t",arr[i][j],allot_arr[i][j]);
				}
				else    printf("X\t");
			}
			else if(i==global_row-1 && j==global_col-1)
				printf("||");
			else{
				if(j==global_col-1) printf("|| %d     ",allot_arr[i][j]);
				else				printf("%d\t",allot_arr[i][j]);
			} 
		}
		printf("\n");
	}
}

//===============[Inputs and Balancing]=================

int main(){
	int i,j,row=0,col=0,sum=0,new_row=0,new_col=0;
	printf("How many rows and columns?\n");
	scanf("%d%d",&row,&col);
	row+=1;
	col+=1;
	
	//idea is enter dimensions->cap,req->bal,unbal check->mat input
	int x[row][col];
	printf("Enter the capacities:\n");
	for(i=0;i<row-1;i++){
		scanf("%d",&x[i][col-1]);
		sum+=x[i][col-1];
	}
	printf("Enter the requirements:\n");
	for(i=0;i<col-1;i++){
		scanf("%d",&x[row-1][i]);
		sum-=x[row-1][i];
	}
	
	//check balanced or unbalanced
	if(sum==0)
		printf("The given problem is BALANCED.");
	else{
		if(sum<0){
			printf("The given problem is UNBALANCED. \nDummy Row is added with capacity = %d.",(-1)*sum);
			new_row=row+1;
			new_col=col;
		}
		else{
			printf("The given problem is UNBALANCED. \nDummy Column is added with requirement = %d.",sum);
			new_row=row;
			new_col=col+1;
		}
	}
	
	
	//enter full matrix
	printf("\nEnter the costs per unit:\n");
	for(i=0;i<row-1;i++)
		for(j=0;j<col-1;j++){
			printf("[%d][%d]: ",i,j);
			scanf("%d",&x[i][j]);
		}
	
	//handle unbalanced
	int bal_arr[new_row][new_col];
	if(sum!=0){
		if(sum<0){
			
			for(i=0;i<new_row;i++)
				for(j=0;j<new_col;j++){
					if(i==new_row-2){
						if(j!=new_col-1)	bal_arr[i][j]=0;
						else                bal_arr[i][j]=-1*sum;
					}
					else{
						if(i==new_row-1)	bal_arr[i][j]=x[i-1][j];
						else				bal_arr[i][j]=x[i][j];
					}
				}

		} else {
			
			for(i=0;i<new_row;i++)
				for(j=0;j<new_col;j++){
					if(j==new_col-2){
						if(i==new_row-1)    bal_arr[i][j]=sum;
						else                bal_arr[i][j]=0;
					}
					else{
						if(j==new_col-1)    bal_arr[i][j]=x[i][j-1];
						else				bal_arr[i][j]=x[i][j];
					}
				}
		}
		
		global_row=new_row;
		global_col=new_col;
		printArray(bal_arr);
	}
	else{
		global_row=row;
		global_col=col;
		printArray(x);
	}
	
	// allotment matrix
	int allot_arr[global_row][global_col];
	for(i=0;i<global_row;i++)
		for(j=0;j<global_col;j++){
			if(j==global_col-1)     	allot_arr[i][j]=(sum==0)?x[i][j]:bal_arr[i][j];
			else if(i==global_row-1)    allot_arr[i][j]=(sum==0)?x[i][j]:bal_arr[i][j];
			else						allot_arr[i][j]=-1;
		}
	printf("\nAllotments look like this:\n");
	printArray(allot_arr);
	
	
	int nwcm_cost=0;
	int mat_min_cost=0;
	int vam_cost=0;
	
	
	
//	if(sum!=0)  nwcm_cost=NWCM(bal_arr,allot_arr);
//	else        nwcm_cost=NWCM(x,allot_arr);
	
	if(sum!=0)  mat_min_cost=MatrixMinima(bal_arr,allot_arr);
	else        mat_min_cost=MatrixMinima(x,allot_arr);
	
	printf("\n\nCosts:  NWCM method =\t %d\n\tMat-minima method =\t %d\n\tVogels Method = %d",nwcm_cost,mat_min_cost,vam_cost);
	
	return 0;
}
