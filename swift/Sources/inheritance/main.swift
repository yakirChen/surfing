/// 继承

class Vehicle {
  var currentSpeed: Double = 0.0
  var description: String {
    return "\(currentSpeed) miles per hour"
  }

  func velocity(velocity: Double) {
    // do nothing ...
  }

  // MARK: 防止重写
  // final var
  // final func
}

class Bicyle: Vehicle {
  var hasBasket: Bool = false
  var gear = 1

  // MARK: 重写属性
  override var description: String {
    return "Bicyle \(currentSpeed) miles per hour"
  }

  // MARK: 重写属性观察器
  override var currentSpeed: Double {
    didSet {
      gear = Int(currentSpeed / 10.0) + 1
    }
  }

  // MARK: 重写方法
  override func velocity(velocity: Double) {
    self.currentSpeed += velocity
  }
}

var bicyle = Bicyle()
bicyle.currentSpeed = 10
bicyle.velocity(velocity: 10)
print("\(bicyle.description)")
print("\(bicyle.gear)")
