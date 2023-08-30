#include <bits/stdc++.h>
using namespace std;
#define MAX 5
template<typename t>
class STACK{
    int top;
    t arr[MAX];
    public:
    STACK()
    {
        top=-1;
    }
    void push(t a)
    {
        if(top==MAX-1)
        {
            cout<<"Overloaded !!!"<<endl;
            return;
        }

        else
        arr[++top]=a;

    }

    t pop(){
        if(top==-1)
        {
            cout<<"Underflow !!!";
            exit(1);
        }

        return arr[top--];
    }

    t peek(){
        if(top==-1 || top==MAX-1)
        {
            cout<<"Peek element doesnt exists..";
            exit(1);
        }
        return arr[top];
    }
};
int main()
{
    int n,m,ch;
    cout<<"Enter the size of the array: \n";
    cin>>n;
    STACK<int> ob;
    do{
        cout<<"Enter your choice :"<<endl;
        cin>>ch;
        switch(ch)
        {
            case 1:
            cout<<"To push element :"<<endl;
            cin>>m;
            ob.push(m);
            break;
            case 2:
            cout<<"To pop element :"<<endl;
            cout<<"The popped element is: "<<ob.pop()<<endl;
            break;
            case 3:
            cout<<"The top element is: "<<ob.peek()<<endl;
            break;
            default:
            cout<<"Invalid choice !!!";
            break;



        }
    }while(ch<4);
    cout<<"Program terminated !!!";
    return 0;
}
