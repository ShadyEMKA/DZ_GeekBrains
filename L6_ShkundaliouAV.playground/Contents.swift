import UIKit

struct Queue<T> { // структура с неопределенным типом данным
    var array = [T]() // массив с неопределенным типом данных
    
    mutating func push(_ value: T) { // метод добавления элемента в конец
        self.array.append(value)
    }
    
    mutating func pop() -> T? { // метод удаления элемента из начала
        self.array.removeFirst()
    }
}

extension Queue { // расширение для структуры
    mutating func filter(_ clouser: (T) -> Bool) -> [T] {
        self.array.filter(clouser)
    }
    
    mutating func sorted(_ clouser: (T, T) -> Bool) -> [T] {
        self.array.sorted(by: clouser)
    }
    
    mutating func map(_ clouser: (T) -> T) -> [T] {
        self.array.map(clouser)
    }
    
    mutating func forEach(_ clouser: (T) -> Void) {
        self.array.forEach(clouser)
    }
}

extension Queue {
    subscript(id: Int) -> T? {
        get {
            if (id >= 0) && (id < self.array.count) {
                return self.array[id]
            } else {
                return nil
            }
        }
        set {
            if (id >= 0) && (id < self.array.count) {
                self.array[id] = newValue!
            } else {
                print("Нет элемента с \(id) индексом")
            }
        }
    }
}

var array = Queue<Int>()
array.push(20)
array.push(25)
array.push(242)
array.push(2530)
array.push(1)
array.push(136)
array.push(15472)
print(array)
array.pop()
print(array)
print(array.filter(){$0 % 2 == 0}) // фильтр на чётные числа
print(array[1]!)
array[1] = 432
print(array)
array[5] = 324
print(array)
array[4]
array[9]
array[11] = 34
print(array.filter(){$0 < 500}) // фильтра на числа меньше 500
print(array.map(){$0 * 100}) // преобразования элементов массива
print(array)
print(array.sorted(){$0 > $1}) // сортировка массива
array.forEach(){print($0)} // итерирование массива

var arrayString = Queue<String>()
arrayString.push("А")
arrayString.push("Б")
arrayString.push("Д")
arrayString.push("Е")
arrayString.push("Г")
arrayString.push("В")
print(arrayString)
print(arrayString.sorted(){$0 > $1})
arrayString[4] = "1"
print(arrayString.sorted(){$0 > $1})
print(arrayString.sorted(){$0 < $1})
array.forEach(){print($0)}
arrayString.forEach(){print($0)}

