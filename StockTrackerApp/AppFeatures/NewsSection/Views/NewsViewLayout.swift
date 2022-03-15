//
//  NewsViewLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

//this class activates the news from the API website to appear when the news tab/section is open
import SwiftUI

struct NewsViewLayout: View {
    
    //binding declares that a variable comes from somewhere else, and is shared in multiple places
    @Binding var newsTabOpen: Bool //variable that checks if the news view layout (news section) is opened
    @ObservedObject var news_Manager: NewsDataManager //connected the news API url along with any error exception
    
    init (newsTabOpen: Binding <Bool>, news_Manager: NewsDataManager) {
        
        //Declare a few settings for tableview list for the SwiftUI
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        
        //self reference to the current object/instance in this class
        self._newsTabOpen = newsTabOpen
        self.news_Manager = news_Manager
    
    }
    
    var body: some View {
        BottomViewLayout (isNewsTabOpen: $newsTabOpen, maxHeight: UIScreen.main.bounds.height * 0.88) {
            
            //zstack- overlapping or overlaying content/view
            ZStack {
                Color.white
                Rectangle().fill(Color.black.opacity(0.9))
                
                //Vertical Stack view
                VStack (alignment: .leading) {
                    NewsTopPortionLayout()
                    
                    Spacer()
                    
                    NewsCatalogLayout(news_Manager: news_Manager)
                    
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

