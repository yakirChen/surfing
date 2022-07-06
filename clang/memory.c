// 内存管理

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
        *p = 100;
        printf("malloc 指针取值 %d\n", *p);
        // 释放内存
        free(p);
        printf("p free\n");
    }

    // calloc 分配内存空间并将内存全部初始化为0
    void *cp = calloc(10, sizeof(int));
    // 等同于:
    //  void *cp = malloc(sizeof(int) * 2);
    //  memset(cp, 0, sizeof(int) * 2);
    if (cp != NULL && cp)
    {
        // 释放内存
        free(cp);
        printf("cp free\n");
    }

    // realloc 分配内存
    int *rep = realloc(NULL, 1024);
    // 等同于:
    // malloc(1024);

    // realloc 修改已分配的内存块大小
    rep = realloc(rep, sizeof(int) * 10);
    if (rep != NULL && rep)
    {
        // 释放内存
        free(rep);
        printf("rep free\n");
    }

    // restrict 受限指针
    // 该块内存只有当前指针一种访问方式，其他指针不能对该内存进行读写操作
    int *restrict r_ptr = (int *)malloc(1024);
    if (r_ptr)
    {
        free(r_ptr);
        printf("r_ptr free\n");
    }

    // memcpy 内存拷贝
    char *str = "hello world";
    size_t len = strlen(str) + 1;
    printf("size t %zu\n", len);
    char *str_mal = malloc(len);
    if (str_mal)
    {
        strcpy(str_mal, str);
        memcpy(str_mal, str, len);
        printf("%s\n", str_mal);
        free(str_mal);
        printf("str_mal free\n");
    }

    // memmove 复制，如果目标区域与源区域有重叠，源区域内容会被更改，如果没有重叠，行为与memcpy()一致
    char mv_arr[] = "hello world yakir";
    char *mved = memmove(mv_arr, &mv_arr[6], 5); // world world yakir
    printf("%s\n", mved);

    // memcmp 比较内存区域
    char *s1 = "abc";
    char *s2 = "acd";
    int r = memcmp(s1, s2, 3); // 小于 0

    char s1[] = {'b', 'i', 'g', '\0', 'c', 'a', 'r'};
    char s2[] = {'b', 'i', 'g', '\0', 'c', 'a', 't'};

    // if (memcmp(s1, s2, 3) == 0) // true
    // if (memcmp(s1, s2, 4) == 0) // true
    // if (memcmp(s1, s2, 7) == 0) // false

    return 0;
}