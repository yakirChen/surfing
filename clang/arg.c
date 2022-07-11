// 命令行参数

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    for (int i = 0; i < argc; i++)
    {
        printf("arg %d: %s\n", i, argv[i]);
    }

    // 获取环境变量
    char *java_home = getenv("JAVA_HOME");
    printf("Java Home: %s\n", java_home);
}