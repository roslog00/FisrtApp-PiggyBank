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

enum Currency: String {
    case dollar = "dollar"
    case euro = "euro"
    case yuan = "yuan"
    case yen = "yen"
    case pounds = "pounds"
    case rubles = "rubles"
}
