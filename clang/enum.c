// enum 枚举

#include <stdio.h>

enum colors
{
    RED,
    GREEN = 3, // 编号
    BLUE,      // 自动编号
};

enum
{
    x = 1,
    y = 1,
    z = 1,
};

int main(void)
{
    enum colors color = RED;
    printf("color %u\n", color); // color 0
    printf("color %u\n", GREEN); // color 3
    printf("color %u\n", BLUE);  // color 4

    printf("x %u\n", x); // 1
    printf("y %u\n", y); // 1
    printf("z %u\n", z); // 1
}