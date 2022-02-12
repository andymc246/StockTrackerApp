//
//  QuoteTypes.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation

//makes quotes in miniquotebarlayout class identifiable  
extension Quote: Identifiable {
    var id: UUID {
        return UUID()
    }
}

struct Quote: Codable {
    //initalizing the variable types for stock quotes
    var symbol: String
    var open: String
    var high: String
    var low: String
    var price: String
    var change: String
    var changePercent: String
    
    private enum CodingKeys: String, CodingKey {
        //initalizing values for each variable types for stock quotes
        case symbol = "01. symbol"
        case open = "02. open"
        case high = "03. high"
        case low = "04. low"
        case price = "05. price"
        case change = "09. change"
        case changePercent = "10. change percent"
        
    }
    
}


