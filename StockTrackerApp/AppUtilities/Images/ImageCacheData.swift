//
//  ImageCacheData.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

import UIKit //gets the standard UIcomponents for iOS app development

//protocol is used for designing a blueprint for methods, properties, or other requirements
protocol ImageCacheData {
    
    //subscript allows me to access elements in a query/list/array like structure
    subscript (_ url: URL) -> UIImage? { get set } //declaring a setter and getter for the image url - (optional because some article(s) may have no image)
}

struct temporaryImageCacheData: ImageCacheData {
    //class NSCache<KeyType, ObjectType> : NSObject where KeyType : AnyObject, ObjectType: AnyObject
    private let cache: NSCache <NSURL, UIImage> = { //NSCache is an object used to store temporary objects
        let cache = NSCache <NSURL, UIImage>() //takes in a key type of NSURL and the object type is UIImage object
        cache.countLimit = 100 //cache is limited to 100 items
        cache.totalCostLimit = 1024 * 1024 * 100 //limit the size of the cache for the total cost
        return cache
    }()
    
    subscript(_ key: URL) -> UIImage? { //UIImage? means optional
        
        //get the object of cache if the url exists
        get { cache.object(forKey: key as NSURL) }
        
        //if the object of cache does not have an existing url, remove any previous object and then set it
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    
    }
}
