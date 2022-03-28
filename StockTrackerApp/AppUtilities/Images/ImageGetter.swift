//
//  ImageGetter.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

//credited to this website for help
//https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

import UIKit //gets the standard UIcomponents for iOS app development
import Combine //a framework that allows values to be transferred over time; asynchronous events 

final class ImageGetter: ObservableObject {
    
    @Published var image: UIImage? //allow the use of images across classes
    
    private(set) var loading = false //set variable that checks that the image is in loading state/progress
    private var cache: ImageCacheData?
    private let url: URL
    private var cancellable: AnyCancellable? //any cancellable actions on getting the news article (optional)
    
    private static let imageQueue = DispatchQueue (label: "com.macattack.imageQueue")
    
    init (url: URL, cache: ImageCacheData? = nil) {
        self.url = url
        self.cache = cache
    }
    
    //perform immediately before an instance of a class is deallocated
    deinit {
        cancel()
        
    }
    
    
    //loading function
    func load () {
        guard !loading //guard = checks if exists, exit scoop if it doesn't exists
                
        else {
            return
        }
        
        //retrieve image from cache if available
        if let image = cache?[url] {
            self.image = image
            return
        }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage (data: $0.data) }
            .replaceError(with: nil)
            .handleEvents (
                receiveSubscription: { [weak self] _ in self?.onStart() },
                receiveOutput: { [weak self] in self?.cache($0) },
                receiveCompletion: { [weak self] _ in self?.onFinished() },
                receiveCancel: { [weak self] in self?.onFinished() })
            .subscribe(on: Self.imageQueue)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0}
                
    }

    //cache function that puts the default image if the cache of the url provides one
    private func cache (_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
    
    //start function
    func onStart() {
        loading = true
    }
    
    
    //finished function
    func onFinished() {
        loading = false
    }
    
    
    //cancel function
    func cancel() {
        cancellable?.cancel()
    }
}
