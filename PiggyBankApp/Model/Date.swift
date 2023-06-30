//
//  Date.swift
//  PiggyBankApp
//
//  Created by Вероника Гера on 01.07.2023.
//

import Foundation
 

class DateOfGoal: ObservableObject {
    @Published var dateFormatter = DateFormatter()
    
    
    func getDate() -> String {
        dateFormatter.dateStyle = .short
        return dateFormatter.string(from: Date.now)
    }
}
