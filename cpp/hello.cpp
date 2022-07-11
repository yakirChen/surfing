// Hello World

#include <iostream>
#include <string>

using namespace std;

// 宏的形式定义常量
#define MALE male

const int ZERO = 0;

enum gender { male = ZERO, female };

class Human {
private:
  string name;
  int age;
  gender gdr;

public:
  Human(void);
  Human(string name, int age, gender gdr);
  ~Human(void);
  string toString(void);
  static Human me(void);
};

Human::Human(void) {}
Human::Human(string name, int age, gender gdr) {
  this->name = name;
  this->age = age;
  this->gdr = gdr;
}
Human::~Human(void) { cout << "析构" << endl; }
Human Human::me() {
  Human human;
  human.name = "yakir";
  human.age = 18;
  return human;
}
string Human::toString() {
  return "姓名:" + name + " ," + "年龄: " + std::to_string(age) + " ," +
         "性别: " + std::to_string(gdr);
}

// 类型别名
typedef Human Person;

int main() {

  string name;
  int age;
  cout << "姓名: ";
  cin >> name;
  cout << "年龄: ";
  cin >> age;

  Human human(name, age, MALE);
  string str = human.toString();
  cout << str << endl;
  Person me = Person::me();
  cout << "我: " << me.toString() << endl;

  return 0;
}