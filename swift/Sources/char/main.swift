let desc = """
    中国

    浙江
"""

print(desc)

let empty = String()
if empty.isEmpty {
    print("String is empty ")
}

// 字符串截取
let helloWorld = "Hello World"
let index = helloWorld.firstIndex(of: " ") ?? helloWorld.endIndex
let hello = String(helloWorld[..<index])
print(hello)

// 字符串比较
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\\u{E9}?"
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\\u{65}\\u{301}?"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

// 字符串数量
let emoji = "🐷"
print("\(emoji) has \(emoji.count) charactors")

// Unicode 代码单元
let emojiCodeUnit = emoji.utf8;
let emojiUncodeScalars = emoji.unicodeScalars;
print("\(emoji) Unicode代码单元\(emojiCodeUnit) Unicode标量\(emojiUncodeScalars)")
