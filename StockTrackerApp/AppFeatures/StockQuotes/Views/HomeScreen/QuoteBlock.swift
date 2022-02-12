//
//  QuoteBlock.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/9/22.
//

import SwiftUI

struct QuoteBlock: View {
    var quote: Quote
    
    var body: some View {
        HStack {
            Text(quote.symbol) //display stock ticker symbol on the left
                .bold()
                .font(.headline).italic()
            
            Spacer()
            Spacer()
            
            VStack {
                Text(quote.price) //display stock price on the right
                    .bold()
                Text(quote.change) //display stock price change on the right
                    .padding(.horizontal)
                    .frame(width: 80)
                    
                    //makes "price change" green if above previous market closing price, else turns red
                    .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
    
                    
                    //makes "price change percentage" green if above previous market closing price, else turns red
                    .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
                
            }
        }
        
    }
}

struct QuoteBlock_Previews: PreviewProvider {
    static var previews: some View {
        QuoteBlock(quote: Quote(symbol: "TSLA", open: "935.00", high: "946.27", low: "920.00", price: "931.22", change: "+8.89", changePercent: "0.98%"))
    }
}
