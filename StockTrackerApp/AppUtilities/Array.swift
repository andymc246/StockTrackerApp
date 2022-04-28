//
//  Array.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 3/14/22.
//

//create an array class where it can section off the difference between the news section and the stocks layout
import Foundation

extension Array where Element: Hashable {
    
    func differenceOfSections (from other: [Element]) -> [Element] {
        
        let thisSet = Set(self)
        let otherSet = Set(other)
        
        return Array (thisSet.symmetricDifference(otherSet))
    }
}

