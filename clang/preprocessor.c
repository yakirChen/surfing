// prepressor 预处理器

#include <stdio.h>

// 宏 (macro)
#define HELLO "Hello World"
#define HELLO_0 "Hello \
World" //拆成两行
#define TWO 2
#define FOUR TWO *TWO
#define SUM(a, b) a + b                                           // 带参数的宏
#define ADD_FOUR(a) a + FOUR                                      // 宏嵌套
#define STR(num) #num                                             // 替换后值转换为字符串
#define DYNAMIC_ARG(a, b, ...) a, b, __VA_ARGS__                  // 替换后值转换为字符串
#define DYNAMIC_ARG_0(a, b, ...) (a * 10 + b + 11.1), __VA_ARGS__ // 替换后值转换为字符串
#define DYNAMIC_ARG_1(a, b, ...) #a, #b, #__VA_ARGS__             // 替换后值转换为字符串

#define DEF 1
#if defined DEF // 预处理器的调减判断 1一般为表达式
// 替代简写
// #ifdef DEF
// 取消定义宏
#undef DEF
#else
// 什么也不做
#endif

#ifndef DEF
#define DEF 10
#endif

#line 100 //用户覆盖预定义宏 __LINE__

#if __STDC_VERSION__ < 201710L
  #error Not C17
#endif

#pragma c22 on // 用来修改编译器属性

int main(void)
{
    printf("宏 HELLO: %s\n", HELLO);
    printf("宏 FOUR: %d\n", FOUR);
    printf("宏 HELLO 0: %s\n", HELLO_0);
    printf("宏 SUM: %d\n", SUM(1, 3));
    printf("宏 ADD_FOUR: %d\n", ADD_FOUR(10));
    printf("宏 TWO_STR: %s\n", STR(3.1415));
    printf("宏 DYNAMIC_ARG: %f %d %s\n", DYNAMIC_ARG(3.1415, 10, "abc"));
    printf("宏 DYNAMIC_ARG_0: %f %d\n", DYNAMIC_ARG_0(3.1415, 10, 1));
    printf("宏 DYNAMIC_ARG_1: %s %s %s\n", DYNAMIC_ARG_1(3.1415, 10, 1));
    printf("%d\n", DEF);

    printf("正在执行的函数名: %s\n", __func__);
    printf("文件名: %s\n", __FILE__);
    printf("行号: %d\n", __LINE__);
    printf("编译日期: %s 编译时间: %s\n", __DATE__, __TIME__);
    printf(" C 语言版本: %ld\n", __STDC_VERSION__);

}