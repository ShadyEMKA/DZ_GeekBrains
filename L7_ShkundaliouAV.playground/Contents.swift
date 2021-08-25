import UIKit

// 1-ое задание
enum TranslatorError {
    case notFoundWord
}

class Translator {
    var storyWord = [String]()
    var library = ["hello": "привет", "World": "мир", "sun": "солнце", "earth": "земля", "fire": "огонь"]
    
    func translate(word: String) -> (String?, TranslatorError?) {
        guard let value = library[word] else {
            return (nil, TranslatorError.notFoundWord)
        }
        self.storyWord.append(value)
        return (value, nil)
    }
    
    func printStoryWord() {
        print("История слов: \(self.storyWord)")
    }
}

let eng = Translator()

let word1 = eng.translate(word: "hello")
if let value = word1.0 {
    print("Перевод: \(value)")
} else if let error = word1.1 {
    print("Произошла ошибка: \(error)")
}

let word2 = eng.translate(word: "sunnnnn")
if let value = word2.0 {
    print("Перевод \(value)")
} else if let error = word2.1 {
    print("Произошла ошибка - \(error)")
}
eng.printStoryWord()

// 2-ое задание
struct Drink {
    let product: Product
    var price: Int
    var count: Int
}

struct Product {
    let name: String
}

enum CoffeMachineError: Error {
    case noDrinkFound
    case outOfDrink
    case notEnougtMoney(stillNeeded: Int)
}

class CoffeeMachine {
    var item = ["Espresso": Drink(product: Product(name: "Espresso"), price: 2, count: 10),
                "Americano": Drink(product: Product(name: "Americano"), price: 3, count: 10),
                "Capuccino": Drink(product: Product(name: "Capuccino"), price: 5, count: 1),
                "Latte": Drink(product: Product(name: "Latte"), price: 6, count: 6),
                "Chocolate": Drink(product: Product(name: "Chocolate"), price: 4, count: 20)]
    var depositUser = 0
    
    func depositMoneyAdd(_ add: Int) {
        self.depositUser += add
    }
    
    func deposit() {
        print("Остаток на балансе \(depositUser) руб.")
    }
    
    func dispensingDrink(_ items: String) throws -> Product {
        guard var drink = item[items] else {
            throw CoffeMachineError.noDrinkFound
        }
        guard drink.count > 0 else {
            throw CoffeMachineError.outOfDrink
        }
        guard drink.price <= depositUser else {
            throw CoffeMachineError.notEnougtMoney(stillNeeded: drink.price - depositUser)
        }
        self.depositUser -= drink.price
        drink.count -= 1
        item[items] = drink
        print("Продан напиток \(items)")
        return drink.product
    }
}

let faema = CoffeeMachine()
faema.depositMoneyAdd(10)
do {
    try faema.dispensingDrink("Capuccino")
} catch CoffeMachineError.noDrinkFound {
    print("Напиток не найден")
} catch CoffeMachineError.outOfDrink {
    print("Напиток закончился")
} catch CoffeMachineError.notEnougtMoney(let stillNeeded) {
    print("Недостаточно средств: еще необходимо \(stillNeeded) руб.")
}
faema.deposit()
do {
    try faema.dispensingDrink("Capuccino")
} catch CoffeMachineError.noDrinkFound {
    print("Напиток не найден")
} catch CoffeMachineError.outOfDrink {
    print("Напиток закончился")
} catch CoffeMachineError.notEnougtMoney(let stillNeeded) {
    print("Недостаточно средств: еще необходимо \(stillNeeded) руб.")
}
faema.deposit()
