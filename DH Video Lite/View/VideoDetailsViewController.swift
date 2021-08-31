//
//  VideoDetailsViewController.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 31.08.2021.
//

import UIKit

class VideoDetailsViewController: UIViewController {
    
    @IBOutlet weak var videoDetailsPlayerView: UIView!
    @IBOutlet weak var videoDetailsTableView: UITableView!
    
    var videoDetailsViewModel: VideoDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
}

extension VideoDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func configureTableView() {
        videoDetailsTableView.delegate = self
        videoDetailsTableView.dataSource = self
        videoDetailsTableView.register(UINib(nibName: K.videoDetailsHeaderTableViewCellNibName, bundle: nil), forCellReuseIdentifier: K.videoDetailsHeaderTableViewCellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoDetailsTableView.dequeueReusableCell(withIdentifier: K.videoDetailsHeaderTableViewCellIdentifier, for: indexPath) as! VideoDetailsHeaderTableViewCell
        cell.videoDetailsHeaderTitleContainer.backgroundColor = UIColor(hex: "\(videoDetailsViewModel!.titleBackgroundColor)ff")
        cell.videoDetailsHeaderTitleLabel.textColor = UIColor(hex: "\(videoDetailsViewModel!.titleTextColor)ff")
        cell.videoDetailsHeaderTitleLabel.text = videoDetailsViewModel!.title
        cell.videoDetailsHeaderCategoryLabel.text = videoDetailsViewModel!.videoCategory
        cell.videoDetailsHeaderDateOfCreationLabel.textColor = UIColor(hex: "\(videoDetailsViewModel!.titleTextColor)ff")
        cell.videoDetailsHeaderDateOfCreationLabel.text = videoDetailsViewModel!.videoDateOfCreation
        cell.videoDetailsHeaderTimesReadLabel.text = "\(videoDetailsViewModel!.timesRead)"
        cell.videoDetailsHeaderCurrentReadersCountLabel.text = "\(videoDetailsViewModel!.currentReaderCount)"
        cell.videoDetailsHeaderCommentCountLabel.text = "\(videoDetailsViewModel!.commentCount)"
        cell.videoDetailsHeaderShortContentLabel.text = videoDetailsViewModel!.shortContent
        return cell
    }
}
