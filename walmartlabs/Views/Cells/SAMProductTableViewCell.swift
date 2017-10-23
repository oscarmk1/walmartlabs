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
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet var ratingImageViews: [UIImageView]!
    
    private let stock = "In Stock"
    private let outOfStock = "Out Of Stock"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.nameLabel.font = UIFont.SAMBold(size: 14)
        self.descriptionLabel.font = UIFont.SAMLight(size: 12)
        self.priceLabel.font = UIFont.SAMRegular(size: 14)
        self.reviewsLabel.font = UIFont.SAMLight(size: 12)
        self.inStockLabel.font = UIFont.SAMBold(size: 14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configureWith(_ item: Any) {
        let product = item as! SAMProduct
        
        self.nameLabel.text = product.name
        self.descriptionLabel.attributedText = product.shortDescription?.htmlString
        self.priceLabel.text = product.price
        
        if let inStock = product.isInStock {
            if (inStock) {
                self.inStockLabel.textColor = UIColor.SAMLightBlue()
                self.inStockLabel.text = stock
            }
            else {
                self.inStockLabel.textColor = UIColor.SAMDarkRed()
                self.inStockLabel.text = outOfStock
            }
        }
        if let reviews = product.reviewCount {
            self.reviewsLabel.text = "(" + String(reviews) + ")"
        }
        if let rating = product.reviewRating {
            highlightImages(true, limit: Int(rating.rounded()))
        }
        if let imageURL = product.productImageURL {
            self.productImageView.af_setImage(withURL: URL(string: imageURL)!, placeholderImage: UIImage(named: "placeholder"), filter: nil, progress: nil, progressQueue: DispatchQueue.main, imageTransition: .flipFromBottom(0.3), runImageTransitionIfCached: false, completion: nil)
        }
        else {
            self.productImageView.image = UIImage(named: "placeholder")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        highlightImages(false, limit: 5)
        self.nameLabel.text = nil
        self.reviewsLabel.text = nil
        self.priceLabel.text = nil
        self.inStockLabel.text = nil
        self.descriptionLabel.attributedText = nil
        self.productImageView.image = nil
    }
    
    private func highlightImages(_ highlighted: Bool, limit: Int) {
        for i in 0 ..< limit {
            self.ratingImageViews[i].isHighlighted = highlighted
        }
    }
}
