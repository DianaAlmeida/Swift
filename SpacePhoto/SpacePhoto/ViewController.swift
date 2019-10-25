//
//  ViewController.swift
//  SpacePhoto
//
//  Created by itsector on 03/10/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            guard let photoInfo = photoInfo else {return }
            DispatchQueue.main.async {
                self.titleLabel.text = photoInfo.title
                self.descriptionLabel.text = photoInfo.description
                self.updateUI(with: photoInfo)
                if let copyright = photoInfo.copyright {
                    self.copyrightLabel.text = "Copyright \(copyright)"
                } else {
                    self.copyrightLabel.isHidden = true
                }
                
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        guard let url = photoInfo.url.withHTTPS() else { return}
        
        let task = URLSession.shared.dataTask(with: url, completionHandler:  { (data, response, error) in
            guard let data = data,
                let image = UIImage(data: data) else { return}
            DispatchQueue.main.async {
                self.titleLabel.text = photoInfo.title
                self.photoView.image = image
                self.descriptionLabel.text = photoInfo.description
                
                if let copyright = photoInfo.copyright {
                    self.copyrightLabel.text = "Copyright \(copyright)"
                } else {
                    self.copyrightLabel.isHidden = true
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        })
        task.resume()
        
    }
}


