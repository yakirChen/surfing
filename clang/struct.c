// 结构体

#include <stdio.h>
#include <stdlib.h>

struct person
{
    char *name;
    int age;
};

// 结构体指针运用
// 结构体变量传入函数，函数内部得到的是一个原始值的副本
void happy(struct person *p)
{
    // 两种写法
    (*p).age = (*p).age + 1;
    // 从struct指针取值
    p->age = p->age + 1;
}

// 声明结构体并初始化两个变量 book0, book1
struct book
{
    char *name;
} book0 = {"书0"},
  book1 = {"书1"};

// 声明匿名结构体并声明变量human, human0
struct
{
    char *name;
} human,
    human0 = {"人"};

// 定义结构体并指定别名
typedef struct call_phone
{
    char *phone_num;
} phone;

// 指针变量指向结构体
struct person_ptr *person;
// 或者
struct person_copy
{
    char *name;
    int age;
} * person_copy_ptr;

// 结构体嵌套
struct name
{
    char first[100];
    char last[100];
};

struct student
{
    struct name name;
    short age;
};

struct node
{
    int data;
    struct node *next;
};

void linked_nodes()
{
    struct node *head = malloc(sizeof(struct node));
    head->data = 11;
    head->next = malloc(sizeof(struct node));

    head->next->data = 22;
    head->next->next = malloc(sizeof(struct node));

    head->next->next->data = 33;
    head->next->next->next = NULL;

    // 遍历这个列表
    for (struct node *cur = head; cur != NULL; cur = cur->next)
    {
        printf("%d\n", cur->data);
    }
}

// 位字段 (bit field)
// 属性后面的:1，表示指定这些属性只占用一个二进制位，所以这个数据结构一共是4个二进制位。
struct
{
    unsigned int ab : 1;
    unsigned int cd : 1;
    unsigned int ef : 1;
    unsigned int gh : 1;
} synth;
// 实际存储的时候，C 语言会按照int类型占用的字节数，存储一个位字段结构。
// 如果有剩余的二进制位，可以使用未命名属性，填满那些位。
// 也可以使用宽度为0的属性，表示占满当前字节剩余的二进制位，迫使下一个属性存储在下一个字节。
struct
{
    unsigned int field1 : 1;
    unsigned int : 2;
    unsigned int field2 : 1;
    unsigned int : 0;
    unsigned int field3 : 1;
} stuff;
// stuff.field1与stuff.field2之间，有一个宽度为两个二进制位的未命名属性。stuff.field3将存储在下一个字节

// 弹性数组成员
struct flexible_arr
{
    int len;
    char chars[];
};

int main(void)
{
    struct person yakir = {"yakir", 18};
    printf("person info %s %d\n", yakir.name, yakir.age);
    happy(&yakir);
    printf("name: %s age: %d\n", yakir.name, yakir.age);

    struct student stu = {
        .age = 18,
        .name = {
            .first = "chen",
        },
        .name.last = "yakir",
    };

    printf("student age %d name.first %s name.last %s \n", stu.age, stu.name.first, stu.name.last);

    linked_nodes();

    // 在flexible_arr分配内存时确定数量
    struct flexible_arr *flex_a = malloc(sizeof(struct flexible_arr) + sizeof(char) * 10);
    (*flex_a).len = 10;

    return 0;
}