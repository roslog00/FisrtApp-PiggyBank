//
//  ViewModel.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//

import SwiftUI
import RealmSwift


class User: ObservableObject{
    
    let realm = try! Realm(configuration: .defaultConfiguration)
    
   
    let person = Person()
    
    @Published var nameOfPerson = ""
    @Published var currency = ""
    @Published var goalsName = ""
    @Published var goalsCost = ""
    
    func addNameOfPerson (_ nameOfPerson1: String) {
        save(usersName: person, nameOfPerson1)
    }
    
    
    func save (usersName: Person,_ name: String) {
        try! realm.write{
            usersName.name = nameOfPerson
            realm.add(usersName)
        }
    }
    
    func obtainUsers() -> String{
        let model = realm.objects(Person.self)
        var name = ""
        for element in model {
            name = element.name
        }
        return name
    }
    
}
