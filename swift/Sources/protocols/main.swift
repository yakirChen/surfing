/// 协议

protocol Greeting {
  // MARK: 属性要求
  var name: String { get }
  // MARK: 方法要求
  func greeting()
}

struct Person: Greeting {
  var name: String
  func greeting() {
    print("Person Greeting \(self.name)")
  }
}

class Human: Greeting {
  var name: String

  init(name: String) {
    self.name = name
  }
  func greeting() {
    print("Human Greeting \(self.name)")
  }
}

let person = Person(name: "yakir")
person.greeting()
let human = Human(name: "yakir")
human.greeting()
