//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class BlogPost {
    var title = ""
    var body = ""
    var author = ""
    var numComments = 0
    
    func addComment() {
        numComments += 1
    }
}

let myPost = BlogPost()
myPost.title = "Hello Playground"
myPost.author = "Jason Chang"
myPost.body = "Hello"
myPost.addComment()
print(myPost.numComments)


let mySecondPost = BlogPost()
myPost.title = "Goodbye Playground"
myPost.author = "Varun Jhunjhunwalla"
myPost.body = "Hello"
print(mySecondPost.numComments)


class Car {
    var topSpeed: Int = 0
    var color: String = ""
    
    init() {
        self.topSpeed = 200
        self.color = "White"
    }
    
    init(_ topSpeed: Int, _ color: String) {
        // Set up your object
        self.topSpeed = topSpeed
        self.color = color
    }
    
    func drive() {
        print("Driving at \(topSpeed)")
    }
}

class FuturisticCar : Car {
    
    override func drive() {
        print("Rocket boosting at \(topSpeed * 100)")
    }
    
    func fly() {
        print("Flying at \(topSpeed * 100)")
    }
}

let myRide = Car()
myRide.topSpeed
myRide.drive()

let myNewRide = FuturisticCar(2000, "Black")
myNewRide.topSpeed
myNewRide.drive()
myNewRide.fly()






