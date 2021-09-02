//
//  Constants.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import UIKit

struct K {
    static let dhColor = UIColor(red: 235/255, green: 150/255, blue: 90/255, alpha: 1)
    
    static let videosCollectionViewCellIdentifier = "ReuseableVideosCollectionViewCell"
    static let videoDetailsHeaderTableViewCellIdentifier = "ReuseableVideoDetailsHeaderTableViewCell"
    static let videoDetailsContextTableViewCellIdentifier = "ReuseableVideoDetailsContextTableViewCell"
    
    static let videosCollectionViewCellNibName = "VideosCollectionViewCell"
    static let videoDetailsHeaderTableViewCellNibName = "VideoDetailsHeaderTableViewCell"
    static let videoDetailsContextTableViewCellNibName = "VideoDetailsContextTableViewCell"
    
    static let videosToVideoDetailsSegue = "videosToVideoDetails"
}
