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
    }
    
    func configure(with viewModel: VideoDetailsViewModel) {
        videoDetailsHeaderCategoryLabelContainer.layer.masksToBounds = true
        videoDetailsHeaderCategoryLabelContainer.layer.cornerRadius = 5
        
        videoDetailsHeaderTitleContainer.backgroundColor = UIColor(hex: "\(viewModel.titleBackgroundColor)ff")
        videoDetailsHeaderTitleLabel.textColor = UIColor(hex: "\(viewModel.titleTextColor)ff")
        videoDetailsHeaderTitleLabel.text = viewModel.title
        videoDetailsHeaderCategoryLabel.text = viewModel.videoCategory
        videoDetailsHeaderDateOfCreationLabel.textColor = UIColor(hex: "\(viewModel.titleTextColor)ff")
        videoDetailsHeaderDateOfCreationLabel.text = viewModel.videoDateOfCreation
        videoDetailsHeaderTimesReadLabel.text = "\(viewModel.timesRead)"
        videoDetailsHeaderCurrentReadersCountLabel.text = "\(viewModel.currentReaderCount)"
        videoDetailsHeaderCommentCountLabel.text = "\(viewModel.commentCount)"
        videoDetailsHeaderShortContentLabel.text = viewModel.shortContent
    }
}
