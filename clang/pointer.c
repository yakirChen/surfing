// c 指针

#include <stdio.h>

int main()
{
    int i = 18;
    int *ipt = &i;
    int **iptpt = &ipt;

    printf("%d\n", *ipt);
    printf("%d\n", **iptpt);
}