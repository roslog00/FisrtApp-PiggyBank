//
//  ViewModel.swift
//  PiggyBank
//
//  Created by Вероника Гера on 11.06.2023.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published public var goalsName = ""
    @Published public var goalsCosts = ""
    @Published public var savedMoney = ""

    init() {
        openRealm()
        getData()
    }
    
    func openRealm() {
        
        let _ = print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do{
            let config = Realm.Configuration(schemaVersion : 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            print("Error opening Realm: \(error)")
        }
    }
    
    
    func getData(id: ObjectId? = nil) {
        if let localrealm = localRealm {
            let allTask = localrealm.objects(PersonsGoals.self)
            goalsName = ""
            goalsCosts = ""
            savedMoney = ""
             allTask.forEach { task in
                 if id == task.id {
                     goalsName = task.goalsNames
                     goalsCosts = task.goalsCosts
                     savedMoney = task.savedMoney
                 }
             }
            print(goalsName)
            print(goalsCosts)
            print(savedMoney)
        }
    }
    
}
