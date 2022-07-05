#include <stdio.h>

void counter(void);

void counter(void)
{
    // 改变量只需要初始化一次
    static int count = 0;
    count++;
    printf("%d\n", count);
}