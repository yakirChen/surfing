/// 下标 Subscript

struct Subscript {
  private var number: Int

  init(number: Int) {
    self.number = number
  }

  subscript(num: Int) -> Int {
    return num * number
  }
}

var sj = Subscript(number: 2)
var multi = sj[3]
print("下标用法 \(multi)")
