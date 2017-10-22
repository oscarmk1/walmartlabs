//
//  SAMProduct.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/21/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

public class SAMProduct {
    
    public var productId: String?
    public var name: String?
    public var shortDescription: String?
    public var longDescription: String?
    public var price: String?
    public var productImageURL: String?
    public var reviewRating: Int?
    public var reviewCount: Int?
    public var isInStock: Bool?
    
    init(dict: [String: Any]) {
        productId = dict[SAMProductJSONKeys.productId] as? String
        name = dict[SAMProductJSONKeys.productName] as? String
        shortDescription = dict[SAMProductJSONKeys.shortDescription] as? String
        longDescription = dict[SAMProductJSONKeys.longDescription] as? String
        price = dict[SAMProductJSONKeys.price] as? String
        productImageURL = dict[SAMProductJSONKeys.productImage] as? String
        reviewRating = dict[SAMProductJSONKeys.reviewRating] as? Int
        reviewCount = dict[SAMProductJSONKeys.reviewCount] as? Int
        isInStock = dict[SAMProductJSONKeys.inStock] as? Bool
    }
}
