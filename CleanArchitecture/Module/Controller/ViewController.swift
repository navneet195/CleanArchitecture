//
//  ViewController.swift
//  CleanArchitecture
//
//  Created by Navneet on 15/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewPosts: UITableView!

       private var postService = PostNetworkService(appStore: appDelegate().store)

       private var posts = TPostModelList()

       private var heghtCache: [Int: CGFloat] = [:]
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }


}

extension ViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        getPost()
       
        
        tableViewPosts.register(UINib(nibName: FirstPostCell.cellReuseIdentifier, bundle: nil), forCellReuseIdentifier: FirstPostCell.cellReuseIdentifier)
        
        tableViewPosts.separatorStyle = .none
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableViewPosts.frame = self.view.bounds
    }
}

extension ViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int)
        -> Int
    {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {

         let cell = tableView.dequeueReusableCell(withIdentifier: "FirstPostCell", for: indexPath) as! FirstPostCell
        
        let cellModel = posts[indexPath.row]
        cell.delegate = self
        cell.loadPost(post: cellModel,tableView : tableView , impression: "")
    
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath)
        -> CGFloat
    {
       return UITableView.automaticDimension
    }
}

extension ViewController : FirstPostCellHeightDelegate
{
    /// get height for cell
    ///
    /// - Parameters:
    ///   - idxPath: idxPath
    ///   - post: index vise post
    ///   - view: tableview
    /// - Returns: set height for cell
    func firstPostCellHeight() {
      //  tableViewWillFinishLoading(tableViewPosts)
    }
    func tableViewWillFinishLoading(_ tableView : UITableView){
        
        tableView.layoutSubviews()
        tableView.layoutIfNeeded()
        
//        var totalViewHeight : CGFloat  = tableView.contentSize.height+tableView.contentInset.bottom+tableView.contentInset.top
//        
//        self.titleLable.sizeToFit()
//        self.titleLable.layoutIfNeeded()
//        //        if titleLable.text != Constants.String.lates_postsk {
//        
//        
//        //        }
//        
//        self.tableHeightContrain.constant = totalViewHeight
//        if self.titleLable.isHidden == false {
//            totalViewHeight  = totalViewHeight + self.titleLable.frame.height + CGFloat( 8 + 8 )
//        }
//        if self.viewMoreButton.isHidden == false {
//            totalViewHeight  = totalViewHeight + self.viewMoreButton.frame.height + CGFloat( 8 + 22 + 5 + 8 )
//        }else{
//            totalViewHeight  = totalViewHeight + CGFloat( 22 )
//        }
//        
//        self.resizeToFitwith(containerView: self.views, bottomPadding: Constants.Dimen.paddingZero)
//        self.frame = CGRect(x: 0, y: 0,width: self.views.frame.size.width,height: totalViewHeight )
//        
//        self.clipsToBounds = true
//        self.viewMoreButton.sizeToFit()
//        self.viewMoreButton.layoutIfNeeded()
//        
//        self.superview?.setHeightContrainwith(height:totalViewHeight)
        
    }
}

private extension ViewController
{
    /// service call for post data
    func getPost()
    {
        let task = postService.getPostsTask { (object, response, error) in
            guard error == nil else { return }
            guard let a = object else { return }
            self.posts.removeAll()
            self.posts = a
            DispatchQueue.main.async {
                self.tableViewPosts.reloadData()
            }
        }
        task.resume()
    }
}

extension ViewController: PostDelegate
{
    /// for upvote tap
    ///
    /// - Parameter post: to check for cell post
    func voteTapped(for post: TPostModel)
    {
        print("user upvoted post")
    }


    /// for comment tap
    ///
    /// - Parameter post: to check for cell post
    func commentTapped(for post: TPostModel)
    {
        print("user wants to comment")
    }
}
/// Post delegate methods for passing user interaction
protocol PostDelegate: class {
    func voteTapped(for post: TPostModel)
    func commentTapped(for post: TPostModel)
}


