//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let tipTotal = (4.00, 25.19)

//let tipTotal:(Double, Double) = (4.00, 25.19)

tipTotal.0
tipTotal.1

let (theTipAmt, theTotal) = tipTotal
theTipAmt
theTotal

let tipTotalNamed = (theTipAmt:4.00, theTotal:25.19)
tipTotalNamed.theTipAmt
tipTotalNamed.theTotal


let total = 21.19
let taxPct = 0.06
let subTotal = total / (taxPct + 1)
func calcTipWithTipPct(tipPct:Double) -> (tipAmt:Double, total:Double) {
    let tipAmt = subTotal * tipPct
    let finalTotal = total + tipAmt
    return(tipAmt,finalTotal)
    
}


print( "swift" + "lang")
print (1 + 1)

print("1+1 = " + String(1+1))

print(7.0 / 3.0)

print(String(7.0) + " / " + String(3.0))

print(true && false)
print (true || false)
print (!true)

var Str  = "Hello"
var smile = "😊"

var combined = Str + " " + smile

var length  = combined.characters.count
print(combined.lowercased())
print(combined.uppercased())

for char in combined.characters{
    print(char)
}

if let range = str.range(of: "ello"){
    print("ello")
}else {
    print("nope")
}


for index in 1..<5{
    print(index)
}

for index in 1..<5 {
    print(index)
}

let num  = 9
if(num < 0) {
    print("num is negative")
} else if num < 10{
    print("num is single-digit") // num  is single-digit
}else {
    print("num is multi-digit")
}


if 7 % 2 == 2  {
    print("7 is even") //iDE helpfully notes, "Will never  be executed"
}else {
    print("7 is odd") // 7 is odd
}

var optionalString:String? = "Hello?"
if let a = optionalString {
    print(a)
}
optionalString = nil
if  let b  = optionalString{
    print("yep")
} else {
    print("nope")
}

let i = 7
switch i {
case 1:
    print("one")
case 2:
    print("two")
case 3,4:
    print("three or four")
case _ where i > 5 :
    print("greater than 5")
default:
    print("less than 1")
}

func isEven (int:Int)-> Bool {
    return int % 2 == 0
}
switch isEven(int: i){
case true: print("Even")
case false: print("odd")
}

var strings = ["a","b","c"]

var strings2: [String] = ["d", "e", "f"]

var strings3=[String]()

var strings4 = [String](repeating:"hey", count: 3)

strings += ["d"]
strings.append("e")
strings += ["f", "g"]

strings3 = strings + strings2

print(strings.count)
print(strings[0])
print(strings.first!)
print(strings.last!)

strings[0..<1] = ["a"]      //Eclusive (basically the same as the prev assignment)
strings[0...1] = ["a", "b"]
strings[0...3]
strings[0..<strings.endIndex]

if strings.isEmpty {
    print("empty")
}else {
    print("populated")
}
strings.insert("a", at: 0)
print(strings.remove(at: 0))
strings.map({
    (str:String)->String in
    return str + "0"
})
strings.removeLast()

strings.removeAll(keepingCapacity: false)
strings = []

var rows = 10, cols = 10
var dimensional = Array<Array<Int>>()
for col in 0..<10 {
    dimensional.append(Array(repeating:Int(),count:rows))
}




