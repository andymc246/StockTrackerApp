//
//  APIManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation


//this will pull API parameters within the alpha vantage website when called
struct APIManager {
    static var startingUrl: String {
        return "https://www.alphavantage.co/query?" //www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=demo
    }
    
    //create function for searching stock ticker that returns a string
    static func stockTickerSearchURL (for searchKey: String) -> String { //search url of stock tickers
        
        return urlFrom (symbol: .search, searchKey: searchKey) //pulls from SYMBOL_SEARCH parameters
        
    }
    
    //create function for searching quotes that returns a string
    static func quoteSearchUrl (for searchKey: String) -> String { //search url of quotes
        
        return urlFrom (symbol: .quote, searchKey: searchKey)  //pulls from GLOBAL_QUOTE parameters
        
    }
    //create private function for getting the url from enum SymbolFunc
    private static func urlFrom (symbol: SymbolFunc, searchKey: String) -> String {
        switch symbol {
        case .search:
            
            //print ("\(startingUrl)function=\(symbol.rawValue)&apikey=\(key)&keywords=\(searchKey)")
            
            //returns the url link in variable startingUrl followed by the parameters in SYMBOL_SEARCH
            return "\(startingUrl)function=\(symbol.rawValue)&apikey=\(key)&keywords=\(searchKey)"
            
        
        case .quote:
            
            //print ("\(startingUrl)function=\(symbol.rawValue)&apikey=\(key)&symbol=\(searchKey)")
            
            //returns the url link in variable startingUrl followed by the parameters in GLOBAL_QUOTE
            return "\(startingUrl)function=\(symbol.rawValue)&apikey=\(key)&symbol=\(searchKey)"
            
        }
    }
    
    
    enum SymbolFunc: String {
        //JSON output of parameters found in SYMBOL_SEARCH file from alpha vantage API
        case search = "SYMBOL_SEARCH"
        //JSON output of parameters found in GLOBAL_QUOTE file from alpha vantage API
        case quote = "GLOBAL_QUOTE"
        
    }
}

//this will look for certain keywords of the stock ticker symbol
extension APIManager {
    static var key: String {
        return "BWEY531S5RATT0OD"
    }
}
