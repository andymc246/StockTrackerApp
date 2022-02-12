//
//  MockStockQuoteManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation


final class MockStockQuoteManager: QuoteManager, ObservableObject {
    
    @Published  var quotes: [Quote] = [] //variable quotes with an empty array
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl = Quote (symbol: "AAPL", open: "162.45", high: "163.84", low: "158.59", price: "158.96", change: "-0.40", changePercent: "-0.40%")
        let tsla = Quote (symbol: "TSLA", open: "935.00", high: "946.27", low: "920.00", price: "931.22", change: "+8.89", changePercent: "0.98%")
        
        //creating a for loop that runs through the parameters of each stock quotes in this mock file
        for _ in 0..<8 {
            quotes.append(contentsOf: [aapl, tsla])
        }
    }
}
