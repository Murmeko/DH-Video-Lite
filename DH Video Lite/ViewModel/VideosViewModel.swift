//
//  VideosViewModel.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import UIKit

class VideosViewModel {
    var videosList: [NewestDatum] = []
    var videoImages: [UIImage] = []
    var videoImageUrls: [URL] = []
    
    var NM = NetworkManager()
    
    var reloadData: (()->())?
    
    init() {
        getVideos(pageIndex: 0, pageSize: 20)
    }
}

extension VideosViewModel {
    func getVideos(pageIndex: Int, pageSize: Int) {
        NM.fetchVideos(pageIndex, pageSize) { videosData, videosError in
            if let safeData = videosData {
                let videosGroup = DispatchGroup()
                let videoDetails = safeData.data?.newest?.data
                
                for videoDetail in videoDetails! {
                    videosGroup.enter()
                    self.videosList.append(videoDetail)
                    let url = URL(string: (videoDetail.imageUrl?.value)!)!
                    self.videoImageUrls.append(url)
                    videosGroup.leave()
                }
                videosGroup.notify(queue: .main) {
                    self.getVideoImages(self.videoImageUrls)
                }
            } else {
                print(videosError?.localizedDescription as Any)
            }
        }
    }
    
    func getVideoImages(_ videoImageUrls: [URL]) {
        NM.fetchVideoImages(imageUrls: videoImageUrls) { imagesData, imagesError in
            if let safeData = imagesData {
                for image in safeData {
                    self.videoImages.append(image)
                    
                }
                self.reloadData!()
            } else {
                print(imagesError?.localizedDescription as Any)
            }
        }
    }
    
    func numberOfVideos() -> Int {
        return videosList.count
    }
    
    func getVideoViewModel(_ indexPath: IndexPath) -> VideoDetailsViewModel {
        let videoDetails = videosList[indexPath.row]
        return VideoDetailsViewModel(videoImage: videoImages[indexPath.row], videoDetails: videoDetails)
    }
}

