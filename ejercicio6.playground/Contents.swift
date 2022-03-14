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
}
protocol Releasable {
    func setFree()
}
protocol Tankeable {
    func getInTank()
}
protocol Walkable {}
protocol Feedable {}
protocol Cleanable {}

typealias CageableAndReleasableAnimal = Cageable & Releasable & Animal
typealias TankeableAndReleasableAnimal = Tankeable & Releasable & Animal

// estructuras animales:
struct LandAnimal: CageableAndReleasableAnimal {
    var type: AnimalType
    var name: String

    func getInCage() {
        print("The \(name) is in the cage.")
    }

    func setFree() {
        print("The \(name) is out of the cage.")
    }
}

struct AirAnimal: CageableAndReleasableAnimal {
    var type: AnimalType
    var name: String

    func getInCage() {
        print("The \(name) is in the cage.")
    }

    func setFree() {
        print("The \(name) is out of the cage.")
    }
}

struct SeaAnimal: TankeableAndReleasableAnimal {
    var type: AnimalType
    var name: String

    func getInTank() {
        print("The \(name) is in the tank.")
    }

    func setFree() {
        print("The \(name) is out of the tank.")
    }
}

// estructuras jaulas:
struct Cage {
    var occupants: [CageableAndReleasableAnimal] = []

    func cageTheLandAnimal() {
        for animal in occupants where animal.type == .land {
            animal.getInCage()
        }
    }

    func setTheLandAnimalFree() {
        for animal in occupants where animal.type == .land {
            animal.setFree()
        }
    }

    func cageTheAirAnimal() {
        for animal in occupants where animal.type == .air {
            animal.getInCage()
        }
    }

    func setTheAirAnimalFree() {
        for animal in occupants where animal.type == .air {
            animal.setFree()
        }
    }
}

struct Tank {
    var occupants: [TankeableAndReleasableAnimal] = []

    func putInTankeTheSeaAnimal() {
        for animal in occupants where animal.type == .sea {
            animal.getInTank()
        }
    }

    func setTheSeaAnimalFree() {
        for animal in occupants where animal.type == .sea {
            animal.setFree()
        }
    }
}

// instancias:
var cage = Cage()
var tank = Tank()

var dog = LandAnimal(type: .land, name: "dog")
cage.occupants.append(dog)
cage.cageTheLandAnimal()
print(cage)
cage.setTheLandAnimalFree()
cage.occupants.removeLast()
print(cage)

var parrot = AirAnimal(type: .air, name: "parrot")
cage.occupants.append(parrot)
cage.cageTheAirAnimal()
print(cage)
cage.setTheAirAnimalFree()
cage.occupants.removeLast()
print(cage)

var goldfish = SeaAnimal(type: .sea, name: "goldfish")
tank.occupants.append(goldfish)
tank.putInTankeTheSeaAnimal()
print(tank)
tank.setTheSeaAnimalFree()
tank.occupants.removeLast()
print(tank)
