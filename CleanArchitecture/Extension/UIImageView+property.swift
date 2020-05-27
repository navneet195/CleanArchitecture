//
//  UIImageView+property.swift
//  Docplexus
//
//  Created by Rushikesh Talokar on 08/11/16.
//  Copyright © 2016 Docplexus. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage
import Alamofire

extension UIImageView{
    
    static let imageDownloader = ImageDownloader(
        configuration: ImageDownloader.defaultURLSessionConfiguration(),
        downloadPrioritization: .fifo,
        maximumActiveDownloads: 1,
        imageCache: AutoPurgingImageCache()
    )
    func makeBlurImage(targetImageView:UIImageView?, frame : CGRect)
    {

    }
    
    func loadCircularImageWithDummy(){

        image = UIImage(named: "avatar")
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }
 
    func loadImageWith(url : String){
        
        var imageURL = url
        image = nil
        
        imageURL = imageURL.replacingOccurrences(of: " ", with: "%20")
        
        if(imageURL.count > 0){
            
            if(verifyUrl(urlString: imageURL)) {
                if let urlRequest = URL(string: imageURL){
                    self.af_setImage(withURL: urlRequest)
                }
            }
        }
    }
   
    func loadImageWith(url : String, placeHolder :String ){
        
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        var imageURL = url
        image = UIImage(named: placeHolder )
        
        imageURL = imageURL.replacingOccurrences(of: " ", with: "%20")
        
        if(imageURL.count > 0){
            
            if(verifyUrl(urlString: imageURL)) {
                
                if let urlRequest = URL(string: imageURL){
                    self.af_setImage(withURL: urlRequest, placeholderImage: UIImage(named: placeHolder))
                }
            }
        }
        
    }
    
    
    
    func loadImageWithTransperetBackground(url : String, placeHolder :String ){
        
  
        var imageURL = url
        image = UIImage(named: placeHolder )
        
        imageURL = imageURL.replacingOccurrences(of: " ", with: "%20")
        
        if(imageURL.count > 0){
            
            if(verifyUrl(urlString: imageURL)) {
                
                if let urlRequest = URL(string: imageURL){
                    self.af_setImage(withURL: urlRequest, placeholderImage: UIImage(named: placeHolder))
                }
            }
        }
        
    }
    func verifyUrl (urlString: String?) -> Bool {
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
    func loadImagewithImageAspect(url: String,holderImage: String,completion: @escaping (_ aspectRatio : CGFloat,_ image : UIImage) -> ()) {
        
        let logoUrl =  url.replacingOccurrences(of: " ", with: "%20")
        
        if(Utility.verifyUrl(urlString: logoUrl) == true ){
            
            
            let urlRequest = URLRequest(url: URL(string: logoUrl)!)
            Utility.HomeimageDownloader.download(urlRequest) { response in
                
                if case .success(let image) = response.result {
                    
                    
                    
                    var apect : CGFloat = 0
                    
                    let width = CGFloat(image.size.width)
                    let height = CGFloat(image.size.height)
                    let apect_local =   height / width
                    apect = apect_local
                    completion(apect, image)
                    
                }
                    
                else {
                    if holderImage.count > 0 {
                        
                        self.image = UIImage(named: holderImage)
                        if let image = self.image {
                            let width = CGFloat(image.size.width)
                            let height = CGFloat(image.size.height)
                            let apect_local =   height / width
                            completion(apect_local,image)
                        }
                    }
                }
            }
        }
    }
    func loadImage(downloader : ImageDownloader,imageView: UIImageView,imageURL: String,placeholder: String){
        let urlRequest = URLRequest(url: URL(string: imageURL)!)
        if let placeHolderImage = UIImage(named: placeholder){
            imageView.image = placeHolderImage
        }
        Utility.HomeimageDownloader.download(urlRequest) { response in
            
            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                imageView.image = image
            }
            
        }
    }
    static func invalidateImageCatch(){
        AutoPurgingImageCache().removeAllImages()
    }
}
