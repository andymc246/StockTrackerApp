//
//  QuoteManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation


protocol QuoteManager {
    //variable called quotes
    var quotes: [Quote] {
        get set //both gettable and settable
    }
    
    //function download that takes an array of stocks downloaeded and return a result quotes
    func download (stocks:  [String], completion: @escaping (Result <[Quote], NetworkError>) -> Void)
    
}
