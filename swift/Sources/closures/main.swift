/// 闭包
var letter = ["b", "d", "a", "c"]
var sortFunc = { (s1: String, s2: String) -> Bool in
  return s1 < s2
}
var letterSorted = letter.sorted(by: sortFunc)
print("Origin: \(letter) Sorted: \(letterSorted)")

// MAKR: 根据上下文推断类型
letterSorted = letter.sorted(by: { s0, s1 in s0 < s1 })
print("Origin: \(letter) Sorted: \(letterSorted)")

// MAKR: 参数名缩写
letterSorted = letter.sorted(by: { $0 < $1 })
print("Origin: \(letter) Sorted: \(letterSorted)")
print("Origin: \(letter) Sorted: \(letterSorted)")

// MAKR: 运算符方法
letterSorted = letter.sorted(by: <)
print("Origin: \(letter) Sorted: \(letterSorted)")
print("Origin: \(letter) Sorted: \(letterSorted)")

// MAKR: 尾随闭包
// letterSorted = letter.sorted() { $0 < $1 }
// 如果闭包表达式是函数或者方法的唯一参数，`()` 可省略
letterSorted = letter.sorted { $0 < $1 }
print("Origin: \(letter) Sorted: \(letterSorted)")

// MARK: 逃逸闭包 (escaping)
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
  completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
  closure()
}

class SomeClass {
  var x = 10
  func doSomething() {
    someFunctionWithEscapingClosure { self.x = 100 }
    someFunctionWithNonescapingClosure { x = 200 }
  }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
completionHandlers.first?()
print(instance.x)

// MARK: 自动闭包
func greeting(name nameProvider: () -> String) {
  print("Hello \(nameProvider())")

}
greeting(name: { "普通闭包" })
// MARK: 自动闭包
func greetingAutoClosures(name nameProvider: @autoclosure () -> String) {
  print("Hello \(nameProvider())")

}
greetingAutoClosures(name: "自动闭包")
