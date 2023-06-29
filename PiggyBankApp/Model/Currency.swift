//
//  Currency.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 29.06.2023.
//

import Foundation
import RealmSwift



enum Currency: String, CaseIterable, PersistableEnum{
    
    case dollar = "dollarsign"
    case euro = "eurosign"
    case yenAndYuan = "yensign"
    case pounds = "sterlingsign"
    case rubles = "rublesign"
    
}
