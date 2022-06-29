/// 嵌套类型

struct Human {
  enum Enum {
    struct Person {
      var name: String
    }
  }
}

let person = Human.Enum.Person(name: "哈哈哈")
print("\(person.name)")
