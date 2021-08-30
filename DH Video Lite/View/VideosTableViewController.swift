//
//  VideosTableViewController.swift
//  DH Video Lite
//
//  Created by Yiğit Erdinç on 16.08.2021.
//

import UIKit

class VideosTableViewController: UITableViewController {
    
    @IBOutlet var videosTableView: UITableView!
    
    var videosViewModel = VideosViewModel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        configureTableView()
    }
    
    func setupViewModel(){
        videosViewModel.reloadTableView = {
            DispatchQueue.main.async { self.videosTableView.reloadData() }
        }
    }
    
    func configureTableView() {
        self.videosTableView.register(UINib(nibName: K.videosTableViewCellNibName, bundle: nil), forCellReuseIdentifier: K.videosTableViewCellIdentifier)
        self.videosTableView.dataSource = self
        self.videosTableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosViewModel.numberOfVideos()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width/4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videosTableView.dequeueReusableCell(withIdentifier: K.videosTableViewCellIdentifier, for: indexPath) as! VideosTableViewCell
        cell.layer.cornerRadius = 3
        let videoViewModel = videosViewModel.getVideoViewModel(indexPath)
        cell.videosImageView.image = videoViewModel.image
        cell.videosTitleLabel.text = videoViewModel.title
        cell.videosTitleLabel.textColor = UIColor(hex: "\(videoViewModel.titleTextColor)ff")
        cell.videosDurationLabel.backgroundColor = UIColor(hex: "\(videoViewModel.titleBackgroundColor)ff")
        cell.backgroundColor = UIColor(hex: "\(videoViewModel.titleBackgroundColor)ff")
        print(videoViewModel.titleBackgroundColor)
        cell.videosDurationLabel.text = videoViewModel.duration
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
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
