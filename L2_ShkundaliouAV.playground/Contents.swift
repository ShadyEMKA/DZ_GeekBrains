import UIKit

// Задача №1

func evenOrodd (number value: Int) {
    switch (value % 2) {
    case 0 :
        print("Число \(value) - чётное.\n")
    default:
        print("Число \(value) - нечётное.\n")
    }
}

evenOrodd(number: 34)

// Задача №2

func divisibleByThree (number value: Int) {
    if ((value % 3) == 0) {
        print("Число \(value) делится на 3 без остатка.\n")
    }   else {
        print("Число \(value) не делится на 3 без остатка.\n")
        }
}

divisibleByThree(number: 7)

// Задача №3

var increasingArray : [Int] = []

for i in 1...100 {
    increasingArray.append(i)
}
print("Исходный массив:\n\(increasingArray)\n")

// Задача №4

var k = 0
for element in increasingArray {
    switch element {
    case _ where (element % 2) == 0:
        increasingArray.remove(at: k)
        break
    case _ where (element % 3) == 0:
        increasingArray.remove(at: k)
    default:
        k += 1
    }
}
print("Отредактированный массив:\n\(increasingArray)\n")

// Задача №5

// Первый вариант исполнения (в функции создаётся массив из чисел Фибоначчи и вытягивается крайний элемент)
func fibonacciNumber1 (number1 : Int) -> Int {
    var array : [Int] = []
    for i in 0...number1 {
        switch i {
        case 0:
            array.append(0) // первое число Фибоначчи
        case 1:
            array.append(1) // второе число Фибоначчи
        default:
            array.append((array[i - 1] + array[i - 2])) // дальнейший расчёт чисел Фибоначчи на основании прошлых чисел
        }
    }
    return array[number1]
}

// Второй вариант исполнения (через формулу находится число Фибоначчи)
func fibonacciNumber2 (number2 : Int) -> Int {
    let result = Int((pow(((1 + sqrt(5)) / 2), Double(number2)) - pow(((1 - sqrt(5)) / 2), Double(number2))) / sqrt(5))
    return result
}

var arrayFibonacci : [Int] = []

for i in 0...50 {
    arrayFibonacci.append(fibonacciNumber2(number2: i))
}
print("Числа Фибоначчи:\n\(arrayFibonacci)\n")

//Задача №6

var primeNumbers : [Int] = []
var n = 100 // верхняя граница диапазона простых чисел
var p = 0 //

for i in 2...n { // создаём массив от 2 до n
    primeNumbers.append(i)
}

func perebor (p : Int) -> [Int] { // функция замены кратных "p" чисел на "0"
    var m = 0 // счётчик в цикле для изменения элемента в массиве
    for i in primeNumbers { // перебор элементов массива
        if (i % p == 0) && (i != p) { // условие, кратно и не равно "p"
            primeNumbers[m] = 0 // замена элемента на "0"
        }
        m += 1 // прибавление счётчика
    }
    return primeNumbers // возвращение измененного массива.
}

for i in primeNumbers {
    if (i >= p) { // начиная с "2" в цикле функция будет заменять на "0" все кратные числа, исключая "2" и т.д.
        p = i
        perebor(p: p) // последовательно заменяя на "0" все кратные числа, в "p" будут попадать только простые числа, и в дальнейшем цикл повторно заменяет на "0" все кратные числа после него, и так до момента пока не закончится массив
    }
}
var newPrimeNumbers : [Int] = []
for i in primeNumbers {
    if (i != 0) {
        newPrimeNumbers.append(i) // создал новый массив, куда записал все не равные "0" числа, т.е. простые числа
    }
}
print("Простые числа:\n\(newPrimeNumbers)")
