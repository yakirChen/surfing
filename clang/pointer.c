// c 指针

#include <stdio.h>
#include <stdlib.h>

// extern 说明符
extern void counter(void);

void increment0(int a);
int increment1(int a);
void increment2(int *a);
void swap(int *a, int *b);
// 函数指针声明
void (*swap_ptr)(int *, int *);

// 函数作为参数
void compute(void (*swap)(int *, int *));

void sys_exit();

int main(void)
{
    int i = 18;
    // 指针
    int *ipt = &i;
    // 指针的指针
    int **iptpt = &ipt;
    printf("指针 %d\n", *ipt);
    printf("指针的指针%d\n", **iptpt);

    increment0(i);
    printf("值拷贝%d\n", i);

    i = increment1(i);
    printf("值拷贝返回%d\n", i);

    increment2(&i);
    printf("指针传递%d\n", i);

    int bool = (swap == &swap); // 1 true
    printf("函数名与函数引用 %d\n", bool);

    int a = 10, b = 20;
    // 写法一
    swap(&a, &b);
    printf("值交换 a: %d b: %d\n", a, b);
    // 写法二
    (*swap)(&a, &b);
    printf("值交换 a: %d b: %d\n", a, b);
    // 写法三
    (&swap)(&a, &b);
    printf("值交换 a: %d b: %d\n", a, b);
    // 写法四
    (*swap_ptr)(&a, &b);
    printf("值交换 a: %d b: %d\n", a, b);
    // 写法五
    swap_ptr(&a, &b);
    printf("值交换 a: %d b: %d\n", a, b);

    counter();
    counter();

    return 0;
}

// 值拷贝
void increment0(int a)
{
    a++;
}

int increment1(int a)
{
    a++;
    return a;
}

void increment2(int *pt)
{
    (*pt)++;
}

void swap(int *a, int *b)
{
    int tmp;
    tmp = *a;
    *a = *b;
    *b = tmp;
}

// 函数指针
// 函数名本身就是指向函数代码的指针
// swap 与 &swap 作用相同
void (*swap_ptr)(int *, int *) = &swap;

void sys_exit()
{
    // EXIT_SUCCESS在stdlib.h中
    exit(EXIT_SUCCESS);
}