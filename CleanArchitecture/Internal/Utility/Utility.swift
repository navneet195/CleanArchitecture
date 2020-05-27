//
//  Utility.swift
//  CleanArchitecture
//
//  Created by Navneet on 15/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation
import AlamofireImage

open class Utility {
    
    static let HomeimageDownloader = ImageDownloader(
          configuration: ImageDownloader.defaultURLSessionConfiguration(),
          downloadPrioritization: .fifo,
          maximumActiveDownloads: 1,
          imageCache: AutoPurgingImageCache()
      )
      static func verifyUrl (urlString: String?) -> Bool {
            //Check for nil
            if let urlString = urlString {
                // create NSURL instance
                if let url = NSURL(string: urlString) {
                    // check if your application can open the NSURL instance
                    return UIApplication.shared.canOpenURL(url as URL)
                }
            }
            return false
        }

}
