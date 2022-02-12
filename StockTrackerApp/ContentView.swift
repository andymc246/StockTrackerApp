//
//  ContentView.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var stock_Quote_Manager = MockStockQuoteManager()
        //RealStockQuoteManager()
    
    // @State allows developer to modify values inside a struct
    @State var stocks = ["AAPL", "TSLA"]
    @State var old_Search_Stocks = [String]() //keep track of old stocks that were downloaded
    @State var searchWord = ""
    @State var news_Section = false //when the news section is open
    
    //initializer to set the appearance for the table view UI
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        //overlapping layout  of contents
        ZStack {
            Color.black
            VStack (alignment: .leading) {
                if (news_Section) { //when news_Section is called, the mini quote bar will appear
                    withAnimation {
                        MiniQuoteBarLayout(stock_Quotes: stock_Quote_Manager)
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .frame(height: news_Section ? 100:0)
                            .transition(.move(edge: .top))
                    }
                }
                else { //if news_Section is not called, bring up the top view layout UI
                    withAnimation  {
                        TopViewLayout(stocks: $stocks)
                            .padding(.top, 50)
                            .frame(height: news_Section ? 0:100)
                            .transition(.move(edge: .top))
                    }
                    
                }
                
                List {
                    Group {
                        SearchViewLayout(searchWord: $searchWord) //bring up the search view layout UI
                            
                        
                        ForEach(get_Quotes()) { quote in
                            QuoteBlock(quote: quote) //brings up the quote block UI on the right side
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                }
                .onAppear { //shows the QuoteBlock UI
                    get_Data(for: stocks)
                    old_Search_Stocks = stocks
                }
                .onChange(of: stocks, perform: { value in
                    
                })
                .listStyle(PlainListStyle())
                .foregroundColor(.white)
            }
            .padding (.horizontal, 30)
            .padding(.bottom, UIScreen.main.bounds.height*0.21)
            
        }
        .edgesIgnoringSafeArea(.all) //fill the entire screen in black background
    }
    //if search word for stock is empty, this gets either the filter result or all of the result
    private func get_Quotes() -> [Quote] {
        return searchWord.isEmpty ? stock_Quote_Manager.quotes :
        stock_Quote_Manager.quotes.filter {
            $0.symbol.lowercased().contains(searchWord.lowercased())
        }
    }
    
    private func get_Data (for symbols: [String]) {
        stock_Quote_Manager.download(stocks: symbols) { _ in
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
