//
//  NewsCatalogLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

import SwiftUI

struct NewsCatalogLayout: View {
    
    //observed object is a property wrapper that manage external objects
    @ObservedObject var news_Manager: NewsDataManager //connected the news API url along with any error exception
    
    //state is a property wrapper where user can change values inside a struct
    @State private var openSafari = false //show news article on safari if selecte
    @State private var chosenNewsArticle: News? //determine the selected article to direct the change of that article's url 
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
