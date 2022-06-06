// 变量集合元素可变，常量集合元素不可变

/// ####################### 数组(Array) ####################### 
// 空数组
var emptyArray: [String] = []

// 默认值填充数组
var fillArray: [String] = Array(repeating: "", count: 6)
// ["", "", "", "", "", ""]

// 数组合并
var mergeArray = emptyArray + fillArray

// 数组编辑数据项
var appendArray: [String] = []
appendArray.append("A")
appendArray += ["C", "D"]
appendArray.insert("B", at: 1)
appendArray.remove(at: appendArray.count - 1)

for item in appendArray {
    print("\(item) ", terminator: "")
}
print()
for (index, value) in appendArray.enumerated() {
    print("Item \(index): \(value) ", terminator: "")
}
print()

/// ####################### 集合(Set) ####################### 

// 空集合
var letters = Set<Character>()

// 从数组创建集合
var set: Set<String> = ["A", "B", "C"]

// 默认值填充集合
var fillSet: Set<String> = Set<String>(repeatElement("", count: 3))

// 集合编辑元素
set.insert("D")
set.remove("D")

for item in set {
    print("\(item) ", terminator: "")
}
print()
for (index, value) in set.enumerated() {
    print("Item \(index): \(value) ", terminator: "")
}
print()

// 交、并、补、差集
let a: Set<String> = ["A", "B", "C"]
let b: Set<String> = ["B", "C", "D"]
// 交集 ["C", "B"]
let intersection: Set<String> = a.intersection(b)
print(intersection)
// 并集 ["B", "A", "D", "C"]
let union: Set<String> = a.union(b)
print(union)
// 交集的补集 ["D", "A"]
let symmetricDifference: Set<String> = a.symmetricDifference(b)
print(symmetricDifference)
// 补集的差集 ["A"]
let subtract: Set<String> = a.subtracting(b)
print(subtract)

/// ####################### 字典(Dictionary) ####################### 

// 空字典
var emptyDictionary: [String: String] = [:]

// RBG字典
let rgb: [String: String] = ["RED": "red", "GREEN": "green", "BLUE": "blue"]
for (key, value) in rgb.enumerated() {
    print("Dictionary: \(key) \(value.value)")
}
for key in rgb.keys {
    print("Dictionary: \(key) \(rgb[key] ?? "")")
}

// 字典的key
let dictKey = [String](rgb.keys)

// 字典的value
let dictValue = [String](rgb.values)
