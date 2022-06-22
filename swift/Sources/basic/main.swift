let swift = "Swift"
// 字符串插值
let greeting = "Hello \(swift) 🤓 !"
print(greeting)

let one = 1
let two = 2
print(" 1 + 2 = \(one + two)")

// 类型别名
typealias Str = String
let str: Str = "你好🙂 !"
print("\(str)")

// 空合运算符
let optionalVal: String? = "A"
let optionalVal0: String? = nil
// 三元运算符形式
let ternaryConditional = nil != optionalVal ? optionalVal! : "B"
print(ternaryConditional)
// 空合预算符形式
var nilCoalescing = optionalVal0 ?? "B"
print(nilCoalescing)

// 区间预算符
let intArray = [0, 1, 2]
let arrayCount = intArray.count
for index in 0...arrayCount {
  print("\(index) * 5 = \(index *  5) ")
}
