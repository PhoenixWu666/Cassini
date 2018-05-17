//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Phoenix Wu on H30/05/17.
//  Copyright © 平成30年 Phoenix Wu. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, let url = DemoURLs.NASA[identifier] {
            if let imgVC = segue.destination.contents as? ImageViewController {
                imgVC.imageURL = url
                imgVC.title = (sender as? UIButton)?.currentTitle
            }
        }
    }

}

extension UIViewController {
    
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
    
}
