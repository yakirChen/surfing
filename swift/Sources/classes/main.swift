/// Structure & Class 结构体和类

// MARK: 基础定义
struct Square {
  var width: Int
  var height: Int
}

class Person {
  var name: String

  init(name: String) {
    self.name = name
  }
}

var square0 = Square(width: 1, height: 1)
// 创建副本
var square1 = square0
square0.width = 2
// 2 1
print("square0 width: \(square0.width) square1 width: \(square1.width)")

var person0 = Person(name: "yakir")
// 创建引用副本
var person1 = person0
person0.name = "yakirChen"
// yakirChen yakirChen
print("person0 name: \(person0.name) person1 name: \(person1.name)")

// MARK: 结构体逐一成员构造器
var square2 = Square(width: 10, height: 10)

// MARK: === !==
// 判断类变量是否同时引用一个类实例
if person0 === person1 {
  print("person0 person1 引用同一个类实例")
}
let person2 = Person(name: "🌝")
if person0 !== person2 {
  print("person0 person2 没有引用同一个类实例")
}
