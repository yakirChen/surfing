/// 继承 & 构造器 & 析构

class Vehicle {
  var currentSpeed: Double = 0.0
  var description: String {
    return "\(currentSpeed) miles per hour"
  }

  func velocity(velocity: Double) {
    // do nothing ...
  }

  init(speed currentSpeed: Double) {
    self.currentSpeed = currentSpeed
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

enum Color {
  case white
  case blank
}

class Hoverboard: Vehicle {

  // MARK: 可选类型自动初始化为 nil
  private var color: Color?

  // MARK: 重写构造
  override init(speed currentSpeed: Double) {
    super.init(speed: currentSpeed)
    self.color = .blank
  }

  init(_ color: Color) {
    super.init(speed: 11)
    self.color = color
  }

  // MARK: 可失败构造器
  init?(speed currentSpeed: Int, colour color: Color) {
    super.init(speed: 0)

    if currentSpeed == 0 {
      return nil
    }

    if let ccc = Optional(color) {
      self.color = ccc
    }
    else {
      return nil
    }
  }

  // MARK: 便利构造器
  convenience init() {
    self.init(.blank)
  }
}

var bicyle = Bicyle(speed: 10)
bicyle.velocity(velocity: 10)
print("\(bicyle.description)")
print("\(bicyle.gear)")

var hoverboard = Hoverboard.init(speed: 0, colour: .white)
if hoverboard == nil {
  print("可失败构造器返回nil")
}

class Required {
  var name: String
  // MARK: 必要构造器,声明子类必须实现构造器
  required init(name param: String) {
    self.name = param
  }
}

class Required0: Required {
  required init(name param: String) {
    super.init(name: param + "继承")
  }
}

var required = Required(name: "required")
var required0 = Required0(name: "required0")

// MARK: 通过闭包或者函数设置属性默认值
class SomeClass {
  let property: Int = {
    return 0
  }()
}

// MARK: 析构
class Bank {
  static var coinsInBank = 10_000
  static func distribute(coins numberOfCoinsRequested: Int) -> Int {
    let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
    coinsInBank -= numberOfCoinsToVend
    return numberOfCoinsToVend
  }
  static func receive(coins: Int) {
    coinsInBank += coins
  }
}
class Player {
  var coinsInPurse: Int
  init(coins: Int) {
    coinsInPurse = Bank.distribute(coins: coins)
  }
  func win(coins: Int) {
    coinsInPurse += Bank.distribute(coins: coins)
  }
  deinit {
    Bank.receive(coins: coinsInPurse)
  }
}
var playerOne: Player? = Player(coins: 100)
print("使用 \(playerOne!.coinsInPurse)")
print("剩余 \(Bank.coinsInBank)")
playerOne = nil
print("析构后 \(Bank.coinsInBank)")
