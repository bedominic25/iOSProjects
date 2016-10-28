#include<stdlib.h>
#include<stdio.h>

struct Node {
	int data;
	struct Node* next;
};
struct Node* head;

void insert(int x){
	struct Node* temp;
	temp = (Node *)malloc(sizeof(struct Node)); 
	temp->data = x;
	temp->next = NULL;
	head = temp;
	//if (head != NULL) temp->next = head;
	head = temp;
}
void Print(){
	struct Node* temp = head;
	printf("List is: ");
	while(temp != NULL){
	printf("%d", temp->data);
	temp= temp->next;
	}
	printf("\n");
}
int main() {
	head = NULL; //empty list
	printf("How many numbers?\n");
	int n,i,x;
	scanf("%d", &n);
	for(i=0; i < n; i++){
	printf("Enter the number \n");
	scanf("%d", &x);
	insert(x);
	Print();
	}
}
