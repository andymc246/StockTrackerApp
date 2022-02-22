//
//  NewsTopPortionLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

import SwiftUI

struct NewsTopPortionLayout: View {
    var body: some View {
        
        //Vertical Layout Action
        VStack (alignment: .leading) {
            Text ("Top Market News")
                .font(.title)
                .foregroundColor(.white.opacity(0.7))
            
            //Horizontal Layout Acton
            HStack (spacing: 2.5) {
                Text ("From")
                Image (systemName: "chart.bar.doc.horizontal")
                Text ("NewsAPI.org")
            }
            .font(.title2)
            .foregroundColor(.gray.opacity(0.7))
            
            RoundedRectangle(cornerRadius: 2)
                .fill(Color.gray)
                .frame(height: 1)
        }
        //.background(Color.black)
    }
}

struct NewsTopPortionLayout_Previews: PreviewProvider {
    static var previews: some View {
        NewsTopPortionLayout()
    }
}
