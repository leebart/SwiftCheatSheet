# Swift 5.1 cheat sheet
## Everything you need to code / leetcode

### String and Character
[\StringCheatSheet.playground/Contents.swift](https://github.com/leebart/SwiftCheatSheet/blob/master/StringCheatSheet.playground/Contents.swift)

```swift
var abc = "abc", def = "def", hw = "hello world"

///String compare
if(def>abc){} //true

///count
hw.count //3

///contains
hw.hasPrefix("hel") //true
hw.hasSuffix("rld") //true
hw.contains("llo") //true
var hwIndex = hw.firstIndex(of:"o") // type(of: ) String.Index
var indexToInt = hw.distance(from: hw.startIndex, to: hwIndex!) //4
hw.contains{"aeiou".contains($0)} //true
hw.filter{"aeiou".contains($0)} //"eoo"

///substring
var firstThree = hw.prefix(3) ///ype(of: sub) Substring
String(firstThree) //"hel", type(of: rs) String
String(hw.suffix(3)) //"rld"
let range = hw.startIndex..<hw.endIndex
var sub = hw[range] /// type(of: sub) Substring
var rs = String(sub) /// type(of: rs) String

///capital uppercase lowercase
let cs = hw.capitalized //"Hello World"
let csupper = hw.uppercased() //"HELLO WORLD"
let cslower = hw.lowercased() //"hello world"

///String insert
abc.insert(contentsOf: "z", at: abc.index(abc.startIndex,offsetBy: 2))//abzc

///escape
let oldWay = "\\a\\b\\c"
let newWay = #"\a\b\c"#

///new line
let newLine = "a\nb\nc"
let otherWay = """
a
b
c
"""

///format
let mn1 = "\(abc)\(def)"
let mn2 = abc + def
var mn3 = abc
abc.append(def)
var mn4 = [abc,def].joined(separator:" ")

///casting
let i = 255
let iStr = String(i)
let hexStr = String(i,radix:16)
let binaryStr = String(i,radix:2)

///===== character =====
///String to character array
var abcArr = Array(abc);
abcArr.insert("y", at: 2);
String(abcArr)//abyzc

///iterate character array
for char in hw {
    if(char > "d"){ //character compare
        print(char)
    }
}

///ascii value
Character("a").isASCII //true
Character("a").asciiValue //97
Character("c").asciiValue! - Character("a").asciiValue! //2
hw.first //type(of:) Optional<Character>.Type
hw.last
hw.firstIndex(of:"o") //type(of:) Optional<String.Index>.Type
var a = abc.firstIndex{$0 < "c"} //type(of:) Optional<String.Index>.Type

///index, get char in string
hw[hw.startIndex] //"h"
hw[hw.index(before: hw.endIndex)] //"d"
hw[hw.index(after: hw.startIndex)] //"e"
hw[hw.index(hw.startIndex, offsetBy: 1)] //"e"
```

### Collections
#### Array, dictionary & Set
[\CollectionCheatSheet.playground/Contents.swift](https://github.com/leebart/SwiftCheatSheet/blob/master/CollectionCheatSheet.playground/Contents.swift)

```swift
/// ===== array =====
var optionalArray:[Int]?
var emptyArray = [Int]()
var numberArray = [0,1,2,3,4,5,6,7,8,9]
var fiveZs = Array(repeating: "Z", count: 5)

/// iterate
for number in numberArray {number} //0123456789
for i in 0..<numberArray.count {numberArray[i]} //0123456789
for i in 0...numberArray.count-1 {numberArray[i]} //0123456789

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

/// Tests whether primes is a subset of a Range
primes.isSubset(of: 0..<7) //true
primes.isSubset(of: 0..<6) //false

/// Performs an intersection with an Array
let favoriteNumbers = [5, 7, 15, 21]
primes.intersection(favoriteNumbers)

```