// union 联合体

#include <stdio.h>

union quantity
{
    short count;
    float weight;
    float volume;
};

int main(void)
{
    // 1.
    union quantity q0 = {.count = 0};
    // 2.
    union quantity q1;
    q1.weight = 0.1;
    // 3.
    union quantity q2 = {0}; // 不指定属性名,默认赋值给第一个属性

    union quantity *q3 = &q2;
    (*q3).count = 1;
    q3->count = 10;
    printf("q3 count %d\n", q3->count);
}