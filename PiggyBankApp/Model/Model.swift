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


class Person: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var currency = ""
    
}

class PersonsGoals: Object {
    
    @objc dynamic var goalsNames = ""
    @objc dynamic var goalsCosts = ""
    
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
