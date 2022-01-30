//
//  GlobalQuoteResponse.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation


struct GlobalQuoteResponse: Codable {
    var quote: Quote
    
    //define a type with related values to work with
    private enum CodingKeys: String, CodingKey {
        case quote  = "Global Quote"
        
    }
}
