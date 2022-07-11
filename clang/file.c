// 文件

#include <stdio.h>
#include <stdlib.h>

void file_read(FILE *file);
void file_read_line(FILE *file);
void file_read_line_0(FILE *file);
void freopen_std();

/*
r：读模式，只用来读取数据。如果文件不存在，返回 NULL 指针。
w：写模式，只用来写入数据。如果文件存在，文件长度会被截为0，然后再写入；如果文件不存在，则创建该文件。
a：写模式，只用来在文件尾部追加数据。如果文件不存在，则创建该文件。
r+：读写模式。如果文件存在，指针指向文件开始处，可以在文件头部添加数据。如果文件不存在，返回 NULL 指针。
w+：读写模式。如果文件存在，文件长度会被截为0，然后再写入数据。这种模式实际上读不到数据，反而会擦掉数据。如果文件不存在，则创建该文件。
a+：读写模式。如果文件存在，指针指向文件结尾，可以在现有文件末尾添加内容。如果文件不存在，则创建该文件。
*/
int main(void)
{
    char *path = "/Users/yakir/Developer/think/surfing/clang/file.c";
    FILE *stream = fopen(path, "r+");

    file_read(stream);
    file_read_line(stream);
    file_read_line_0(stream);

    fclose(stream);
    fclose(stream);

    freopen_std();
    return 0;
}

void file_read(FILE *file)
{
    if (NULL == file)
    {
        return;
    }

    char c;
    while ((c = fgetc(file)) != EOF)
    {
        printf("%c", c);
    }
    printf("\n");
}

void file_read_line(FILE *file)
{
    if (NULL == file)
    {
        return;
    }

    char chars[1024];
    int line = 0;

    while (fgets(chars, sizeof chars, file) != NULL)
    {
        printf("%d: %s", ++line, chars);
    }
}

void file_read_line_0(FILE *file)
{
    if (NULL == file)
    {
        return;
    }

    char chars[1024];
    int line = 0;

    while (!feof(file))
    {
        fscanf(file, "%d: %s", &line,  chars);
        printf("%d: %s", line, chars);
    }
}

void freopen_std()
{
    char *test_txt = "/Users/yakir/Developer/think/surfing/clang/test.txt";
    FILE *test_file = freopen(test_txt, "w", stdout);
    printf("hello\n");
}