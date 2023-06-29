//
//  Item.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 11.06.2023.
//

import Foundation
import SwiftData
import RealmSwift

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

//class Person: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted var personGoals = List<PersonsGoals>()
//}


class PersonsGoals: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var goalsNames = ""
    @Persisted var goalsCosts = ""
    @Persisted var savedMoney = ""
    @Persisted var completedGoal = false
    @Persisted var listOfAddedMoney = List<SavedMoney>()
    @Persisted var date: Date
    
    override class func primaryKey() -> String? {
        "id"
    }

}

class SavedMoney: Object {
    @Persisted var addMoney = ""
}
