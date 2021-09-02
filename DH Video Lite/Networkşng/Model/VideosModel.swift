//
//  VideosModel.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import Foundation

// MARK: - VideosModel
struct VideosModel: Codable {
    let hasError: Bool?
    let data: DataClass?

    enum CodingKeys: String, CodingKey {
        case hasError = "HasError"
        case data = "Data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let newest: Newest?

    enum CodingKeys: String, CodingKey {
        case newest = "Newest"
    }
}

// MARK: - Newest
struct Newest: Codable {
    let data: [NewestDatum]?

    enum CodingKeys: String, CodingKey {
        case data = "Data"
    }
}

// MARK: - NewestDatum
struct NewestDatum: Codable {
    let id: Int?
    let title: String?
    let imageUrl: ImageUrl?
    let duration: String?
    let colorAvarage: String?
    let textColor: String?
    let subTextColor: String?
    let videos: [Video]?
    let shortContent: String?
    let category: Category?
    let createDateWellFormed: String?
    let readCount: Int?
    let onlineMember: Int?
    let onlineGuest: Int?
    let onlineMobileMember: Int?
    let onlineMobileGuest: Int?
    let totalreply: Int?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case imageUrl = "NImage"
        case duration = "Duration"
        case colorAvarage = "ColorAvarage"
        case textColor = "TextColor"
        case subTextColor = "SubTextColor"
        case videos = "Videos"
        case shortContent = "ShortContent"
        case category = "Category"
        case createDateWellFormed = "CreateDateWellFormed"
        case readCount = "ReadCount"
        case onlineMember = "OnlineMember"
        case onlineGuest = "OnlineGuest"
        case onlineMobileMember = "OnlineMobileMember"
        case onlineMobileGuest = "OnlineMobileGuest"
        case totalreply = "Totalreply"
    }
}

// MARK: - ImageUrl
struct ImageUrl: Codable {
    let value: String?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}

// MARK: - Video
struct Video: Codable {
    let value: String?
    let size: Int?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case size = "Size"
    }
}
