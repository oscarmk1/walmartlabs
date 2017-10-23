//
//  SAMProductDetailViewController.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/22/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit
import WebKit

class SAMProductDetailViewController: UIViewController {
    
    ///@brief Coud have used a label and use the HTML extension, but webViews are very efficient at displaying HTML content.
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    var product: SAMProduct!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - IBActions
    @IBAction func didTapBuy(_ sender: Any) {
        let alertController = UIAlertController(title: "Coming soon", message: "Very soon!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Private
    private func configureUI() {
        self.titleLabel.font = UIFont.SAMBold(size: 18)
        self.detailTextView.font = UIFont.SAMLight(size: 14)
        self.priceLabel.font = UIFont.SAMRegular(size: 16)
        
        if let longDesc = self.product.longDescription {
            self.detailTextView.attributedText = longDesc.htmlString
        }
        self.titleLabel.text = self.product.name
        self.priceLabel.text = self.product.price
    }
}
