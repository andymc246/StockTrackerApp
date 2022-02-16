//
//  TopViewLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import SwiftUI
import FirebaseAuth  //******

struct TopViewLayout: View {
    
    let auth = Auth.auth() //******
    
    var sIn = false //********
    
    //creating a date formatting section
    private let dataFormatter: DateFormatter = {
        let formatting  =  DateFormatter()
        formatting.dateFormat = "MMMM dd"
        return formatting
    } ()
    
    //binding connects the variable stocks to a source stored rather than storing data directly
    @Binding var stocks: [String]
    
    //this will help keep track of history data
    //State allows object to change internally
    @State private var showSearchHistory = false
    
    
    func signOut() { //**********
        try? auth.signOut()
        //sIn = false
    }
    
    @EnvironmentObject var viewModel: AppLayoutModel
    
    var body: some View {
        HStack { //arranges its children view in a horizontal line
            VStack (alignment: .leading, spacing: -5) { //arranges its children view in a vertical line
                Text ("StockApp")
                    .foregroundColor(.white)
                    .bold()
                
               // Text ("")
                
                Text ("Design by Andy Mac")
                    .foregroundColor(.gray)
                    .fontWeight(.light)
                    .font(.caption)
            
              //  Text ("")
                
                Text ("\(Date(), formatter: dataFormatter)")
                .foregroundColor(.gray)
                .bold()
                
            }
            .font(.title)
            
            Spacer()
            
            Button {
                showSearchHistory.toggle()
            }
            label: {
                Image(systemName: "pencil.circle.fill")
                .font(.title)
                .foregroundColor(.blue)
            }
            .sheet(isPresented: $showSearchHistory, content: {
                Text ("This is the search view area")
            })
            
            Button (action: {
                viewModel.signOut()
                
            },label: {
                Text("Sign Out")
                    .frame(width: 80, height: 20)
                    .background(Color.black)
                    .foregroundColor(Color.teal)
                    .padding()
            })
    
            
        }
        .background(Color.black)
    
        
    }
}

struct TopViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopViewLayout(stocks: .constant(["AAPL", "TSLA"]))
        }
    }
}
