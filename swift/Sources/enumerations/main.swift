/// 枚举

// MARK: 枚举定义
enum Gender {
  case male
  case female
}

enum CompassPoint: CaseIterable {
  case north, south, east, west
}

// MARK: 枚举项定义类型
let male = Gender.male

// MARK: 枚举匹配

func compassPoint(compass: CompassPoint) {
  switch compass {
  case .east:
    print("东")
  case .south:
    print("南")
  default:
    print("...")
  }
}
compassPoint(compass: CompassPoint.east)

// MARK: 枚举成员遍历 (CaseIterable)
for compass in CompassPoint.allCases {
  print(compass)
}

// MARK: 关联值
enum CompassPoint0 {
  case east(name: String, emoji: String)
  case south(String)
  case west
  case north
}
let east = CompassPoint0.east(name: "东方", emoji: "☀️")
print(east)
let south = CompassPoint0.south("南方")
print(south)

// MARK: 原始值
enum ASSIIControlCharactor: Character {
  case tab = "\t"
  case lineFeed = "\n"
  case carriageReturn = "\r"
}
print("原始值:\(ASSIIControlCharactor.tab.rawValue)哈哈哈")

// MARK: 使用原始值初始化枚举实例
// MARK: 原始值的隐式赋值
enum CompassPoint1: Int {
  case east = 1
  case south
  case west
  case north
}
let southFromRowValue = CompassPoint1(rawValue: 2) ?? CompassPoint1.east
print("\(southFromRowValue)")

// MARK: 递归枚举
indirect enum ArithmeticExpr {
  case number(Int)
  case addition(ArithmeticExpr, ArithmeticExpr)
  case multiplication(ArithmeticExpr, ArithmeticExpr)
}

func evaluate(_ expression: ArithmeticExpr) -> Int {
  switch expression {
  case .number(let value):
    return value
  case .addition(let left, let right):
    return evaluate(left) + evaluate(right)
  case .multiplication(let left, let right):
    return evaluate(left) * evaluate(right)
  }
}

let multi = evaluate(.addition(.number(10), .multiplication(.number(10), .number(10))))
print("\(multi)")
