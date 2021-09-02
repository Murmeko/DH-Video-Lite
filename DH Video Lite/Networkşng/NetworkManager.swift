//
//  NetworkManager.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import Moya
import Kingfisher

enum NetworkManagerError: Error {
    case failedRequest
    case invalidData
}

struct NetworkManager {
    let dhVideosAPIProvider = MoyaProvider<DHVideosAPI>()
    
    typealias VideosDataCompletion = (VideosModel?, NetworkManagerError?) -> ()
    
    func fetchVideos(_ pageIndex: Int, _ pageSize: Int, completion: @escaping VideosDataCompletion) {
        dhVideosAPIProvider.request(.getVideos(pageIndex, pageSize)) { requestResult in
            switch requestResult {
            case let .success(data):
                do {
                    let filteredData = try data.filterSuccessfulStatusCodes()
                    let videosData = try filteredData.map(VideosModel.self)
                    completion(videosData, nil)
                }
                catch let error {
                    print("Unable to decode DHVideosAPI response: \(error.localizedDescription)")
                    completion(nil, .invalidData)
                    return
                }
            case let .failure(error):
                print("Failed request from DHVideosAPI: \(error.localizedDescription)")
                completion(nil, .failedRequest)
                return
            }
        }
    }
}
