/// 可选链式调用

class Person {
  var residence: Residence?
}

class Residence {
  var numerOfRooms = 1
  var rooms: [Room] = []
  subscript(i: Int) -> Room {
    get {
      return rooms[i]
    }

    set {
      rooms[i] = newValue
    }
  }
}

class Room {
  let name: String
  init(name: String) {
    self.name = name
  }
}

let yakir = Person()

if let roomCount = yakir.residence?.numerOfRooms {
  print("\(roomCount)")
}
else {
  print("0")
}

yakir.residence = Residence()
if let roomCount = yakir.residence?.numerOfRooms {
  print("\(roomCount)")
}
else {
  print("0")
}

yakir.residence?.rooms.append(Room(name: "A"))
yakir.residence?.rooms.append(Room(name: "B"))
if let firstRoomName = yakir.residence?[0].name {
  print("First Room Name \(firstRoomName)")
}
else {
  print("First Room Name ....")
}
