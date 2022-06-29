/// 扩展

extension String {
  func substring(separator: String) -> [String] {
    let splited = self.split(separator: " ")
    return splited.compactMap { "\($0)" }
  }
}
