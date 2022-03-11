// protocolos:


protocol Enjaulable { // pasar a estructura de animales voladores y terrestres
    var estaDentro : Bool {get}
    func enjaular() -> Bool

}
protocol PutInTank { // pasar a estructura de animales marinos.
    func toPutInTank()
}

protocol WalkOut { // pasar a la estructura de animales terrestres.
    func takeForAWalk()
}
protocol Feed { // pasar a todas las estructuras de animales.
    var itsFeed: Bool { get }
    func toFeed()
}
protocol Clean { // pasar a todas las estructuras de jaulas.
    var itsClean : Bool {get}
    func toClean()
}


// estructuras animales:
struct FlyingAnimal: Feed, Enjaulable {
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
struct LandAnimal: Feed, Enjaulable{
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
struct SeaAnimal: Feed{
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
// instancias animales:
var parrot1 = FlyingAnimal(estaDentro: true, type: "parrot", itsFeed: true)
parrot1.toFeed()
var cat1 = LandAnimal(estaDentro: true, type: "cat", itsFeed: false)
cat1.toFeed()
var goldfish1 = SeaAnimal(type: "goldfish", itsFeed: false)
goldfish1.toFeed()


// estructuras jaulas:

struct Cage: Clean {
    var occupant : [Enjaulable] = []

    var itsClean: Bool

    func addToCage (){
//        occupant[FlyingAnimal] = []

    }


    func toClean() {
        if itsClean {
            print("no se necesita limpiar")
        }else {
            print("se necesita limpiar")
        }
    }
}

struct TankSeaAnimals {

    var occupant = [SeaAnimal]()

    var itsClean : Bool
    func toClean() {
        if itsClean {
            print("no se necesita limpiar")
        }else {
            print("se necesita limpiar")
        }
    }

}

var cage1 = Cage (itsClean: true)

cage1.occupant.append(parrot1)
cage1.occupant.append(cat1)
//Intancias de las jaulas
//
//var cageLandAnimals = CageLandAnimals(itsClean: false)
//cageLandAnimals.toClean()
//
//var tankSeaAnimals
//
//
//// estructura tienda:
//struct PetShop {
//    var accommodation1: CageFlyingAnimals
//    var accommodation2: CageLandAnimals
//    var accommodation3: TankSeaAnimls
//}



