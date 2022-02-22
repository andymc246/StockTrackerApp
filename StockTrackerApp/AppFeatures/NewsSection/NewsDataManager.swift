//
//  NewsDataManager.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/20/22.
//

//this class is to download and perform functions for the NewsAPIResponse

import Foundation

final class NewsDataManager: ObservableObject {
    
    @Published var news_Articles = [News]()

    //url link to the News API website stored into newsURL_String variable
    //Top business headline (news) in the US today
    //attached the news url with my news API key
    private let newsURL_String = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(NewsAPIKey.key)"

    init() {
        download()
    }

    //when downloading the API key with the url, check for errors
    func download() {
        NetworkManager <NewsAPIResponse>().fetch(from: URL(string: newsURL_String)!) { (result) in //calls the Network Manager class to catch errors in NewsAPIResponse
            switch result {
            
            //prints the error if download fails
            case .failure(let err):
                print(err)
                
            //give all the attributes in News class if download is successful
            case .success(let resp):
                DispatchQueue.main.async {
                    self.news_Articles = resp.articles
                }
            }
        }
    }

}
