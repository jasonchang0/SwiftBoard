//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var a = "dog"
var b = "cat"
var c = "bird"

var d = [String]()
d += [a, b, c]
d += ["mouse", "owl"]

d.remove(at: 0)
d[0] = "turtle"

for counter in 0...(d.count-1) {
    print("my " + d[counter])
}

for item in d {
    print("your " + item)
}


