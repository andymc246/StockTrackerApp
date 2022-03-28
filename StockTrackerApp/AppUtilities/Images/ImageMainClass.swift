//
//  ImageMainClass.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

//credited to this website for help
//https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

import SwiftUI

struct ImageMainClass <PlaceHolderView: View>: View {
    
    //pulls methods and attributes from ImageGetter class
    @StateObject private var loader: ImageGetter
    
    private let placeholder: PlaceHolderView
    private let image: (UIImage) -> Image //returns an image
    
    private var content: some View {
        Group {
            
            if loader.image != nil {
                image (loader.image!)
            }
            
            else {
                placeholder
            }
        }
    }
    
    
    init(url: URL, @ViewBuilder placeholder: () -> PlaceHolderView, @ViewBuilder image: @escaping (UIImage) -> Image = Image.init (uiImage:)) {
            self.placeholder = placeholder()
            self.image = image
            _loader = StateObject(wrappedValue: ImageGetter(url: url, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
}
