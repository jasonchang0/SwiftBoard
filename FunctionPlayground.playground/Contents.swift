//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var int1:Int = 5
var int2:Int = 20

func addTwoNums(_ a:Int, _ b:Int) -> Int {
    return a + b
}

func subTwoNums(_ a:Int, _ b:Int) -> Int {
    return a - b
}

let sum = addTwoNums(int1, int2)
print(sum)

let diff = subTwoNums(int1, int2)
print(diff)


