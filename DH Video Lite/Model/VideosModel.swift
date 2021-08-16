//
//  VideosModel.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videosModel = try? newJSONDecoder().decode(VideosModel.self, from: jsonData)

import Foundation

// MARK: - VideosModel
struct VideosModel: Codable {
    let hasError: Bool
    let message: String
    let unixTime: Int
    let server: String
    let data: DataClass
    let hashErrorCode: Int

    enum CodingKeys: String, CodingKey {
        case hasError = "HasError"
        case message = "Message"
        case unixTime = "UnixTime"
        case server = "Server"
        case data = "Data"
        case hashErrorCode = "HashErrorCode"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let popular, newest: Newest
    let popularCategories: [Newest]

    enum CodingKeys: String, CodingKey {
        case popular = "Popular"
        case newest = "Newest"
        case popularCategories = "PopularCategories"
    }
}

// MARK: - Newest
struct Newest: Codable {
    let name: String
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case data = "Data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let datumHasSurvey: Bool
    let colorAvarage: String?
    let textColor: TextColor?
    let subTextColor: SubTextColor?
    let editorColor: EditorColor?
    let awards: [NImage]?
    let surveyID, editorsChooseMessageID: Int
    let videos: [Video]
    let gameID: Int
    let icon, categoriURL, newsURL, title: String
    let award, image2, content, sourceURL: String
    let shortContent: String
    let hasGallery: Bool
    let galleryID, id, videoID, forumID: Int
    let threadID, createdBy, readCount, totalreply: Int
    let category: Category
    let hasSurvey: Bool
    let shortURL: Int
    let createDateWellFormed: String
    let createDate: Int
    let contentList: [ContentList]
    let member: Member
    let videoURL: String
    let type: Int
    let duration: String?
    let onlineMember, onlineGuest, onlineMobileMember, onlineMobileGuest: Int
    let isFollow: Int
    let nImage, smallImage: NImage
    let isLocked, followCount: Int

    enum CodingKeys: String, CodingKey {
        case datumHasSurvey = "hasSurvey"
        case colorAvarage = "ColorAvarage"
        case textColor = "TextColor"
        case subTextColor = "SubTextColor"
        case editorColor = "EditorColor"
        case awards = "Awards"
        case surveyID = "SurveyId"
        case editorsChooseMessageID = "EditorsChooseMessageId"
        case videos = "Videos"
        case gameID = "GameId"
        case icon = "Icon"
        case categoriURL = "CategoriUrl"
        case newsURL = "NewsUrl"
        case title = "Title"
        case award = "Award"
        case image2 = "Image2"
        case content = "Content"
        case sourceURL = "SourceUrl"
        case shortContent = "ShortContent"
        case hasGallery = "HasGallery"
        case galleryID = "GalleryId"
        case id = "Id"
        case videoID = "VideoId"
        case forumID = "ForumId"
        case threadID = "ThreadId"
        case createdBy = "CreatedBy"
        case readCount = "ReadCount"
        case totalreply = "Totalreply"
        case category = "Category"
        case hasSurvey = "HasSurvey"
        case shortURL = "ShortUrl"
        case createDateWellFormed = "CreateDateWellFormed"
        case createDate = "CreateDate"
        case contentList = "ContentList"
        case member = "Member"
        case videoURL = "VideoUrl"
        case type = "Type"
        case duration = "Duration"
        case onlineMember = "OnlineMember"
        case onlineGuest = "OnlineGuest"
        case onlineMobileMember = "OnlineMobileMember"
        case onlineMobileGuest = "OnlineMobileGuest"
        case isFollow = "IsFollow"
        case nImage = "NImage"
        case smallImage = "SmallImage"
        case isLocked = "IsLocked"
        case followCount = "FollowCount"
    }
}

// MARK: - NImage
struct NImage: Codable {
    let width, height: Int
    let value: String
    let base64, colorAvarage: String
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case width = "Width"
        case height = "Height"
        case value = "Value"
        case base64 = "Base64"
        case colorAvarage = "ColorAvarage"
        case thumbnail = "Thumbnail"
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let isFollowing, notificationEnable, order, attachID: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case isFollowing = "IsFollowing"
        case notificationEnable = "NotificationEnable"
        case order = "Order"
        case attachID = "AttachId"
    }
}

// MARK: - ContentList
struct ContentList: Codable {
    let scope: String
    let value: Value
    let type: TypeEnum

    enum CodingKeys: String, CodingKey {
        case scope = "Scope"
        case value = "Value"
        case type = "Type"
    }
}

enum TypeEnum: String, Codable {
    case img = "img"
    case line = "line"
    case link = "link"
    case list = "list"
    case text = "text"
    case video = "video"
}

enum Value: Codable {
    case nImage(NImage)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(NImage.self) {
            self = .nImage(x)
            return
        }
        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .nImage(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum EditorColor: String, Codable {
    case dce2De = "#DCE2DE"
    case the001C39 = "#001C39"
}

// MARK: - Member
struct Member: Codable {
    let tagID, mem: Int
    let login: Login
    let avatar: String
    let rankTitle: RankTitle
    let nameSurname: NameSurname
    let avatarColor: AvatarColor?
    let avatarOrSigpicture: Bool
    let sigPicture: String

    enum CodingKeys: String, CodingKey {
        case tagID = "TagId"
        case mem = "Mem"
        case login = "Login"
        case avatar = "Avatar"
        case rankTitle = "RankTitle"
        case nameSurname = "NameSurname"
        case avatarColor = "AvatarColor"
        case avatarOrSigpicture = "AvatarOrSigpicture"
        case sigPicture = "SigPicture"
    }
}

enum AvatarColor: String, Codable {
    case d8B6D2 = "#D8B6D2"
    case the000000 = "#000000"
    case the0F44C4 = "#0F44C4"
    case the163Cd4 = "#163CD4"
    case the1Fc75E = "#1FC75E"
    case the359E21 = "#359E21"
    case the423F4D = "#423F4D"
    case the7F0417 = "#7F0417"
}

enum Login: String, Codable {
    case berkanSezerBerkans = "berkan-sezer-berkans"
    case burakSolt = "burak-solt"
    case empty = ""
    case enesDegirmenci = "enes-degirmenci"
    case erdiOzuagFx57 = "erdi-ozuag-fx57"
    case mesutCevikSpeedStep = "mesut-cevik-speed-step"
    case onurhan61 = "onurhan61"
    case tunahan = "tunahan"
}

enum NameSurname: String, Codable {
    case advertorialAdvertorial = "Advertorial Advertorial"
    case berkanSezer = "Berkan Sezer"
    case burakŞolt = "Burak Şolt"
    case empty = ""
    case enesDeğirmenci = "Enes Değirmenci"
    case erdiÖzüağ = "Erdi Özüağ"
    case mesutÇevik = "Mesut Çevik"
    case onurhanKeskin = "Onurhan Keskin"
    case tunahanSaftır = "Tunahan Saftır"
}

enum RankTitle: String, Codable {
    case advertorial = "Advertorial"
    case editör = "Editör"
    case empty = ""
    case genelYayınYönetmeni = "Genel Yayın Yönetmeni"
    case i̇ncelemeTestVeAnalizEditörü = "İnceleme, Test ve Analiz Editörü"
    case videoEditörü = "Video Editörü"
}

enum SubTextColor: String, Codable {
    case f1F1F1 = "#f1f1f1"
    case the333333 = "#333333"
}

enum TextColor: String, Codable {
    case ffffff = "#ffffff"
    case the333333 = "#333333"
}

// MARK: - Video
struct Video: Codable {
    let value: String
    let size: Int

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case size = "Size"
    }
}
