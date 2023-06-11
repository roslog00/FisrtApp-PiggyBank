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
    
    let goalsOfPerson = PersonsGoals()
    let person = Person()
    let currency1 = Currency.allCases
    
    @Published var nameOfPerson = ""
    @Published var currency = ""
    @Published var goalsName = ""
    @Published var goalsCost = ""
    
    //Save Goal's name
    func saveGoalsName(usersGoalsName: PersonsGoals, goalsName1: String) {
        try! realm.write {
            usersGoalsName.goalsNames = goalsName
            realm.add(usersGoalsName)
        }
    }
    
    //Save Goal's cost
    func saveGoalsCost(usersGoalsCost: PersonsGoals, goalsCost1: String) {
        try! realm.write {
            usersGoalsCost.goalsCosts = goalsCost
            realm.add(usersGoalsCost)
        }
    }
    //Added Persons's name
    func addNameOfPerson (_ nameOfPerson1: String) {
        saveName(usersName: person, nameOfPerson1)
    }
    //Save Person's name
    func saveName(usersName: Person,_ name1: String) {
        try! realm.write{
            usersName.name = nameOfPerson
            realm.add(usersName)
        }
    }
    
    func obtainUsers() -> String {
        let model = realm.objects(Person.self)
        var name = ""
        for element in model {
            name = element.name
        }
        return name
    }
    
    func obtainPersonsGoalsName() -> String {
        let model = realm.objects(PersonsGoals.self)
        var goalsName = ""
        for element in model {
            goalsName = element.goalsNames
        }
        
        return goalsName
    }
    
    func obtainPersonsGoalsCost() -> String {
        let model = realm.objects(PersonsGoals.self)
        var goalsCost = ""
        for element in model {
            goalsCost = element.goalsCosts
        }
        
        return goalsCost
    }
    
    func countOfGoals() -> Int {
        let count = self.obtainPersonsGoalsName().count 
        return count
    }
    
}
