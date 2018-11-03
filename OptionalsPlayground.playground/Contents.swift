//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    
    var name:String = ""
    
    init(_ name:String) {
        self.name = name
    }
}

class BlogPost {
    
    var title:String?
    var body:String!
    var author:Person?
    var numComments = 0
    
    init() {
        body = ""
        author = Person("Name")
        title = "My Title"
    }
    
    convenience init(customTitle:String) {
        self.init()
        title = customTitle
    }
    
    func addComment() {
        numComments += 1
    }
    
    // Computedd property
    var fullTitle:Bool {
        // Check that title and author are not nil
        return title != nil && author != nil
    }
}


let post = BlogPost()

print(post.body + "hello!")


// Optional Assignment
post.title = "book 1"

// Optional Binding
if let actualTitle = post.title {
    // Optional contains value
    print(actualTitle + " salut")
}

// Testing for nil
if post.title != nil {
    // Optional contains value
    print(post.title! + " salut")
}


