//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

// Declaring a new Dicitonary
var carDB = Dictionary<String, String>()
var carDB2 = [String:String]()

// Adding key value pairs
carDB["JSD 238"] = "Blue Ferrari"
carDB["SID 482"] = "Green Lamborghini"

// Retrieving data
carDB["JSD 238"]

// Update a value for a key
carDB["JSD 238"] = "Red" + carDB["JSD 238"]![4..<carDB["JSD 238"]!.count]

// Remove a key-value pair
carDB["AID 339"] = nil

// Iterate over dict
for (license, car) in carDB {
    print("\(car) has a license: \(license)")
}



