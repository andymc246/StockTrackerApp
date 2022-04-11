//
//  MiniQuoteBarLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/9/22.
//

import SwiftUI

struct MiniQuoteBarLayout: View {
    @ObservedObject var stock_Quotes: RealStockQuoteManager
    var body: some View {
        
        //allow horizontal movement for the mini quote navigation bar
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach (stock_Quotes.quotes) { quote in
                    VStack {
                        Text(quote.symbol) //prints out stock ticker
                            .bold()
                            .font(.headline)
                        
                        Text(quote.price) //prints out stock price
                            .font(.subheadline)
                        
                        Text(quote.change) //prints out stock price change
                            .frame(width: 80)
                            .font(.subheadline)
                            .padding(.horizontal)
                            
                            //makes "price change" green if above previous market closing price, else turns red
                            .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
                        
                        //Text("")
                        //Text(quote.changePercent) //prints out stock price change percentage
                            //.frame(width: 80)
                            //.font(.subheadline)
                            //.padding(.horizontal)
                            
                            //makes "price change percentage" green if above previous market closing price, else turns red
                            //.background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
                            
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.4)))
                    .foregroundColor(.white)
                }
            }
            //.background(Color.black)
        }
        //view of stock quotes appear on screen
        //.onAppear {
            //stock_Quotes.download(stocks: [], completion: { _ in })
        //}
    }
}


