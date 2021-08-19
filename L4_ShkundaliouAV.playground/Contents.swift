import UIKit

enum engine: String {
    case on = "запущен"
    case off = "заглушен"
}
enum window: String {
    case open = "открыты."
    case closed = "закрыты."
}
enum tuning: String {
    case yes = "присутствует"
    case no = "отсутствует"
}
enum spoiler: String {
    case yes = "присутствует"
    case no = "отсутсвует"
}
enum statusSpoiler: String {
    case open = "спойлер открыт"
    case closed = "спойлер закрыт"
    case missing = "спойлер отсутствует"
}
enum body: String {
    case full = "полон"
    case partly = "частично загружен"
    case empty = "пустой"
}
enum trailer: String {
    case yes = "присоединён"
    case no = "отсоединён"
}

class Car { //родительский класс Car
    var brand: String // марка авто
    var years: Int // год выпуска авто
    var engine: engine // состояние двигателя
    var window: window // статус окон
    var power: Double // мощность двигателя
    static var carCount = 0 // счётчик кол-ва добавленых авто
    
    init(brand: String, years: Int, engine: engine, window: window, power: Double) { // инициализатор для класса
        self.brand = brand
        self.years = years
        self.engine = engine
        self.window = window
        self.power = power
        Car.carCount += 1 // прибавляет к счётчику единицу при каждой инициализации объекта
    }
    deinit { // деинициализатор класса
        Car.carCount -= 1 // отнимает единицу при удалении объекта
        print("Удалён автомобиль \(brand)\n") // вывод в консоль об удалении
    }
    
    static func countInfo() {
        print("В базе: \(self.carCount) авто\n") // вывод в консоль кол-ва авто
    }
    func engineOn() {
        self.engine = .on
        print("\(brand): двигатель \(engine.rawValue)\n") // вывод в консоль запуска двигателя
    }
    func engineOff() {
        self.engine = .off
        print("\(brand): двигатель \(engine.rawValue)\n") // вывод в консоль выключения двигателя
    }
    func windowOpen() {
        self.window = .open
        print("\(brand): окна \(window.rawValue)\n") // вывод в консоль открытия окон
    }
    func windowClosed() {
        self.window = .closed
        print("\(brand): окна \(window.rawValue)\n") // вывод в консоль закрытия окон
    }
    func infoCar() {
        print("Автомобиль: \(brand)\nГод выпуска: \(years)\nДвигатель: \(engine.rawValue)\nОкна: \(window.rawValue)\nМощность: \(power) л.с.") // вывод в консоль информации об авто
    }
}

class SportCar: Car { // дочерний класс SportCar
    var tuning: tuning // наличие тюнинга
    var spoiler: spoiler // наличие спойлера
    var statusSpoiler: statusSpoiler { // статус спойлера
        get {
            switch spoiler {
            case .yes where engine == .on: // при наличии спойлера и заведенном авто, спойлер открыт
                return .open
            case .yes where engine == .off: // при наличии спойлера и заглушенном авто, спойлер закрыт
                return .closed
            default:
                return .missing // если спойлер отсутствует
            }
        }
    }
    var tax: Double { // подсчёт транспортного налога в заивисимости от мощности авто
        get {
            switch power {
            case let i where (i > 0) && (i <= 100):
                return power * 12
            case let i where (i > 100) && (i <= 125):
                return power * 25
            case let i where (i > 125) && (i <= 150):
                return power * 35
            case let i where (i > 150) && (i <= 175):
                return power * 45
            case let i where (i > 175) && (i <= 200):
                return power * 50
            case let i where (i > 200) && (i <= 225):
                return power * 65
            case let i where (i > 225) && (i <= 250):
                return power * 75
            case let i where (i > 250):
                return power * 150
            default:
                print("Введите корректно мощность легкового автомобиля - \(self.brand)\n") // если мощность 0 и отрицательна, то просит исправить информацию, устанавливая при этом мощность равной 0
                return 0
            }
        }
    }
    
    init(brand: String, years: Int, engine: engine, window: window, power: Double, tuning: tuning, spoiler: spoiler) {
        self.tuning = tuning
        self.spoiler = spoiler
        super.init(brand: brand, years: years, engine: engine, window: window, power: power)
    }
    
    func taxInfo() {
        if self.tax > 0 {
            print("Транспортный налог в Москве на легковой авто \(self.brand) (\(power) л.с.) - равен \(self.tax) рублей в год\n") // вывод транспортного налога для легкового авто
        }
    }
    override func engineOn() {
        super.engineOn()
        print("\(brand): \(statusSpoiler.rawValue)\n") // вывод статуса спойлера при заведенном авто
    }
    override func engineOff() {
        super.engineOff()
        print("\(brand): \(statusSpoiler.rawValue)\n") // вывод статуса спойлера при заглушенном авто
    }
    override func infoCar() {
        super.infoCar()
        print("Тюнинг: \(tuning.rawValue)\nСпойлер: \(spoiler.rawValue) (\(statusSpoiler.rawValue))\n") // вывод инфо об авто с добавлением индивидуальных свойств данного класса
    }
}

class TrunkCar: Car { // дочерний класс TrunkCar
    var body: body // кузов
    var trailer: trailer { // прицеп
        get {
            switch engine {
            case .on: // прицеп присоединенен при заведенном авто
                return .yes
            default:
                return .no // прицеп отсоединен при заглушенном авто
            }
        }
    }
    
    init(brand: String, years: Int, engine: engine, window: window, power: Double, body: body) {
        self.body = body
        super.init(brand: brand, years: years, engine: engine, window: window, power: power)
    }
    
    override func engineOn() {
        super.engineOn()
        print("\(brand): прицеп \(trailer.rawValue)\n") // вывод в консоль присоединение прицепа при заведенном авто
    }
    override func engineOff() {
        super.engineOff()
        print("\(brand): прицеп \(trailer.rawValue)\n") // вывод в консоль отсоединения прицепа при заглушенном авто
    }
    func bodyCleaning() {
        self.body = .empty
        print("\(brand): кузов \(body.rawValue)\n") // вывод в консоль очистки кузова
    }
    override func infoCar() {
        super.infoCar()
        print("Кузов: \(body.rawValue)\nПрицеп: \(trailer.rawValue)\n") // вывод инфо об авто с добавлением индивидуальных свойств данного класса
    }
}

var bmw: SportCar? = SportCar(brand: "BMW", years: 2021, engine: .off, window: .closed, power: 355, tuning: .yes, spoiler: .yes)
bmw?.infoCar() // инфо о добавленном авто
var man: TrunkCar? = TrunkCar(brand: "MAN", years: 1997, engine: .off, window: .closed, power: 1500, body: .full)
man?.infoCar() // инфо о добавленном авто
bmw?.windowOpen() // открытие окон
bmw?.engineOn() // авто заведен
man?.engineOn() // авто заведен
var volvo : TrunkCar? = TrunkCar(brand: "VOLVO", years: 2008, engine: .off, window: .closed, power: 789, body: .partly)
volvo?.infoCar() // инфо о добавленном авто
volvo?.bodyCleaning() // очитска кузова
bmw?.taxInfo() // инфо о налоге
Car.countInfo() // кол-во добавленных авто
man = nil // удаление объекта
Car.countInfo() // кол-во добавленных авто
