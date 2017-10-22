//
//  SAMProductTableViewCell.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/21/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit
import AlamofireImage

class SAMProductTableViewCell: UITableViewCell, SAMTableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configureWith(_ item: Any) {
        let product = item as! SAMProduct
        
        nameLabel.text = product.name
        descriptionLabel.text = product.shortDescription
        if let imageURL = product.productImageURL {
            productImageView.af_setImage(withURL: URL(string: imageURL)!, placeholderImage: UIImage(named: "placeholder"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .flipFromBottom(0.3), runImageTransitionIfCached: false, completion: nil)
        }
    }
}
