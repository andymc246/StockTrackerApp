//
//  DefaultManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 3/8/22.
//

import Foundation
import SwiftUI

//incorporating previous searched/saved tickers and provide a user default content for the search bar
final class DefaultManager {
    static let symbolKey = "SYMBOL_KEY"
    
    var savedTickers = [String]()
    static let shared = DefaultManager()
    
    private init() {
        get()
    }
    
    //getter function to get the stock ticker symbol and saved it as default
    func get() {
        if let saved = UserDefaults.standard.array(forKey: Self.symbolKey) as? [String] {
            savedTickers = saved;
        }
    }
    
    //setter function to set the stock ticker symbol and saved it as default
    func set(symbol: String) {
        savedTickers.append(symbol)
        UserDefaults.standard.set(self.savedTickers, forKey: Self.symbolKey)
    }
    
    func removeStocks()  {
       // savedTickers.removeAll()
       //UserDefaults.resetStandardUserDefaults()
        
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        
        
     //   savedTickers = []
     //   UserDefaults.standard.set(self.savedTickers, forKey: Self.symbolKey)
        
        //savedTickers = UserDefaults.standard.array(forKey: Self.symbolKey) as? [String] ?? []
        
        
    }
    

    
}
