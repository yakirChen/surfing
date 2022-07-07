// typedef 别名

typedef unsigned int UI;
typedef unsigned int UI0, UI1; // 指定多个别名
UI age = -1;

typedef char *String; // 字符指针别名

typedef char array[5]; // 长度为5的字符数组别名
array arr = "hello";

typedef signed char (*func)(void); //函数别名
// signed char(*)(void)