import UIKit

struct sportCar {
    var brand : String // марка авто
    var year : Int // год выпуска
    var trunkVolume : Int // объём багажника
    var engine : engine { // двигатель
        willSet {
            if newValue == .on {
                print("Двигатель \(brand) запущен.\n")
            } else {
                print("Двигатель \(brand) заглушен.\n")
            }
        }
    }
    var window : window { // окна
        willSet {
            if newValue == .open {
                print("Окна \(brand) открыты.\n")
            } else {
                print("Окна \(brand) закрыты.\n")
            }
        }
    }
    var fullTrunkVolume : Int // заполненный объём багажника
    
    mutating func engine(value : engine) { // метод изменяющий статус двигателя
        self.engine = value
    }
    
    func conclusion() { // метод вывода информации в консоль
        print("Марка: \(brand)\nГод выпуска: \(year) год\nОбъём багажника: \(trunkVolume) л\nДвигатель: \(engine.rawValue)\nОкна: \(window.rawValue)\nЗаполненный объём багажника: \(fullTrunkVolume)\n")
    }
}

struct trunkCar {
    var brand : String // марка авто
    var year : Int // год выпуска
    var bodyVolume : Int // объём кузова
    var engine : engine { // двигатель
        willSet {
            if newValue == .on {
                print("Двигатель \(brand) запущен.\n")
            } else {
                print("Двигатель \(brand) заглушен.\n")
            }
        }
    }
    var window : window { // окна
        willSet {
            if newValue == .open {
                print("Окна \(brand) открыты.\n")
            } else {
                print("Окна \(brand) закрыты.\n")
            }
        }
    }
    var filledBodyVolume : Int // заполненный объём кузова
    
    mutating func engine(value : engine) { // метод изменяющий статус двигателя
        self.engine = value
    }
    
    func conclusion() { // метод вывода информации в консоль
        print("Марка: \(brand)\nГод выпуска: \(year) год\nОбъём багажника: \(bodyVolume) л\nДвигатель: \(engine.rawValue)\nОкна: \(window.rawValue)\nЗаполненный объём багажника: \(filledBodyVolume)\n")
    }
}

enum engine : String {
    case on = "запущен"
    case off = "заглушен"
}
enum window : String {
    case open = "открыты"
    case closed = "закрыты"
}
enum cargo : String {
    case put = "погрузить"
    case take = "выгрузить"
}

var vw = sportCar(brand: "VW", year: 2018, trunkVolume: 500, engine: .off, window: .open, fullTrunkVolume: 100)
var bmw = sportCar(brand: "BMW", year: 2020, trunkVolume: 400, engine: .on, window: .closed, fullTrunkVolume: 200)

vw.conclusion() // вывод в консоль
bmw.conclusion() // вывод в консоль
vw.engine = .on // двигатель запущен
bmw.engine = .off // двигатель заглушен
vw.window = .closed // окна закрыты
vw.engine(value: .on) // двигатель запущен
bmw.engine(value: .off) // двигатель заглушен
bmw.engine = .on // двигатель запущен

var volvo = trunkCar(brand: "Volvo", year: 2003, bodyVolume: 3000, engine: .off, window: .closed, filledBodyVolume: 1600)
var man = trunkCar(brand: "MAN", year: 1999, bodyVolume: 3500, engine: .on, window: .closed, filledBodyVolume: 800)

volvo.conclusion() // вывод в консоль
man.conclusion() // вывод в консоль
volvo.engine = .on //двигатель запущен
man.window = .open // окна открыты
man.engine(value: .off) // двигатель заглушен

