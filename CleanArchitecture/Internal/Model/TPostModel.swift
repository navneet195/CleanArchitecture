//
//  TPostModel.swift
//  CleanArchitecture
//
//  Created by Navneet on 14/05/20.
//  Copyright © 2020 Navneet Baldha. All rights reserved.
//

import Foundation
import CoreGraphics

typealias TPostModelList = [TPostModel]

/// model for post
struct TPostModel: Codable {
    let title, uuid: String
    let postType: Int
    let typeName: EnumType
    let featuredAttachmentURL: String?
    let featuredAttachmentWidth, featuredAttachmentHeigth: Int?
    let embedURL: String?
    let creationDate: String
    let answerCount, viewCount, voteCount: Int
    let user: DPUser
    let shortBodyText: String
    let deleted: Bool
    let therapeutics: [DPPostTherapeutic]
    let attachments: [DPPostAttachment]
    let infocenter: String?
    let viewed, voted: Bool

    enum CodingKeys: String, CodingKey {
        case title, uuid, postType, typeName
        case featuredAttachmentURL = "featuredAttachmentUrl"
        case featuredAttachmentWidth, featuredAttachmentHeigth, embedURL, creationDate, answerCount, viewCount, voteCount, user, shortBodyText, deleted, therapeutics, attachments, infocenter, viewed, voted
    }

}

// MARK: - Attachment
struct DPPostAttachment: Codable {
    let url: String
    let uuid, name: String
    let width, height: Int
}

// MARK: - Therapeutic
struct DPPostTherapeutic: Codable {
    let uuid, name: String
}

// MARK: - User
struct DPUser: Codable {
    let thumbnailURL: String
    let firstName, lastName, authorName, uuid: String
    let designation: String?
    let joinedSince: String
    let followed, editor, loggedIn: Bool

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case firstName, lastName, authorName, uuid, designation, joinedSince, followed, editor, loggedIn
    }
}

