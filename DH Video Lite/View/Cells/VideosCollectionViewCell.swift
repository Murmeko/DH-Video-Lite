//
//  VideosCollectionViewCell.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 30.08.2021.
//

import UIKit
import Kingfisher

class VideosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var videosActivityView: UIActivityIndicatorView!
    @IBOutlet weak var videosStackView: UIStackView!
    @IBOutlet weak var videosImageView: UIImageView!
    @IBOutlet weak var videosTitleLabel: UILabel!
    @IBOutlet weak var videosPlayImageView: UIImageView!
    @IBOutlet weak var videosDurationLabel: UILabel!
    @IBOutlet weak var videosContainerView: UIView!
    @IBOutlet weak var videosTitleLabelContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configure(with: .none)
    }
    func configure(with viewModel: VideoDetailsViewModel?) {
        
        layer.cornerRadius = 3
        contentView.layer.cornerRadius = 5
        videosDurationLabel.textColor = .white
        videosDurationLabel.layer.cornerRadius = 5
        videosDurationLabel.layer.masksToBounds = true
        
        if let safeViewModel = viewModel {
            let playConfig = UIImage.SymbolConfiguration.init(pointSize: 15, weight: UIImage.SymbolWeight.regular)
            let playImage = UIImage(named: "play.fill", in: nil, with: playConfig)?.withTintColor(.white, renderingMode: UIImage.RenderingMode.alwaysOriginal)
            videosPlayImageView.image = playImage
            videosImageView.kf.setImage(with: URL(string: safeViewModel.imageUrl))
            videosTitleLabel.text = safeViewModel.title
            videosTitleLabel.textColor = UIColor(hex: "\(safeViewModel.titleTextColor)ff")
            videosDurationLabel.backgroundColor = UIColor(hex: "\(safeViewModel.titleBackgroundColor)ff")
            videosTitleLabelContainerView.backgroundColor = UIColor(hex: "\(safeViewModel.titleBackgroundColor)ff")
            videosContainerView.backgroundColor = UIColor(hex: "\(safeViewModel.titleBackgroundColor)ff")
            videosDurationLabel.text = safeViewModel.duration
            videosDurationLabel.textColor = UIColor(hex: "\(safeViewModel.titleTextColor)ff")
            
            videosActivityView.stopAnimating()
            UIView.animate(withDuration: 0.25) {
                self.videosStackView.alpha = 1.0
            }
        } else {
            
            videosDurationLabel.backgroundColor = .gray
            videosTitleLabelContainerView.backgroundColor = .gray
            videosContainerView.backgroundColor = .gray
            
            videosActivityView.startAnimating()
            UIView.animate(withDuration: 0.25) {
                self.videosStackView.alpha = 0.0
            }
        }
    }
}
