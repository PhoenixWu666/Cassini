//
//  ImageViewController.swift
//  Cassini
//
//  Created by Phoenix Wu on H30/05/14.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageURL: URL? {
        didSet {
            imageView.image = nil
            imageView.sizeToFit()
            
            scrollView.contentSize = imageView.frame.size
            
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    var imageView = UIImageView()
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
                imageView.sizeToFit()
                scrollView.contentSize = imageView.frame.size
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageURL == nil {
            imageURL = DemoURLs.stanford
        }
    }

}














