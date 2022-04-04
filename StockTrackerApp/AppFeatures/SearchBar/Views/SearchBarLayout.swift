//
//  SearchBarLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 3/14/22.
//

import SwiftUI

struct SearchBarLayout: View {
    
    //state variable that contains an empty string for now
    @State private var searchWord: String = ""
    
    //subcscribe a variable as an object and takes in the search bar manager class functionality
    @ObservedObject var searchManager = SearchBarManager()
    
    

    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
            
            VStack {
                HStack {
                    //getting the layout from search view layout class
                    SearchViewLayout(searchWord: $searchWord)
                    
                    //calls search manager class to e
                    Button (action: {
                        searchManager.searchStocks(keyword: searchWord)
                    }) {
                        
                        Image (systemName: "arrow.2.circlepath")
                            .font(.title2)
                            .foregroundColor(.white)
                    }
                    
                    Button  {
                        DefaultManager.shared.removeStocks()
                       // RealStockQuoteManager().quotes.removeAll()
                    } label: {
                    Text("Clear")
                        .frame(width: 80, height: 20)
                        .background(Color.black)
                        .foregroundColor(Color.teal)
                        .padding()
                    }
                }
                
                Spacer()
                
                ScrollView {
                    ForEach (searchManager.searches) { item in
                        HStack {
                            VStack (alignment: .leading) {
                                Text (item.symbol)
                                    .font(.title)
                                    .bold()
                                
                                Text (item.type)
                                    .font(.body)
                                
                            }
                            Spacer()
                            
                            Text (item.name)
                            
                            Spacer()
                            
                            Button (action: {
                                DefaultManager.shared
                                    .set (symbol: item.symbol)
                            }) {
                                
                                Image (systemName: "plus.circle.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                        .foregroundColor(.white)
                        RoundedRectangle (cornerRadius: 30)
                            .fill (Color.white)
                            .frame (height: 1)
                        
                    }
                }
            }
            
            .padding (.top, 60)
            .padding (.horizontal, 20) //change this if need be
        }
        
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SearchBarLayout_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarLayout()
    }
}
