//
//  BottomViewLayout.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

import SwiftUI


//storing some constant variables for the bottom layout of the app. This is where the news section will be
//enumeration is a common type for a group of related values and allows a user to work with those values in a type-safe way
fileprivate enum Constants {
    
    static let indexHeight: CGFloat = 6
    static let indexWidth: CGFloat = 60
    static let radius: CGFloat = 16
    
    static let minRatioHeight: CGFloat = 0.2
    static let swipeRatio: CGFloat = 0.25 //makes the view expand or collapse (snap) depending on the ratio degree the user is swiping up or down
    
}



struct BottomViewLayout<Content: View>: View {
    
    let content: Content
    let minHeight: CGFloat
    let maxHeight: CGFloat
    
    //binding declares that a variable comes from somewhere else, and is shared in multiple places
    @Binding var isNewsTabOpen: Bool //variable that checks if the bottom view layout (news section) is opened
    
    //gesture state is to check if user performs a gesture and then puts the property back to its initial state when the gesture stops.
    @GestureState private var translation: CGFloat = 0 //this is for the swipe functionality between the watchlist and news bar
    
    //when the news tab is open, it will remove a portion of the homescreen for the news view
    private var offsetView: CGFloat {
        isNewsTabOpen ? 0 : maxHeight - minHeight
    }
    
    
    //a view that can drag and drop when news tab is in use/open
    private var indicatorView: some View {
        RoundedRectangle (cornerRadius: Constants.radius)
            .fill(Color.white.opacity(0.4))
            .frame(width: Constants.indexWidth, height: Constants.indexHeight)
            .onTapGesture {
                isNewsTabOpen.toggle()
            }
            
    }
    
    //init- sets an initial value for each stored property on that instance
    //init- performs any other setup that is required
    init (isNewsTabOpen: Binding <Bool>, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        
        //self reference to the current object/instance
        self.content = content()
        self.maxHeight = maxHeight
        self.minHeight = maxHeight * Constants.minRatioHeight
        self._isNewsTabOpen = isNewsTabOpen
    }
    
    
    
    
    var body: some View {
        
        //reads the width and height of the available space of the homescreen app
        GeometryReader { geo in
            //Vertical Stack view
            VStack (spacing: 0) {
                self.indicatorView.padding() //calls the indicatorView view (created above) into a vertical stack
                self.content
            }
            .frame(width: geo.size.width, height: self.maxHeight, alignment: .top)
            
            //zstack- overlapping or overlaying content/view
            .background(ZStack {
                Color.white
                Color.black.opacity(0.6)
            })
            
            //spring snap affect when the news tab is pulled up or down. Either make the tab expand upwards or collapse down
            .cornerRadius(Constants.radius)
            .frame(height: geo.size.height, alignment: .bottom)
            .offset(y: max(self.offsetView + self.translation, 0))
            .animation(.interactiveSpring())
            
            .gesture(DragGesture().updating(self.$translation, body: { (value, state, _) in
                state = value.translation.height
            }) .onEnded({ (value) in
                let swipeDistance = self.maxHeight * Constants.swipeRatio
                
                guard abs(value.translation.height) > swipeDistance
                else {
                    return
                }
                self.isNewsTabOpen = value.translation.height < 0
            }))
            
        }
    }
}

