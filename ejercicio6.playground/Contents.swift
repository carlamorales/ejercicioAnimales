enum AnimalType {
    case air
    case land
    case sea
}

protocol Animal {
    var type: AnimalType { get }
}
protocol Cageable {
    func getInCage()
    func setFree()
}
protocol Tankeable {
    func getInTank()
    func setFree()
}
protocol Feedable {
    func feed()
}
protocol Walkable {}
protocol Cleanable {}

typealias CageableAnimal = Cageable & Animal
typealias TankeableAnimal = Tankeable & Animal

// estructuras animales:
struct LandAnimal: CageableAnimal, Feedable {
    var type: AnimalType
    var name: String

    func getInCage() {
        print("The \(name) is in the cage.")
    }

    func setFree() {
        print("The \(name) is out of the cage.")
    }
    
    func feed() {
        print("This \(name) is being fed.")
    }
}

struct AirAnimal: CageableAnimal, Feedable {
    var type: AnimalType
    var name: String

    func getInCage() {
        print("The \(name) is in the cage.")
    }

    func setFree() {
        print("The \(name) is out of the cage.")
    }
    
    func feed() {
        print("This \(name) is being fed.")
    }
}

struct SeaAnimal: TankeableAnimal, Feedable {
    var type: AnimalType
    var name: String

    func getInTank() {
        print("The \(name) is in the tank.")
    }

    func setFree() {
        print("The \(name) is out of the tank.")
    }
    
    func feed() {
        print("This \(name) is being fed.")
    }
}

// estructuras jaulas:
struct Cage {
    var occupants: [CageableAnimal] = []

    func cageLandAnimal() {
        for animal in occupants where animal.type == .land {
            animal.getInCage()
        }
    }

    func setLandAnimalFree() {
        for animal in occupants where animal.type == .land {
            animal.setFree()
        }
    }

    func cageAirAnimal() {
        for animal in occupants where animal.type == .air {
            animal.getInCage()
        }
    }

    func setAirAnimalFree() {
        for animal in occupants where animal.type == .air {
            animal.setFree()
        }
    }
}

struct Tank {
    var occupants: [TankeableAnimal] = []

    func putSeaAnimalInTanke() {
        for animal in occupants where animal.type == .sea {
            animal.getInTank()
        }
    }

    func setSeaAnimalFree() {
        for animal in occupants where animal.type == .sea {
            animal.setFree()
        }
    }
}

// instancias:
var cage = Cage()
var tank = Tank()

var dog = LandAnimal(type: .land, name: "dog")
dog.feed()
cage.occupants.append(dog)
cage.cageLandAnimal()
print(cage)
cage.setLandAnimalFree()
cage.occupants.removeLast()
print(cage)

var parrot = AirAnimal(type: .air, name: "parrot")
parrot.feed()
cage.occupants.append(parrot)
cage.cageAirAnimal()
print(cage)
cage.setAirAnimalFree()
cage.occupants.removeLast()
print(cage)

var goldfish = SeaAnimal(type: .sea, name: "goldfish")
goldfish.feed()
tank.occupants.append(goldfish)
tank.putSeaAnimalInTanke()
print(tank)
tank.setSeaAnimalFree()
tank.occupants.removeLast()
print(tank)
