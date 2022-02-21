//
//  NewsAPIResponse.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/20/22.
//

import Foundation

//defining a structure
struct NewsAPIResponse: Codable {
    
    var articles: [News] //creating a variable called articles that takes an array of attributes/variables from the News Class
    
}
