import UIKit

enum engineStatus: CustomStringConvertible {
    case on, off
    
    var description: String {
        switch self {
        case .on: return "заведен"
        case .off: return "заглушен"
        }
    }
}
enum windowStatus: CustomStringConvertible {
    case open, close
    
    var description: String {
        switch self {
        case .open: return "открыты"
        case .close: return "закрыты"
        }
    }
}
enum tankStatus: CustomStringConvertible {
    case full, half, empty
    
    var description: String {
        switch self {
        case .full: return "полная"
        case .half: return "наполовину заполнена"
        case .empty: return "пустая"
        }
    }
}
enum spoilerStatus: CustomStringConvertible {
    case yes, no
    var description: String {
        switch self {
        case .yes: return "открыт"
        case .no: return "закрыт"
        }
    }
}
enum action {
    case engine(engineStatus)
    case window(windowStatus)
    case tank(tankStatus)
    case spoiler(spoilerStatus)
    case addMileage(Int)
}

protocol Car {
    var brand: String { get }
    var years: Int { get }
    var mileage: Int { get set }
    var engine: engineStatus { get set }
    var window: windowStatus { get set }
    
    func perform(action: action)
}

extension Car {
    mutating func performDefault(action: action) {
        switch action {
        case .engine(let status):
            self.engine = status
            print("\(self.brand): двигатель \(status)\n")
        case .window(let status):
            self.window = status
            print("\(self.brand): окна \(status)\n")
        case .addMileage(let status):
            self.mileage += status
            print("\(self.brand): проехал \(status) км\n")
        default:
            break
        }
    }
}

class SportCar: Car {
    
    var brand: String
    var years: Int
    var mileage: Int
    var racing: Double
    var engine: engineStatus = .off
    var window: windowStatus = .close
    var spoiler: spoilerStatus = .no
    
    init(brand: String, years: Int, mileage: Int, racing: Double) {
        self.brand = brand
        self.years = years
        self.mileage = mileage
        self.racing = racing
    }
    
    func perform(action: action) {
        switch action {
        case .spoiler(let status):
            spoiler = status
            print("\(self.brand): спойлер \(status)\n")
        default:
            break
        }
    }
}

class TrunkCar: Car {
    var brand: String
    var years: Int
    var mileage: Int
    var engine: engineStatus = .off
    var window: windowStatus = .close
    var tank: tankStatus = .empty
    
    init(brand: String, years: Int, mileage: Int) {
        self.brand = brand
        self.years = years
        self.mileage = mileage
    }
    
    func perform(action: action) {
        switch action {
        case .tank(let status):
            tank = status
            print("\(self.brand): цистерна \(status)\n")
        default:
            break
        }
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Марка: \(brand)\nГод выпуска: \(years) год\nПробег: \(mileage) км\nДвигатель: \(engine)\nОкна: \(window)\nРазгон до 100 км/ч: \(racing) сек\nСпойлер: \(spoiler)\n"
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Марка: \(brand)\nГод выпуска: \(years) год\nПробег: \(mileage) км\nДвигатель: \(engine)\nОкна: \(window)\nЦистерна: \(tank)\n"
    }
}

var bmw = SportCar(brand: "BMW", years: 2021, mileage: 13584, racing: 3.4)
var man = TrunkCar(brand: "MAN", years: 2003, mileage: 476239)
print(bmw)
print(man)
bmw.performDefault(action: .engine(.on))
bmw.perform(action: .spoiler(.yes))
bmw.performDefault(action: .addMileage(1000))
man.performDefault(action: .engine(.on))
man.performDefault(action: .window(.open))
man.perform(action: .tank(.half))
man.performDefault(action: .addMileage(74865))
print(bmw)
print(man)
