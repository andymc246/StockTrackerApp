//
//  RealStockQuoteManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import Foundation


final class RealStockQuoteManager: QuoteManager, ObservableObject {
    
    @Published  var quotes: [Quote] = [] //variable quotes with an empty array

    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        var backendQuotes = [Quote]()
        
        //creating a queue for downloading stock quote because the global quote API can only call 1 API at a time
        let downloadingQueue = DispatchQueue (label: "com.mac.downloadingQueue")
        
        //creating a downloading group that notifies me when all the downloads are done
        let downloadingGroup = DispatchGroup()
        
        stocks.forEach {
            (stock) in
            downloadingGroup.enter() //go inside the downloading group which contains the dispatch group
            let url = URL(string: APIManager.quoteSearchUrl(for: stock))!
            //first time calling the NetworkManager
            //print error if sesrching for stock quote does not fit requirements
            NetworkManager<GlobalQuoteResponse>().fetch(from: url) {
                (result) in
                switch result {
                case .failure(let err):
                    print (err)
                    downloadingQueue.async {
                        downloadingGroup.leave()
                    }
                //print if successful
                case .success(let resp):
                    downloadingQueue.async {
                        backendQuotes.append(resp.quote)
                        downloadingGroup.leave()
                    }
                    
                }
            }
        }
        
        //once quotes are downloaded and stored,
        downloadingGroup.notify(queue: DispatchQueue.global()) {
            completion(.success(backendQuotes))
            DispatchQueue.main.async {
                self.quotes.append(contentsOf: backendQuotes)
            }
        }
        
    }
}
