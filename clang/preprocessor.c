// prepressor 预处理器

#include <stdio.h>

// 宏 (macro)
#define HELLO "Hello World"
#define HELLO_0 "Hello \
World" //拆成两行
#define TWO 2
#define FOUR TWO *TWO
#define SUM(a, b) a + b      // 带参数的宏
#define ADD_FOUR(a) a + FOUR // 宏嵌套
#define STR(num) #num        // 替换后值转换为字符串

int main(void)
{
    printf("宏 HELLO: %s\n", HELLO);
    printf("宏 FOUR: %d\n", FOUR);
    printf("宏 HELLO 0: %s\n", HELLO_0);
    printf("宏 SUM: %d\n", SUM(1, 3));
    printf("宏 ADD_FOUR: %d\n", ADD_FOUR(10));
    printf("宏 TWO_STR: %s\n", STR(3.1415));
}