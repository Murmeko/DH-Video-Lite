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
    
    var reloadTableView: (()->())?
    
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
                self.reloadTableView!()
            } else {
                print(imagesError?.localizedDescription as Any)
            }
        }
    }
    
    func numberOfVideos() -> Int {
        return videosList.count
    }
    
    func getVideoViewModel(_ indexPath: IndexPath) -> VideoViewModel {
        let videoDetails = videosList[indexPath.row]
        return VideoViewModel(videoImage: videoImages[indexPath.row], videoDetails: videoDetails)
    }
}

struct VideoViewModel {
    var videoImage: UIImage
    var videoDetails: NewestDatum
}

extension VideoViewModel {
    var mp3Url: String {
        return self.videoDetails.videos![2].value!
    }
    var sdUrl: String {
        return self.videoDetails.videos![3].value!
    }
    var hdUrl: String {
        return self.videoDetails.videos![4].value!
    }
    var fhdUrl: String {
        return self.videoDetails.videos![5].value!
    }
    var image: UIImage {
        return self.videoImage
    }
    var title: String {
        return self.videoDetails.title!
    }
    var duration: String {
        return self.videoDetails.duration!
    }
    var titleTextColor: String {
        return self.videoDetails.textColor!
    }
    var titleBackgroundColor: String {
        return self.videoDetails.colorAvarage!
    }
    var videoCategory: String {
        return (self.videoDetails.category?.name)!
    }
    var videoDateOfCreation: String {
        return self.videoDetails.createDateWellFormed!
    }
    var timesRead: Int {
        return self.videoDetails.readCount!
    }
    var currentReaderCount: Int {
        return ((self.videoDetails.onlineMember)! + (self.videoDetails.onlineGuest)!)
    }
    var commentCount: Int {
        return self.videoDetails.totalreply!
    }
    var shortContent: String {
        return self.videoDetails.shortContent!
    }
}
