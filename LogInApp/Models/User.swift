//
//  User.swift
//  LogInApp
//
//  Created by Nikolai Maksimov on 17.06.2022.
//

import Foundation

struct User {
    
    let user: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(user: "User", password: "Password", person: Person.getPerson())
    }
}

struct Person {
    
    let name: String
    let surName: String
    var image: String
    var fullName: String {
        "\(name) \(surName)"
    }
    
    static func getPerson() -> Person {
        Person(name: "John", surName: "Smith", image: "SwiftImage")
    }
}
