//
//  SearchBarManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 3/8/22.
//

import Foundation


//manage any error issues with the search bar task and calls the Network Manager

final class SearchBarManager: ObservableObject {
    
    @Published var searches = [SearchArea]()
    
    func searchStocks (keyword: String) {
        NetworkManager<SearchBarResponse>().fetch(from: URL(string: APIManager.stockTickerSearchURL(for: keyword))!) { (result) in
            switch result {
                
                case .failure(let err):
                    print (err)
        
                case .success(let resp):
                
                    DispatchQueue.main.async {
                        self.searches = resp.bestMatches
                    
                }
            }
        }

    } //end fucntion
    
}
