/*
Fábrica de vehículos:
1) 3 tipos de vehículos: autos, lanchas, helicópteros.
2) 1 máquina, cuya única funcionalidad es iniciar el vehículo.
 - Si se inicia: un auto, imprime "andar"; una lancha, imprime "nadar"; un helicóptero, imprime "volar".
*/

/*
// solución 1:
protocol Vehicle {
    var type: VehicleType { get }
}

enum VehicleType {
    case car
    case boat
    case helicopter
}

struct AnyVehicle: Vehicle {
    let type: VehicleType
    let identifier: String
}

let car1 = AnyVehicle(type: .car, identifier: "car1")

struct Machine {
    let vehicle: AnyVehicle
    
    func turnOn() {
        switch vehicle.type {
        case .car:
            print("run")
        case .boat:
            print("swim")
        case .helicopter:
            print("fly")
        }
    }
}

let carMachine = Machine(vehicle: car1)
carMachine.turnOn()
*/

// solución 2:
protocol Vehicle {
    var type: VehicleType { get }
    func turnOn()
}

enum VehicleType {
    case car, boat, helicopter
}

struct Car: Vehicle {
    var type: VehicleType = .car
    
    func turnOn() {
        print("run")
    }
}

struct Boat: Vehicle {
    var type: VehicleType = .boat
    
    func turnOn() {
        print("swim")
    }
}

struct Helicopter: Vehicle {
    var type: VehicleType = .helicopter
    
    func turnOn() {
        print("fly")
    }
    
}

class Machine {
    let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
}

let carMachine = Machine(vehicle: Car(type: .car))
carMachine.vehicle.turnOn()

let boatMachine = Machine(vehicle: Boat(type: .boat))
boatMachine.vehicle.turnOn()

let helicopterMachine = Machine(vehicle: Helicopter(type: .helicopter))
helicopterMachine.vehicle.turnOn()
