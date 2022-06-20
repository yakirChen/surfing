/// Control Flow

// MARK: 循环元组
let tuple = ["A": 1, "B": 2]
for (key, val) in tuple {
    print("\(key):\(val)")
}

for index in 1...5 {
    print("\(index) ", terminator: "")
}
print()

// MARK: 循环区间
var sum = 0
var summery = ""
var start = 1
var end = 10
for num in start..<end {
    summery = summery + "\(num)"
    sum += num
    if num != end-1 {
        summery += " + "
    } else {
        summery += " = "
    }
}
print("\(summery)\(sum)")

// MARK: while循环
var loopCount = 10
while loopCount > 0 {
    loopCount-=1
    print("\(loopCount) ", terminator: "")
}
print()

// MARK: repeat while循环
loopCount = 10
repeat {
    loopCount-=1
    print("\(loopCount) ", terminator: "")
}while loopCount > 0
print()

// MARK: If判断
let ifCondition = 10
if ifCondition > 10 {
    print("gt 10")
} else if ifCondition == 10 {
    print("eq 10")
} else {
    print("lt 10")
}

// MARK: Switch匹配
// 不存在隐式贯穿
let charactor = "🐶"
switch charactor {
case "🐱":
    print("猫")
case "🐶", "🐕":
    print("狗")
default:
    print("🐷")
}

// MARK: Switch区间匹配
let age = 18
switch age {
case 1...10:
    print("小屁孩")
case 11...18:
    print("小孩")
default:
    print("🫣")
}

// MARK: Case Where判断额外条件
func caseWhere(numTuple: (Int, Int)) {
    switch numTuple {
        case let (x, y) where x == y :
            print("eq \(x) \(y)")
        case let (x, y) where x > y :
            print("gt \(x) \(y)")
        case let (x, y) where x < y :
            print("lt \(x) \(y)")
        case let (x, y):
            print("\(x) \(y)")
    }
}
caseWhere(numTuple: (1, 2))
caseWhere(numTuple: (1, -1))
caseWhere(numTuple: (1, 1))

var integer = 0
func fallThrough() {
    switch integer {
        case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
        print("case")
        fallthrough
        default:
        print("default")
        break
    }
}
fallThrough()
