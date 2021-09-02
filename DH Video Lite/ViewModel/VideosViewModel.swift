//
//  VideosViewModel.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import UIKit

protocol VideosViewModelDelegate: AnyObject {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

class VideosViewModel {
    private weak var delegate: VideosViewModelDelegate?
    
    private var videosList: [NewestDatum] = []
    private var newVideos: [NewestDatum] = []
    
    private var NM = NetworkManager()
    private var pageIndex = 0
    private var pageSize = 20
    private var fetchInProgress = false
    
    var numberOfVideos: Int {
        return videosList.count
    }
    
    init(delegate: VideosViewModelDelegate) {
        self.delegate = delegate
    }
}

extension VideosViewModel {
    func getVideos() {
        guard fetchInProgress == false else {
            return
        }
        fetchInProgress = true
        
        NM.fetchVideos(pageIndex, pageSize) { videosData, videosError in
            self.fetchInProgress = false
            
            if let safeData = videosData?.data?.newest?.data {
                self.pageIndex += 1
                self.newVideos = safeData
                self.videosList.append(contentsOf: safeData)
                if self.pageIndex > 0 {
                  let indexPathsToReload = self.calculateIndexPathsToReload(from: safeData)
                  self.delegate?.onFetchCompleted(with: indexPathsToReload)
                } else {
                  self.delegate?.onFetchCompleted(with: .none)
                }
                
            } else {
                print(videosError?.localizedDescription as Any)
            }
        }
    }
    
    func getVideoViewModel(_ indexPath: IndexPath) -> VideoDetailsViewModel {
        return VideoDetailsViewModel(videoDetails: videosList[indexPath.row])
    }
    
    private func calculateIndexPathsToReload(from newVideos: [NewestDatum]) -> [IndexPath] {
        let startIndex = videosList.count - pageSize
        let endIndex = startIndex + pageSize
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}

