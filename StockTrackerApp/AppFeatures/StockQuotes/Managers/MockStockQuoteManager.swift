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
        let tsla = Quote (symbol: "TSLA", open: "933.36", high: "935.39", low: "844.14", price: "844.56", change: "-92.53", changePercent: "-9.92%")
        
        //creating a for loop that runs through the parameters of each stock quotes in this mock file
        for _ in 0..<8 {
            quotes.append(contentsOf: [aapl, tsla])
        }
    }
}
