//
//  VideosTableViewCell.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 30.08.2021.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    @IBOutlet weak var videosImageViewContainer: UIView!
    @IBOutlet weak var videosTitleLabelContainer: UIView!
    @IBOutlet weak var videosImageView: UIImageView!
    @IBOutlet weak var videosTitleLabel: UILabel!
    @IBOutlet weak var videosPlayLabel: UILabel!
    @IBOutlet weak var videosDurationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 5
        contentView.layer.masksToBounds = false
        contentView.layer.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        videosPlayLabel.textColor = .white
        videosDurationLabel.textColor = .white
        videosDurationLabel.layer.cornerRadius = 5
        videosDurationLabel.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
