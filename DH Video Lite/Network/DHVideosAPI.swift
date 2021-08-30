//
//  DHVideosAPI.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import Moya

public enum DHVideosAPI {
    case getVideos(_ pageIndex: Int, _ pageSize: Int)
}

extension DHVideosAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.donanimhaber.com/dev/and/api")!
    }
    
    public var path: String {
        switch self {
        case .getVideos(_, _):
            return "/videos"
        }
    }
    
    public var method: Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getVideos(let pageIndex, let pageSize):
            return .requestParameters(parameters: ["pageIndex" : "\(pageIndex)", "pageSize" : "\(pageSize)"], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
