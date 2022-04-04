//
//  Search.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 3/8/22.
//

import Foundation

struct SearchArea: Codable, Identifiable {
    var id: UUID { return UUID() }
    var symbol: String
    var name: String
    var type: String
    
    //parameters found in the json file
    private enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        
    }
    
}
