//
//  DoctorAlsoTC.swift
//  Docplexus
//
//  Created by Rushikesh Talokar on 14/07/16.
//  Copyright © 2016 Docplexus. All rights reserved.
//

import UIKit
import AVKit
import Kingfisher

protocol FirstPostCellHeightDelegate{
    func firstPostCellHeight()
}
class FirstPostCell: UITableViewCell {
    
    @IBOutlet weak var viewsImages: UIImageView!
    @IBOutlet weak var votesImages: UIImageView!
    @IBOutlet weak var commentsImages: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var EngageView: UIView!
    @IBOutlet weak var ConstraintHeightEngageView: NSLayoutConstraint!
    
    @IBOutlet weak var titleHeightConstant: NSLayoutConstraint!
    static let cellReuseIdentifier = "FirstPostCell"
    static var tableviewCellHight : CGFloat = 300.0
    var delegate: FirstPostCellHeightDelegate?
    
    private var post: TPostModel?
    var isUpdateDone = false
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var userImageVIew: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var commentCountLable: UILabel!
    @IBOutlet weak var viewCountLable: UILabel!
    @IBOutlet weak var likeCountLable: UILabel!
    @IBOutlet weak var attachmentContainerHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var banerImageView: UIImageView!
    @IBOutlet weak var postStatictsStackView: UIStackView!
    private let player = AVQueuePlayer()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // Navneet
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func loadPost(post: TPostModel,tableView : UITableView,impression : String){
        self.post = post
        
        // update user info values
        
        
        
        // user
        if let user = self.post?.user {
            userName.text = user.authorName
        }
        if let title = self.post?.title{
            
            if title == ""
            {
                titleHeightConstant.constant = 0
            }
            
            titleLable.text = title
        }
        titleLable.sizeToFit()
        titleLable.layoutIfNeeded()

        if let description = self.post?.shortBodyText{
                   descriptionLabel.text = description
               }
               descriptionLabel.sizeToFit()
               descriptionLabel.layoutIfNeeded()
    
        
        // post
   
        
       
        
        if let featuredAttachmentUrl = post.featuredAttachmentURL, featuredAttachmentUrl.count > 0 {

//            banerImageView.loadImagewithImageAspect(url: featuredAttachmentUrl, holderImage: Constants.Path.documentPlaceHolder) { (aspectRatio, image) in
//
                self.banerImageView.kf.indicatorType = .activity
                self.banerImageView.kf.setImage(with: URL(string: (featuredAttachmentUrl)), placeholder: UIImage (named: Constants.Path.documentPlaceHolder))
                
                self.attachmentContainerHeightConstrain.constant = 209 // tableView.bounds.size.width - 16
                tableView.beginUpdates()
                tableView.endUpdates()
//
//
//            }
        }
        else {
            self.attachmentContainerHeightConstrain.constant = 0
            tableView.beginUpdates()
            tableView.endUpdates()
            
            //banerImageView.image = UIImage(named: Constants.Path.documentPlaceHolder)
        }
        

//        if post.user.thumbnailURL.isNotEmpty {
//            userImageVIew.loadImageWith(url: post.user.thumbnailURL, placeHolder: "avatar")
//        }
//        else {
//            userImageVIew.image = UIImage(named: "placeholderUser")
//        }
   
        if let reachCount = self.post?.viewCount {
            viewCountLable.text = "\(Int(reachCount))" 
            
            viewCountLable.isHidden = false
            if (Int(reachCount) == 0)
            {
                viewCountLable.isHidden = true
                
            }
            
        }
        if let answerCount = self.post?.answerCount {
            commentCountLable.text = "\(Int(answerCount))"
            commentCountLable.isHidden = false
            if (Int(answerCount) == 0)
            {
                commentCountLable.isHidden = true
                
            }
        }
        if let voteCount = self.post?.voteCount {
            likeCountLable.text = "\(Int(voteCount))"
            
            likeCountLable.isHidden = false
            if (Int(voteCount) == 0)
            {
                likeCountLable.isHidden = true
                
            }
        }
    }
}


