//
//  VideoDetailsViewController.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 31.08.2021.
//

import UIKit
import MurkyVideoPlayer

class VideoDetailsViewController: UIViewController {

    let videoDetailsView = UIView()
    let videoDetailsPlayerView = UIView()
    let videoDetailsTableView = UITableView()
    var tableViewConstraints: [NSLayoutConstraint]?

    var videoDetailsViewModel: VideoDetailsViewModel?
    var videoPlayer: MVP?

    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = videoDetailsViewModel?.title
        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : K.dhColor]
        navigationController?.navigationBar.tintColor = K.dhColor

        view.addSubview(videoDetailsView)

        configureVideoPlayer()
        videoDetailsView.addSubview(videoPlayer!)

        configureTableView()
        videoDetailsView.addSubview(videoDetailsTableView)
        setupTableViewConstraints()

        updatePlayerUI()
        videoPlayer?.playerReady()
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            self.updatePlayerUI()
            self.videoPlayer?.deviceRotated()
        })
    }

    override func viewDidDisappear(_ animated: Bool) {
        videoPlayer?.player?.pause()
    }
}

extension VideoDetailsViewController {

    func configureVideoPlayer() {
        videoPlayer = MVP.init(width: view.frame.width, height: view.frame.height)
        videoPlayer?.setQualityNames(firstName: "FHD",
                                     secondName: "HD",
                                     thirdName: "SD",
                                     fourthName: "MP3")
        videoPlayer?.setQualityURLs(firstURL: URL(string: videoDetailsViewModel!.fhdUrl),
                                    secondURL: URL(string: videoDetailsViewModel!.hdUrl),
                                    thirdURL: URL(string: videoDetailsViewModel!.sdUrl),
                                    fourthURL: URL(string: videoDetailsViewModel!.mp3Url))
        videoPlayer?.preferredQuality(quality: .firstQuality)
        videoPlayer?.setSliderColor(miniumTrackTintColor: K.dhColor, thumbColor: K.dhColor, maximumTrackTintColor: UIColor.gray)
    }

    func updatePlayerUI() {
        videoDetailsPlayerView.frame = view.frame
        if UIApplication.shared.statusBarOrientation.isPortrait {
            self.view.backgroundColor = .white
            self.navigationController?.navigationBar.isHidden = false
            let playerPortraitYPos = (self.navigationController?.navigationBar.frame.height)!+(UIApplication.shared.keyWindow?.safeAreaInsets.top)!
            self.videoDetailsView.frame = CGRect(x: 0, y: playerPortraitYPos, width: self.view.frame.width, height: self.view.frame.height)
        } else {
            self.view.backgroundColor = .black
            self.navigationController?.navigationBar.isHidden = true
            self.videoDetailsView.frame = self.view.frame
        }
    }
}

extension VideoDetailsViewController: UITableViewDelegate, UITableViewDataSource{

    func configureTableView() {
        videoDetailsTableView.delegate = self
        videoDetailsTableView.dataSource = self
        videoDetailsTableView.register(UINib(nibName: K.videoDetailsHeaderTableViewCellNibName, bundle: nil), forCellReuseIdentifier: K.videoDetailsHeaderTableViewCellIdentifier)
    }

    func setupTableViewConstraints() {
        videoDetailsTableView.translatesAutoresizingMaskIntoConstraints = false
        videoDetailsTableView.topAnchor.constraint(equalTo: videoPlayer!.bottomAnchor).isActive = true
        videoDetailsTableView.leftAnchor.constraint(equalTo: videoDetailsView.leftAnchor).isActive = true
        videoDetailsTableView.rightAnchor.constraint(equalTo: videoDetailsView.rightAnchor).isActive = true
        videoDetailsTableView.bottomAnchor.constraint(equalTo: videoDetailsView.bottomAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videoDetailsTableView.dequeueReusableCell(withIdentifier: K.videoDetailsHeaderTableViewCellIdentifier, for: indexPath) as! VideoDetailsHeaderTableViewCell
        cell.configure(with: videoDetailsViewModel!)
        return cell
    }
}
