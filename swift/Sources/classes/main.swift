/// Structure & Class & Properties 结构体、类、属性

// MARK: 基础定义
struct Square {
  var width: Int
  var height: Int

  // MARK: 计算属性
  var center: Point {
    get {
      let centerX: Double = Double(self.width) / 2
      let centerY: Double = Double(self.height) / 2
      return Point(x: centerX, y: centerY)
    }
    set {
      self.width = 0
      self.height = 0
    }
  }

  // MARK: 只读计算属性
  var centerReadOnly: Point {
    let centerX: Double = Double(self.width) / 2
    let centerY: Double = Double(self.height) / 2
    return Point(x: centerX, y: centerY)
  }
}

class Person {
  var name: String

  // MARK: 延迟加载存储属性
  // lazy 标识延迟加载存储属性，表示第一次被调用是才会计算其初始值
  // 多线程访问时无法保证该属性只初始化一次
  lazy var gender: Gender = Gender.male

  init(name: String) {
    self.name = name
  }
}

enum Gender {
  case male
  case female
}

struct Point {
  var x = 0.00, y = 0.00
}

var square0 = Square(width: 1, height: 1)
// 创建副本
var square1 = square0
square0.width = 2
// 2 1
print("square0 width: \(square0.width) square1 width: \(square1.width)")
print("square1 center: \(square1.center)")
print("square1 centerReadOnly: \(square1.centerReadOnly)")

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
