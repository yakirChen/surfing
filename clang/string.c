// 多字节字符

#include <limits.h>
#include <stdlib.h>
#include <stdio.h>
#include <locale.h>
#include <wchar.h>

int main(int argc, char *argv[])
{
    setlocale(LC_ALL, "zh_CN.UTF-8");

    char *spring0 = "热热热";
    char *spring1 = "\xe7\x83\xad\xe7\x83\xad\xe7\x83\xad";

    printf("%s\n", spring0);
    printf("%s\n", spring1);

    // 宽字符
    wchar_t niu = L'牛';
    printf("%lc\n", niu);
    wchar_t *niu_niu = L"牛牛牛";
    printf("%ls\n", niu_niu);

    // 多字节字符占用的字符数
    char *niu_0 = "牛牛";
    printf("%s 字符数 %d\n",niu_0, mblen(niu_0, MB_CUR_MAX));
}