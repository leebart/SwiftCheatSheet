# Swift 5.1 cheat sheet
## Everything you need to code / leetcode

### String and Character
[\StringCheatSheet.playground/Contents.swift](https://github.com/leebart/SwiftCheatSheet/blob/master/StringCheatSheet.playground/Contents.swift)

```
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