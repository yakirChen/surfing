// 内存管理

#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int a = 10;
    // void 指针
    // 不能用 *v_ptr 取值
    void *v_ptr = &a;
    int *i_ptr = v_ptr;
    printf("指针取值 %d\n", *i_ptr);

    // malloc 堆上分配内存
    int *p = malloc(sizeof(int));
    // 判断内存是否分配成功
    if (p == NULL)
    {
        printf("内存分配失败\n");
    }
    if (!p)
    {
        printf("内存分配失败\n");
    }

    if (p != NULL && p)
    {
        free(p);
        printf("free\n");
    }

    *p = 100;
    printf("malloc 指针取值 %d\n", *p);

    return 0;
}