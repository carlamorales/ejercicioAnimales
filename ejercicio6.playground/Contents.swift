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
    func getInTanke()
    func setFree()
}
protocol Feedable {
    func feed()
}
protocol Walkable {
    func takeOutForWalk()
}
protocol Cleanable {
    func cleanThisPlace()
}

typealias CageableAndWalkableAnimal = Cageable & Walkable & Animal
typealias CageableAnimal = Cageable & Animal
typealias TankeableAnimal = Tankeable & Animal

// estructuras animales:
struct LandAnimal: CageableAndWalkableAnimal, Feedable {
    var type: AnimalType
    var name: String
    
    func getInCage() {
        print("The \(name) is in the cage.")
    }
    
    func setFree() {
        print("The \(name) is out of the cage.")
    }
    
    func takeOutForWalk() {
        print("This \(name) is being taken out for a walk.")
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
    
    func getInTanke() {
        print("The \(name) is in the tank.")
    }
    
    func setFree() {
        print("The \(name) is out of the tank.")
    }
    
    func feed() {
        print("This \(name) is being fed.")
    }
}

// instancias de las estructuras animales:
var dog = LandAnimal(type: .land, name: "dog")
dog.feed()
var cat = LandAnimal(type: .land, name: "cat")
cat.feed()

var parrot = AirAnimal(type: .air, name: "parrot")
parrot.feed()
var duck = AirAnimal(type: .air, name: "duck")
duck.feed()

var goldfish = SeaAnimal(type: .sea, name: "goldfish")
goldfish.feed()
var clownfish = SeaAnimal(type: .sea, name: "clownfish")
clownfish.feed()

// estructuras jaulas:
struct LandAnimalsCage: Cleanable {
    var occupants: [CageableAndWalkableAnimal] = []
    
    mutating func cageLandAnimal(animalName: CageableAndWalkableAnimal) {
        occupants.append(animalName)
        animalName.getInCage()
    }
    
    /*
    func setLandAnimalFree()
    */
    
    func cleanThisPlace() {
        print("This place is being cleaned.")
    }
}

struct AirAnimalsCage: Cleanable {
    var occupants: [CageableAnimal] = []
    
    mutating func cageAirAnimal(animalName: CageableAnimal) {
        occupants.append(animalName)
        animalName.getInCage()
    }
    
    /*
    func setAirAnimalFree()
    */
    
    func cleanThisPlace() {
        print("This place is being cleaned.")
    }
}

struct Tank: Cleanable {
    var occupants: [TankeableAnimal] = []
    
    mutating func putSeaAnimalInTank(animalName: TankeableAnimal) {
        occupants.append(animalName)
        animalName.getInTanke()
    }
    
    /*
    func setSeaAnimalFree()
    */
    
    func cleanThisPlace() {
        print("This place is being cleaned.")
    }
}

// instancias de las estructuras jaulas:
var landAnimalCage = LandAnimalsCage()
landAnimalCage.cleanThisPlace()
var airAnimalCage = AirAnimalsCage()
airAnimalCage.cleanThisPlace()
var tank = Tank()
tank.cleanThisPlace()

// llamada de método meter a jaula/tanque:
landAnimalCage.cageLandAnimal(animalName: dog)
landAnimalCage.cageLandAnimal(animalName: cat)

airAnimalCage.cageAirAnimal(animalName: parrot)
airAnimalCage.cageAirAnimal(animalName: duck)

tank.putSeaAnimalInTank(animalName: goldfish)
tank.putSeaAnimalInTank(animalName: clownfish)
