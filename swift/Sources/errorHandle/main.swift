/// 错误处理

enum Errors: Error {
  case err0
  case err1
  case err2
}

func canThrow(number: Int) throws -> Int {

  guard number > 0 else {
    throw Errors.err0
  }

  guard number > 1 else {
    throw Errors.err1
  }

  guard number > 2 else {
    throw Errors.err2
  }

  return number
}

var someValue: Int?
do {
  someValue = try canThrow(number: 0)
}
catch Errors.err0, Errors.err2 {
  print("Error \(Errors.err0) Or \(Errors.err2)")
}
print("someValue \(someValue ?? -1)")

// MARK: 将错误转换成可选值
let number = (try? canThrow(number: -1)) ?? -1
print("try optional \(number)")

do {
  someValue = try canThrow(number: 0)
}
catch is Errors {
  print("Error is Errors")
}
print("someValue \(someValue ?? -1)")

// MARK: 禁用错误传递
// let photo = try! loadImage(atPath: "./Resources/a.jpg")

// MARK: 指定清理操作
// func processFile(filename: String) throws {
//     if exists(filename) {
//         let file = open(filename)
//         defer {
//             close(file)
//         }
//         while let line = try file.readline() {
//             // 处理文件。
//         }
//         // close(file) 会在这里被调用，即作用域的最后。
//     }
// }
