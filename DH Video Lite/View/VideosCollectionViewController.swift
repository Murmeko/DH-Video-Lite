//
//  VideosCollectionViewController.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 30.08.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class VideosCollectionViewController: UICollectionViewController {
    
    @IBOutlet var videosCollectionView: UICollectionView!
    
    var videosViewModel = VideosViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewModel()
        configureTableView()
        title = "DH Video Lite"
    }
    
    func setupViewModel(){
        videosViewModel.reloadTableView = {
            DispatchQueue.main.async { self.videosCollectionView.reloadData() }
        }
    }
    
    func configureTableView() {
        self.videosCollectionView.register(UINib(nibName: K.videosCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.videosCollectionViewCellIdentifier)
        self.videosCollectionView.dataSource = self
        self.videosCollectionView.delegate = self
        if let layout = videosCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            let size = CGSize(width:(videosCollectionView.bounds.width-20), height: (videosCollectionView.frame.width)/3.5)
                layout.itemSize = size
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videosViewModel.numberOfVideos()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: K.videosCollectionViewCellIdentifier, for: indexPath) as! VideosCollectionViewCell
        cell.layer.cornerRadius = 3
        let videoViewModel = videosViewModel.getVideoViewModel(indexPath)
        cell.videosImageView.image = videoViewModel.image
        cell.videosTitleLabel.text = videoViewModel.title
        cell.videosTitleLabel.textColor = UIColor(hex: "\(videoViewModel.titleTextColor)ff")
        cell.videosDurationLabel.backgroundColor = UIColor(hex: "\(videoViewModel.titleBackgroundColor)ff")
        cell.videosTitleLabelContainerView.backgroundColor = UIColor(hex: "\(videoViewModel.titleBackgroundColor)ff")
        cell.videosContainerView.backgroundColor = UIColor(hex: "\(videoViewModel.titleBackgroundColor)ff")
        cell.videosDurationLabel.text = videoViewModel.duration
        cell.videosDurationLabel.textColor = UIColor(hex: "\(videoViewModel.titleTextColor)ff")
        return cell
    }

    // MARK: UICollectionViewDelegate

    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
