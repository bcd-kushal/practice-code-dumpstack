#include<bits/stdc++.h>
using namespace std;
class DB; //to include friend
class DM
{
    int m,cm;
    public :
    DM(int a, int b)
    {
        m=a;
        cm=b;
    }
    void display()
    {
        cout<<m<<"m"<<" "<<cm<<"cm"<<endl;
    }
    friend DM addDist(DM,DB);
    friend DB Dist(DM,DB);

};

class DB{
    int ft,inches;
    public:
    DB(int a, int b)
    {
        ft=a;
        inches=b;
    }

    void display()
    {
        cout<<ft<<"Ft"<<" "<<inches<<"In"<<endl;
    }
    friend DM addDist(DM,DB);
    friend DB Dist(DM,DB);
};

DM addDist(DM ob, DB obj)
{
    int total_cm=(ob.m*100+ob.cm)+(obj.ft*12+obj.inches)*2.54;
    int mt=total_cm/100;
    int cmm=total_cm%100;
    DM dm(mt,cmm);
    cout<<dm;
    return dm;
}

DB Dist(DM ob, DB obj)
{
    int total_inches=(ob.m*100+ob.cm)/2.54 +(obj.ft*12+obj.inches);
    int feet, inc;
    feet=total_inches/12;
    inc=total_inches%12;
    DB db(feet,inc);
    return db;
}
int main()
{
    DM ob(4,5);
    DB obj(5,10);
    DM ob1=addDist(ob,obj);
    //cout<<"The distance in m and cm: "<<ob1.display()<<endl;
    DB obj1=Dist(ob,obj);
    //cout<<"The distance in ft and inches: "<<obj1.display()<<endl;
    return 0;
}
