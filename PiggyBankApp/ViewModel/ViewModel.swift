//
//  ViewModel.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//

import Foundation
import RealmSwift
import SwiftUI


class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @ObservedObject var dateManager = DateOfGoal()
    @Published var allDataOfPersonsGoals: [PersonsGoals] = []
    @Published var dataOfPersonGoalsWithId: PersonsGoals?
    @Published var id = PersonsGoals().id
    
    init() {
        openRealm()
        getData()
    }
    
    func openRealm() {
        
        let _ = print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do{
            let config = Realm.Configuration(schemaVersion : 0)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    func getData() {
        if let localrealm = localRealm {
            let allData = localrealm.objects(PersonsGoals.self)
            allDataOfPersonsGoals = []
            allData.forEach { data in
                allDataOfPersonsGoals.append(data)
                print(allDataOfPersonsGoals)
            }
        }
    }
    
    func getDataWithId(id: String) -> Results<PersonsGoals>?  {
        if let localrealm = localRealm {
            do {
                let id1 = try ObjectId(string: id)
                let allDataWithId = localrealm.objects(PersonsGoals.self).filter(NSPredicate(format: "id == %@", id1))
                print("Realm get data with id")
                
                return allDataWithId
                
            } catch {
                print("Error getting data from Realm with error \(error)")
            }
            
        }

        return nil
    }
    
    
    func writeData(_ goalsName: String, goalsCost: String ) {
        let date = dateManager.getDate()
        if let localrealm = localRealm {
            do {
                try localrealm.write {
                    let newTask = PersonsGoals(value: ["goalsNames": goalsName, "goalsCosts": goalsCost, "savedMoney": "0", "completedGoal": false, "date": date])
                    let savedMoneyTask = SavedMoney()
                    
                    savedMoneyTask.addMoney = "0"
                    savedMoneyTask.dateOfAddMoney = date
                    
                    newTask.listOfAddedMoney.append(savedMoneyTask)
                    
                    localrealm.add(newTask)
                    
                    print("New task - \(newTask) added to Realm")
                }
            } catch {
                print("Error! New task do not added to Realm")
            }
        }
    }
    
    func writeDataToList(id: String, money: String) {
        if let localrealm = localRealm {
            do {
                let id1 = try ObjectId(string: id)
                try localrealm.write {
                    let allDataWithId = localrealm.objects(PersonsGoals.self).filter(NSPredicate(format: "id == %@", id1))
                    let newAddMoney = SavedMoney()
                    newAddMoney.addMoney = money
                    newAddMoney.dateOfAddMoney = dateManager.getDate()
                    
                    allDataWithId[0].listOfAddedMoney.append(newAddMoney)
                }
                
            } catch {
                
            }
        }
    }
    
    
    func addSavedMoney(id: String, savedmoney: String, goalscost: String, completed: Bool? = nil) {
        if let localrealm = localRealm {
            do {
               let id1 = try ObjectId(string: id)
                let taskToUpdate = localrealm.objects(PersonsGoals.self).filter(NSPredicate(format: "id == %@", id1))
                
                guard !taskToUpdate.isEmpty else { return }
                
                try localrealm.write {
                    if (Int(taskToUpdate[0].savedMoney)! + Int(savedmoney)!) == Int(goalscost) {
                        taskToUpdate[0].completedGoal = true
                        taskToUpdate[0].savedMoney = String(Int(taskToUpdate[0].savedMoney)! + Int(savedmoney)!)
                    } else {
                        taskToUpdate[0].savedMoney = String(Int(taskToUpdate[0].savedMoney)! + Int(savedmoney)!)
                    }
                    
                    getData()
                }
                
                print("Task Updated!")
                
            } catch {
                print("Error updating task to Realm with error \(error)")
            }
            
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localrealm = localRealm {
            do {
                let taskToDelete = localrealm.objects(PersonsGoals.self).filter(NSPredicate(format: "id == %@", id))
                
                guard !taskToDelete.isEmpty else { return }
                
                try localrealm.write {
                    localrealm.delete(taskToDelete)
                    
                    getData()
                }
                
                print("Task deleted!")
                
            } catch {
                print("Error deleting task to Realm with error \(error)")
            }
        }
    }
    
    
    func verificationOnNumber(number: String) -> Bool {
        var bool = true
        
        number.forEach { Character in
            switch Character {
            case "1": bool = true
            case "2": bool = true
            case "3": bool = true
            case "4": bool = true
            case "5": bool = true
            case "6" : bool = true
            case "7" : bool = true
            case "8": bool = true
            case "9": bool = true
            case "0": bool = true
                
            default: bool = false
            }
        }
        
        return bool
    }
  
    func ratio() -> Int {
        let ratio = Int(UserDefaults.standard.string(forKey: "savedMoney")!)! / Int(UserDefaults.standard.string(forKey: "cost")!)!
        print("Ratio = \(ratio)")
        return ratio
    }
    
    func sizeRatio(string: String) -> Int {
        (string.count / 10) * 50
    }
    
//    func getNameWithId(id: ObjectId) {
//        @ObservedObject var realmManager = RealmManager()
//        
//        if let localrealm = localRealm {
//            let selfItem = localrealm.objects(PersonsGoals.self).filter(NSPredicate(format: "id == %@", id))
//            
//            selfItem.forEach { PersonsGoals in
//                realmManager.nameOfGoal = PersonsGoals.goalsNames
//                realmManager.costOfGoal = PersonsGoals.goalsCosts
//                realmManager.savedMoneyOfGoal = PersonsGoals.savedMoney
//            }
//        }
//        
//        print(realmManager.nameOfGoal, realmManager.costOfGoal, realmManager.savedMoneyOfGoal)
//    }
}

