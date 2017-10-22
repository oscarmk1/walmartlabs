//
//  SAMLoadingFooterView.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/22/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit

class SAMLoadingFooterView: UIView {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var doneImageView: UIImageView!

    public func startAnimating() {
        self.activityIndicator.startAnimating()
    }
    
    public func stopAnimating() {
        self.activityIndicator.stopAnimating()
    }
    
    public func doneLoading() {
        stopAnimating()
        self.doneImageView.isHidden = false
    }
}
