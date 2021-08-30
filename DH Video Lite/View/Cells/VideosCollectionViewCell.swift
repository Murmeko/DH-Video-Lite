//
//  VideosCollectionViewCell.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 30.08.2021.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var videosImageView: UIImageView!
    @IBOutlet weak var videosTitleLabel: UILabel!
    @IBOutlet weak var videosPlayLabel: UILabel!
    @IBOutlet weak var videosDurationLabel: UILabel!
    @IBOutlet weak var videosContainerView: UIView!
    @IBOutlet weak var videosTitleLabelContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 5
        videosPlayLabel.textColor = .white
        videosDurationLabel.textColor = .white
        videosDurationLabel.layer.cornerRadius = 5
        videosDurationLabel.layer.masksToBounds = true
    }

}
