//: Playground - noun: a place where people can play

import UIKit

var str:String = "Hello, playground"
print(str)

var a:Int = 2
var b:Int = 1

a = b

str = String(29)

var c:Float = 2.3
var d:Double = 13.9
var e:Bool = true

print(Int(c))
print(Int(d))
print(Int(round(d)))

var numApple:Int = 20

print(a + b)
print(a - b)
print(a * b)
print(a / b)

/* Use the "let" keyword for constants,
 which are like variables except they can't
 be reassigned to new data after the first assignment.*/
let f = 10


if (a >= 1 || b >= 1) && !(numApple < 10) {
    print("branch 1")
} else if (numApple > 20){
    print("branch 2")
} else {
    print("nothing is true")
}


var char:Character = "c"

switch char {
    case "a":
        print("is an A")
    case "b", "c":
        print("is a B or C")
    
    default:
        print("some fallback")
}


var sum = 0

for inddex in 1...5 {
    sum += index
    print(sum)
}

