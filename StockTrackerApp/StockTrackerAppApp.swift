//
//  StockTrackerAppApp.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 1/29/22.
//

import SwiftUI
import Firebase //importing firebase into my swift project

@main
struct StockTrackerAppApp: App {
    
    @State var stocks = ["",""]
    
    //managed interaction with the app system
    @UIApplicationDelegateAdaptor (AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppLayoutModel()
            
            LoginScreen()
                .environmentObject(viewModel)
            
            //TopViewLayout(stocks: $stocks)
           //     .environmentObject(viewModel)
            
           // if viewModel.signedIn {
               // ContentView()
            //}
                            
        }
    }
}

//UIApplicationDelegate is a protocol that notifis user about events such as app launch, app goes into background or foreground
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        return true
        
    }
}
