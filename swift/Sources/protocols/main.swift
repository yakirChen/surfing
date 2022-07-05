/// 协议

protocol Greeting {
  // MARK: 属性要求
  var name: String { get }
  // MARK: 方法要求
  func greeting()

  // MARK: 各种要求
  // ...
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

// MARK: 协议作为类型
func sayHello(greeting: Greeting) {
  greeting.greeting()
}
sayHello(greeting: person)

// MARK: 委托
// MARK: 有条件地遵循协议

// MARK: 类专属协议 (继承AnyObject)
protocol ClassOnlyProtocol: AnyObject {

}
