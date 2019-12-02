import UIKit

/// ===== array =====
var optionalArray:[Int]?
var emptyArray = [Int]()
var numberArray = [0,1,2,3,4,5,6,7,8,9]
var fiveZs = Array(repeating: "Z", count: 5)

/// iterate
for number in numberArray {number} //0123456789
for i in 0..<numberArray.count {numberArray[i]} //0123456789
for i in 0...numberArray.count-1 {numberArray[i]} //0123456789
for (index, value) in numberArray.enumerated() {print("\(index)-\(value)")}
/// sum
let total = numberArray.reduce(0, +) //45

/// subarray
let ignoreFirstFive = numberArray[5...] //56789 type(of:) ArraySlice<Int>.Type
let arrayIgnoreFirstFive = Array(ignoreFirstFive) //56789 type(of:) Array<Int>.Type

/// append insert remove
var appendArray = [Int]() //[]
appendArray.append(contentsOf: ignoreFirstFive) //[5,6,7,8,9]
appendArray.append(10) //[5,6,7,8,9,10]
appendArray.insert(4, at:0) //[4,5,6,7,8,9,10]
appendArray.remove(at:appendArray.count-1) //10
appendArray.removeLast()//9

var appendArray2 = [1,2,3] + [4,5,6]
appendArray2 += [7]
appendArray2 += [8,9,10]

/// contains
numberArray.contains(9) //true
let isAnyGraterThan9 = numberArray.contains{$0 > 9} //false

/// index of
var eightArray = [7,8,9]
var firstEight = eightArray.first(where: {$0 == 8}) //8 Optional<Int>.Type
let indexOfFirstEight = eightArray.firstIndex(where: {$0 == 8}) // 1 Optional<Int>.Type

/// sort reverse compare
var reverseArray = numberArray.sorted().reversed() //ReversedCollection<Array<Int>>
var realReverseArray = Array(reverseArray) //[9,8,7,6,5,4,3,2,1,0]
var numberArrayOfArray = [[0,1],[2,3],[4,5],[6,7],[8,9]]
numberArrayOfArray.sort{ (a, b) -> Bool in return a[0]>b[0]} //[[8,9],[6,7],[4,5],[2,3],[0,1]

/// reserveCapacity, faster to append / remove
var reservedArray = [Int]()
reservedArray.reserveCapacity(10)
for i in 0..<10 {
    reservedArray.append(i)
}

/// ===== dictionary =====
var dict = ["k1":1,"k2":2] //["k1": 1, "k2": 2]
var emptyDict = [String:Int]() //[:]
var optionalDict:[String:Int]? //nil

/// append remove
dict["k3"] = 3 //3 ["k1": 1, "k2": 2, "k3": 3]
dict["k3"] = nil //nil ["k1": 1, "k2": 2]
dict["k4"] = 4 //3 ["k1": 1, "k2": 2, "k4": 4]
dict.removeValue(forKey:"k4") // 4 ["k1": 1, "k2": 2]

/// iterate
for (key,value) in dict {print("\(key):\(value)")}
for key in dict.keys {print("\(key)")}
for value in dict.values {print("\(value)")}

/// dict to array
let keys = [String](dict.keys)
let values = [Int](dict.values)

/// ===== set =====
var emptySet = Set<String>()
var optionalSet:Set<String>?
var primes: Set = [2, 3, 5, 7]

/// set to array
let primeStrings = primes.sorted().map(String.init)
let primeArray = Array(primes.sorted())

/// sum
let primesSum = primes.reduce(0, +)

var ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
if ingredients.contains("sugar") {}

/// insert remove
ingredients.insert("milk") //{"cocoa butter", "cocoa beans", "salt", "milk", "sugar"}
ingredients.remove("sugar") //{"cocoa beans", "cocoa butter", "salt", "milk"}

/// iterate
for item in ingredients{print(item)}
for item in ingredients.sorted(){print(item)}

/// Tests whether primes is a subset of a Range
primes.isSubset(of: 0..<7) //true
primes.isSubset(of: 0..<6) //false

/// intersection, union, subtracting & symmetricDifference
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()// [1, 2, 9]

/// subset, superset
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubset(of: farmAnimals) // true
farmAnimals.isSuperset(of: houseAnimals) // true
farmAnimals.isDisjoint(with: cityAnimals) // true
