//
//  CusTextField.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 3/14/22.
//

import SwiftUI

struct CusTextField: View {
    
    var place_Holder_Text: Text
    
    @Binding var text: String
    
    var editChanged: (Bool) -> Void = { _ in }
    
    var commit: () -> Void = {}
    
    
    var body: some View {
        //zstack creates an overlapping of views
        ZStack (alignment: .leading) {
            if text.isEmpty { place_Holder_Text }
            //TextField(place_Holder_Text: Text(""), text: $text, edit_Text: edit_Text, commit: commit)
            TextField("", text: $text, onEditingChanged: editChanged, onCommit: commit)
        }
    }
}
