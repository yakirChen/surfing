/// 类型转换

// MARK: 类型检查

let a: Any = 1
if a is Int {
  print("Int")
}
if a is Int32 {
  print("Int32")
}

// MARK: 向下转型
let aAs = a as? Int8
print("\(aAs ?? 0)")

// MARK: Any

let n0: Int8 = 0
let n1: Int = 0
let n2: Int16 = 0
let n3: Int32 = 0
let ns = "String"
let anyArray: [Any] = [n0, n1, n2, n3, ns]
for any in anyArray {
  print("any \(any)")

}
