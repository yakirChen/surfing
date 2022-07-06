// 结构体

#include <stdio.h>

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

    return 0;
}