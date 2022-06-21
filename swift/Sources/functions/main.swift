/// Function

extension String {
    func substring(separator: String) -> [String] {
        let splited = self.split(separator: " ")
        return splited.compactMap { "\($0)" }
    }
}

// MARK: 多返回值
func multiResult(origin: String)-> (first: String, second: String) {
    let array = origin.substring(separator: " ")
    return (array[0], array[1])
}

var result: (String, String) =  multiResult(origin: "Hello World")
print("first: \(result.0)")
print("second: \(result.1)")

// MARK: 可选多返回值
func multiResultOption(origin: String)-> (first: String, second: String)? {
    if origin.isEmpty { return nil }
    let array = origin.substring(separator: " ")
    return (array[0], array[1])
}

let result0: (String, String) =  multiResultOption(origin: "Hi 你好") ?? ("", "")
print("first: \(result0.0)")
print("second: \(result0.1)")

// 函数入参为常量
func swapValues(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}
var a = 1
var b = 2
swapValues(&a, &b)
print("Swap \(a) \(b)")

// MARK: 函数类型
let functionTypes: (String)-> (first: String, second: String)? = multiResultOption
let result1: (String, String) =  functionTypes("Hi 你好") ?? ("", "")
print("first: \(result1.0)")
print("second: \(result1.1)")

// MARK: 函数类型作为参数类型
func functionParam(_ funcParam: (String) -> Int, _ str: String) -> Int {
    return funcParam(str)
}
func countStr(str: String) -> Int {
    return str.count
}
let count = functionParam(countStr, "abc")
print("\(count)")

// MARK: 函数类型作为返回类型
func functionReturn(str: String) -> (String) -> Int {
    return countStr(str:)
}

// MARK: 嵌套函数
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
