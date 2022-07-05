/// 泛型

func printOut<T>(_ input: T) {
  print("\(input)")
}
printOut("a")
printOut(0)

// MAKE: 泛型约束
protocol ToString {
  func string() -> String
}
func printString<T: ToString>(_ input: T) {
  let string = input.string()
  print(string)
}
class Person: ToString {

  var value: String

  init(value: String) {
    self.value = value
  }
  func string() -> String {
    "\(self.value)"
  }
}

let person = Person(value: "哈哈哈")
print("\(person.string())")
