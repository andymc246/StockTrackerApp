//
//  News.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/20/22.
//

import Foundation

//defining a structure for News attributes to go inside the NewsAPIResponse Class
struct News: Identifiable, Codable {
    
    var title: String //gets the title of the article from the NewsAPIResponse class
    var id: UUID { return UUID() }  //create an id to satisfy the requirements of identifiable
    var url: String //gets the url of the article from the NewsAPIResponse class
    var url_Image: String? //gets the url of the image, may or may not be in a string form
    
    //the main variable that will be used in the app to get the image of the article
    var imageURL: String {
        return url_Image?.replacingOccurrences(of: "http://", with: "https://") ?? //makes sure the url keyword for http is replaced to https
            "https://img.favpng.com/9/25/10/market-icon-news-icon-newspaper-icon-png-favpng-9fzt1QHhunzPKT4PpSeXbSRQL.jpg"
    }
}


