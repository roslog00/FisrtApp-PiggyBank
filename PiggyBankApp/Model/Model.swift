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


class Person: Object, Identifiable {
    
    @Persisted var personsName = ""
    @Persisted var personsCurrency = ""
    
}

class PersonsGoals: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var goalsNames = ""
    @Persisted var goalsCosts = ""

    
    
    override class func primaryKey() -> String? {
        "id"
    }

}

enum Currency: Identifiable, CaseIterable {
    var id: Self { self }
    var description: String {
        switch self {
        case .dollar: return "dollar"
        case .euro: return "euro"
        case .pounds: return "pounds"
        case .yuan: return "yuan"
        case .yen: return "yen"
        case .rubles: return "rubles"
        }
    }
    
    case dollar
    case euro
    case yuan
    case yen
    case pounds
    case rubles
}
