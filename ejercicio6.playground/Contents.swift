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
protocol Tankeable {
    func getInTank()
}
protocol Walkable {}
protocol Feedable {}
protocol Cleanable {}

typealias CageableAnimal = Cageable & Animal
typealias TankeableAnimal = Tankeable & Animal

// estructuras animales:
struct LandAnimal: CageableAnimal {
    var type: AnimalType
    var name: String

    func getInCage() {
        print("The \(name) it's in the cage!")
    }
}

struct AirAnimal: CageableAnimal {
    var type: AnimalType
    var name: String

    func getInCage() {
        print("The \(name) It's in the cage!")
    }
}

struct SeaAnimal: TankeableAnimal {
    var type: AnimalType
    var name: String

    func getInTank() {
        print("The \(name) it's in the tank!")
    }
}

// estructuras jaulas:
struct Cage {
    var occupants: [CageableAnimal] = []

    func cageTheLandAnimal() {
        for animal in occupants where animal.type == .land {
            animal.getInCage()
        }
    }

    func cageTheAirAnimal() {
        for animal in occupants where animal.type == .air {
            animal.getInCage()
        }
    }
}

struct Tank {
    var occupants: [TankeableAnimal] = []

    func putInTankeTheSeaAnimal() {
        for animal in occupants where animal.type == .sea {
            animal.getInTank()
        }
    }
}

// instancias:
var cage = Cage()
var tank = Tank()

var dog = LandAnimal(type: .land, name: "dog")
cage.occupants.append(dog)
cage.cageTheLandAnimal()

var parrot = AirAnimal(type: .air, name: "parrot")
cage.occupants.append(parrot)
cage.cageTheAirAnimal()

var goldfish = SeaAnimal(type: .sea, name: "goldfish")
tank.occupants.append(goldfish)
tank.putInTankeTheSeaAnimal()

print(cage)
print(tank)
