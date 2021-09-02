//
//  VideosCollectionViewController.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 30.08.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class VideosCollectionViewController: UICollectionViewController, UICollectionViewDataSourcePrefetching, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var videosCollectionView: UICollectionView!
    
    let videosCollectionViewActivityIndicator = UIActivityIndicatorView()
    
    private var videosViewModel: VideosViewModel!
    private var selectedVideoDetailsViewModel: VideoDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "DH Video Lite"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : K.dhColor]
        navigationController?.navigationBar.tintColor = K.dhColor
        
        configureCollectionView()
        videosViewModel = VideosViewModel(delegate: self)
        videosViewModel.getVideos()
    }
    
    func configureCollectionView() {
        self.videosCollectionView.register(UINib(nibName: K.videosCollectionViewCellNibName, bundle: nil), forCellWithReuseIdentifier: K.videosCollectionViewCellIdentifier)
        self.videosCollectionView.dataSource = self
        self.videosCollectionView.prefetchDataSource = self
        self.videosCollectionView.delegate = self
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let videoDetailsViewController = segue.destination as! VideoDetailsViewController
        videoDetailsViewController.videoDetailsViewModel = selectedVideoDetailsViewModel
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: isLoadingCell) {
            if indexPaths.contains(where: isLoadingCell) {
                videosViewModel.getVideos()
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: K.videosCollectionViewCellIdentifier, for: indexPath) as! VideosCollectionViewCell
        
        if isLoadingCell(for: indexPath) {
            cell.configure(with: .none)
            cell.isUserInteractionEnabled = false
        } else {
            let videoViewModel = videosViewModel.getVideoViewModel(indexPath)
            cell.configure(with: videoViewModel)
            cell.isUserInteractionEnabled = true
        }
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedVideoDetailsViewModel = videosViewModel.getVideoViewModel(indexPath)
        performSegue(withIdentifier: K.videosToVideoDetailsSegue, sender: videosCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(videosCollectionView.bounds.width-20), height: (videosCollectionView.frame.width)/3.5)
    }
}

extension VideosCollectionViewController: VideosViewModelDelegate {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?) {
        guard let newIndexPathsToReload = newIndexPathsToReload else {
            collectionView.isHidden = false
            collectionView.reloadData()
            return
        }
        // 2
        let indexPathsToReload = visibleIndexPathsToReload(intersecting: newIndexPathsToReload)
        collectionView.reloadItems(at: indexPathsToReload)
    }
    
    func onFetchFailed(with reason: String) {
    }
}

private extension VideosCollectionViewController {
  func isLoadingCell(for indexPath: IndexPath) -> Bool {
    return indexPath.row >= videosViewModel.numberOfVideos
  }

  func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
    let indexPathsForVisibleRows = videosCollectionView.indexPathsForVisibleItems
    let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
    return Array(indexPathsIntersection)
  }
}
