//
//  Item.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 11.06.2023.
//

import Foundation
import RealmSwift


//class Person: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted var personGoals = List<PersonsGoals>()
//}


final class PersonsGoals: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var goalsNames = ""
    @Persisted var goalsCosts = ""
    @Persisted var savedMoney = ""
    @Persisted var completedGoal = false
    @Persisted var listOfAddedMoney = List<SavedMoney>()
    @Persisted var date : String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }

}

final class SavedMoney: Object, ObjectKeyIdentifiable {
    @Persisted var dateOfAddMoney: String = ""
    @Persisted var addMoney = ""
}
