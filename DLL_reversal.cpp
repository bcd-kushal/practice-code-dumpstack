#include <bits/stdc++.h>
using namespace std;

DoublyList reverseList(DoublyList *head){
    if(!head)  return NULL;

    DoublyList *ptr, *ptr2;

    while(head->next){
        ptr = head->next;
        ptr2 = head->prev;

        head->prev = (!ptr)? NULL:ptr;
        head->next = (!ptr2)? NULL:ptr2;
        head=ptr;
    }

    head->next = head->prev;
    head->prev = NULL;
    return head;
}
