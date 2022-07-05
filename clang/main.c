// c 指针

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>

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

// 可变参数
int sum(int i, ...);

void array();

int array_arg(int[], int len);

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

    // static 不能修饰变量，只能修饰常量
    // static int var = a;
    static int s;
    // 相当于 static int s = 0;

    int total = sum(5, 2, 3, 4, 5, 6);
    printf("和 %d\n", total);

    array();
    int a_arr[] = {0, 1, 2, 3, 4, 5};
    array_arg(a_arr, 6);
    array_arg((int[]){0, 1, 2, 3, 4, 5}, 6);

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

static void Inner()
{
    printf("static修饰函数，函数只能在当前文件中使用");
}

void const_value_ptr(const int *a)
{
    // const 指针指向的值在函数内部被不能修改
    // *a = 0;

    // a本身可以被修改
    int b = 0;
    a = &b;
}

void const_prt(int *const a)
{
    // const 限制修改指针, 可以修改指针指向的值
    *a = 0;

    // 限制修改指针
    // int b = 0;
    // a = &b;
}

void const_both(const int *const a)
{
    // 限制修改指针和指针指向的值
}

// 第一个值可以表示参数个数
int sum(int i, ...)
{
    int sum = 0;
    va_list args; // 定义可变参数对象
    va_start(args, i);
    for (int j = 0; j < i; ++j)
    {
        // 获取可变参数对象中的值
        int val = va_arg(args, int);
        sum += val;
    }
    va_end(args);
    return sum;
}

void array()
{
    int int_arr[3];
    int sizeof_arr = sizeof(int_arr);
    printf("数组长度 %d\n", sizeof_arr);

    // 多维数组
    int dimension_arr[2][2];

    // 变长数组(运行时确定长度)
    int a, b;
    int x = a + b;
    int var_len_arr[x];

    int len = 3;
    int a_arr[] = {0, 1, 2};

    // 访问数组元素, 两种访问形式
    printf("访问数组元素 %d \n", a_arr[1]);
    printf("访问数组元素 %d \n", *(a_arr + 1));

    // 遍历数组元素
    // 数组名是指针, 指向数组第一个元素
    int *a_ptr = a_arr;
    while (*a_ptr != 2)
    {
        printf("访问数组元素0 %d \n", *a_ptr);
        a_ptr++;
    }
    for (int i = 0; i < len; i++)
    {
        printf("访问数组元素1 %d\n", *(a_arr + i));
    }
}

int array_arg(int a[], int len)
{
    int sum;
    for (int i = 0; i < len; i++)
    {
        sum += *(a + i);
    }
    return sum;
}