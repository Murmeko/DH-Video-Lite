//
//  videoDetailsHeaderTableViewCell.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 31.08.2021.
//

import UIKit

class VideoDetailsHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var videoDetailsHeaderTitleContainer: UIView!
    @IBOutlet weak var videoDetailsHeaderTitleLabel: UILabel!
    @IBOutlet weak var videoDetailsHeaderCategoryLabel: UILabel!
    @IBOutlet weak var videoDetailsHeaderCategoryLabelContainer: UIView!
    @IBOutlet weak var videoDetailsHeaderDateOfCreationLabel: UILabel!
    @IBOutlet weak var videoDetailsHeaderTimesReadLabel: UILabel!
    @IBOutlet weak var videoDetailsHeaderCurrentReadersCountLabel: UILabel!
    @IBOutlet weak var videoDetailsHeaderCommentCountLabel: UILabel!
    @IBOutlet weak var videoDetailsHeaderShortContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        videoDetailsHeaderCategoryLabelContainer.layer.masksToBounds = true
        videoDetailsHeaderCategoryLabelContainer.layer.cornerRadius = 5
    }
}
