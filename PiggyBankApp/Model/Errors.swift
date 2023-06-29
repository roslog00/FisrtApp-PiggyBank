//
//  Errors.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 29.06.2023.
//

import Foundation
import RealmSwift


enum Errors: String, Error, CaseIterable {
    case stringOrInt = "You entered the wrong value"
    case invalidAddCash
}
