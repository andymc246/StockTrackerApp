//
//  SearchViewLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/7/22.
//

import SwiftUI

struct SearchViewLayout: View {
    
    @Binding var searchWord: String
     
    var body: some View {
        TextField(place_Holder_Text: Text("Search").foregroundColor(Color.blue), text: $searchWord)
            .foregroundColor(.white)
            .padding(.leading, 10)
            .frame(height: 30)
            .padding()
            .frame(height: 30)
            .background(ZStack(alignment: .leading) {
                RoundedRectangle (cornerRadius: 5).fill(Color.black.opacity(100))
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.blue)
                    .padding(.leading, 0)
            })
    }
}

struct SearchViewLayout_Previews: PreviewProvider {
     static var previews: some View {
         SearchViewLayout(searchWord: .constant(""))
     }
}



/**@Binding var searchWord: String
 
 var body: some View {
     TextField(place_Holder_Text: Text("Search").foregroundColor(Color.gray), text: $searchWord)
 }
}

struct SearchViewLayout_Previews: PreviewProvider {
 static var previews: some View {
     SearchViewLayout(searchWord: .constant(""))
 }*/
