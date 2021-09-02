//
//  VideoDetailsViewModel.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 31.08.2021.
//

import UIKit

struct VideoDetailsViewModel {
    var videoDetails: NewestDatum
}

extension VideoDetailsViewModel {
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
    var imageUrl: String {
        return (self.videoDetails.imageUrl?.value)!
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
