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

class PersonsGoals: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var goalsNames = ""
    @Persisted var goalsCosts = ""
    @Persisted var savedMoney = ""
    @Persisted var completedGoal = false
    @Persisted var Date: Date
    
    override class func primaryKey() -> String? {
        "id"
    }

}



enum Currency: String, CaseIterable, PersistableEnum{
    
    case dollar = "dollarsign"
    case euro = "eurosign"
    case yenAndYuan = "yensign"
    case pounds = "sterlingsign"
    case rubles = "rublesign"
    
}
