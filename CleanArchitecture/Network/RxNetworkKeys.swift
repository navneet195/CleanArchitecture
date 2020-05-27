
//
//  RxNetworkKeys.swift
//  CleanArchitecture
//
//  Created by Navneet on 14/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//
import Foundation

/// different network keys
struct RxNetworkKeys
{
    private var appConfig: DomainAppConfiguration

    private(set) var baseURL: String

    init(config: DomainAppConfiguration)
    {
        appConfig = config
        // set base url
        switch config
        {
        case .dev:
            baseURL = "https://dev.api.docplexus.com"
        case .qa:
            baseURL = "https://qa.api.docplexus.com"
        case .uat:
            baseURL = "https://uat.api.docplexus.com"
        case .prod:
            baseURL = "https://api.docplexus.com"
        }
    }
}


