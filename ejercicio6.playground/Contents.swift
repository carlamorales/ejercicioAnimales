// protocolos:
protocol Encage { // pasar a estructura de animales voladores y terrestres
    var estaDentro: Bool { get }
    func enjaular() -> Bool
}
protocol Entanke { // pasar a estructura de animales marinos.
    var estaDentro: Bool { get }
    func toPutInTank() -> Bool
}
protocol WalkOut { // pasar a la estructura de animales terrestres.
    func takeForAWalk()
}
protocol Feed { // pasar a todas las estructuras de animales.
    var itsFeed: Bool { get }
    func toFeed()
}
protocol Clean { // pasar a todas las estructuras de jaulas.
    var itsClean: Bool {get}
    func toClean()
}

// estructuras animales:
struct FlyingAnimal: Feed, Encage {
    var estaDentro: Bool
    var type: String
    var itsFeed: Bool

    func enjaular() -> Bool{
        return estaDentro
    }

    func liberar() -> Bool {
        return estaDentro
    }

    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}

struct LandAnimal: Feed, Encage {
    var estaDentro: Bool
    
    func enjaular() -> Bool {
        print("enjaulado")
        return true
    }
    
    var type: String
    var itsFeed: Bool
    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}

struct SeaAnimal: Feed, Entanke {
    var type: String
    var estaDentro: Bool
    func toPutInTank() -> Bool {
        print("en tanke")
        return true
    }
    
    var itsFeed: Bool
    func toFeed() {
        if itsFeed {
            print("Ok. No need to feed.")
        } else {
            print("You need to feed it.")
        }
    }
}
// instancias animales:
var parrot1 = FlyingAnimal(estaDentro: true, type: "parrot", itsFeed: true)
parrot1.toFeed()
var cat1 = LandAnimal(estaDentro: true, type: "cat", itsFeed: false)
var goldfish1 = SeaAnimal(type: "goldfish", estaDentro: true, itsFeed: false)
var pezpayaso = SeaAnimal(type: "pesPayaso", estaDentro: true, itsFeed: false)
var pulpo = SeaAnimal(type: "pulpo", estaDentro: true, itsFeed: false)

// estructura jaula:
struct Cage: Clean {
    var occupant : [Encage] = []
    var itsClean: Bool

    func toClean() {
        if itsClean {
            print("no se necesita limpiar")
        } else {
            print("se necesita limpiar")
        }
    }
}
// estructura tanque de peces:
struct TankSeaAnimals: Clean {
    var occupant: [Entanke] = []

    var itsClean : Bool
    func toClean() {
        if itsClean {
            print("no se necesita limpiar")
        } else {
            print("se necesita limpiar")
        }
    }
}

// instancias de la jaula:
var cage1 = Cage(itsClean: true)
cage1.occupant.append(parrot1)
cage1.occupant.append(cat1)
print("Hay \(cage1.occupant.count) animales en esta jaula.")
cage1.occupant.remove(at: 0)
print("Hay \(cage1.occupant.count) animales en esta jaula.")

// instancias del tanque:
var tank1 = TankSeaAnimals(itsClean: false)
tank1.occupant.append(goldfish1)
tank1.occupant.append(pezpayaso)
tank1.occupant.append(pulpo)
print("Hay \(tank1.occupant.count) peces en este tanque.")
tank1.occupant.remove(at: 2)
print("Hay \(tank1.occupant.count) peces en este tanque.")

//// estructura tienda:
struct PetShop {
    var accommodationCage: Cage
    var accommodationTank: TankSeaAnimals
}
