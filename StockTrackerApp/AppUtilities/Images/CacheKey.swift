//
//  CacheKey.swift
//  StockTrackerApp
//
//  Created by Andy Mac on 2/22/22.
//

import SwiftUI

struct CacheKey: EnvironmentKey  {
    static let defaultValue: ImageCacheData = temporaryImageCacheData()
}

extension EnvironmentValues {
    var imageCache: ImageCacheData {
        get { self[CacheKey.self] }
        set { self[CacheKey.self] = newValue }
    }
}
