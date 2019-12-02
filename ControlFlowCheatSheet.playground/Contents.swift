import UIKit

/// ===== for =====
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {print("\(name)")}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {print("\(animalName)-\(legCount)")}

/// iterate index in range
for index in 1...5 {print("\(index)")}
for tickMark in 0..<60 {} //0,1,2....59

/// iterate with stride ex: i+=5
for tickMark in stride(from: 0, to: 60, by: 5) {}//0, 5, 10, 15 ... 45, 50, 55
for tickMark in stride(from: 3, through: 60, by: 5) {}//0, 5, 10, 15 ... 45, 50, 55, 60

/// ===== while =====
var i = 0
while i < 10 {print(i);i += 1}
/// run at least once
var j = 0
repeat {print(j);j += 1} while j < 0

/// ===== if =====
var f = 30
if f < 32 {}
else if f > 32 {}
else{}

/// ===== switch case =====
let c: Int = 10
switch c {
case 1, 2:
    print(c)
case 3:
    print(c)
case 4...6:
    print(c)
case 7..<10:
    print(c)
default:
    print(c)
}

/// tuple switch
let somePoint = (3, 3)
switch somePoint {
case (0, 0),(1,1): print("point is 0,0 or 1,1")
case (0, _): print("point is 0,any")
case (let x, 0): print("point is \(x),0")
case (-2...2, -2...2): print("point is inside the box")
case let (x, y) where x == y:
    print("\(x) == \(y)")
    fallthrough //print ☝️3==3 and 👇3,3
case let (x, y): print("\(x),\(y)")//like default, with value x & y
}

/// ===== continue, break, return and ☝️fallthrough =====
func TransferStatements(){
    for i in 0..<10 {
        if(i==0) {continue}
        else if(i==5) {break}
        else if(i==9) {return}
    }
}

/// break or continue the Labeled Statements
var s=1,fs=10
gameLoop: while s != fs {
    s += 1
    if s >= fs {break gameLoop}
    if s < fs {continue gameLoop}
}

/// ===== guard let =====
func guardLet(myname:String?) -> String {
    guard let name = myname else {return ""}
    guard name != "bob" else {return "that bob"}
    return name
}

/// if let
func ifLet(myname:String?) -> String {
    if let name = myname{return name}
    else{return ""}
}

/// api check
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
