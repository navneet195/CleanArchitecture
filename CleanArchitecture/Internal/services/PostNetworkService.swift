
//
//  PostNetworkService.swift
//  CleanArchitecture
//
//  Created by Navneet on 14/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation

typealias UserServiceCompletion = (TPostModelList?, URLResponse?, Error?) -> Void

final class PostNetworkService
{
    private var store : InfoSyncManagerModel

    init(appStore: InfoSyncManagerModel) {
        store = appStore
    }

    /// get data from Json given
    ///
    /// - Parameter completionHandler: gives response or error for post
    /// - Returns: gives URLSessionDataTask
    func getPostsTask(_ completionHandler: @escaping UserServiceCompletion)
        -> URLSessionDataTask
    {
        //let url = URL(string: API.string)
        let url = Bundle.main.url(forResource: "posts", withExtension: "json")
        return store.network.codableTask(with: url!, completionHandler: completionHandler)
    }
}
