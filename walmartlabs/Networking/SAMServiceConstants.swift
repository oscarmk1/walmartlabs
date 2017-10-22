//
//  ServiceConstants.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/21/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import Foundation

struct SAMServiceConstants {
    static let hostURL = "https://walmartlabs-test.appspot.com/_ah/api/walmart/"
    static let version = "v1/"
    static let apiKey = "4ece7420-bb23-4490-854b-9b36634f4e56/"
}

public enum SAMServiceEndpoint: String {
    case walmartproducts = "walmartproducts/"
}

struct SAMProductResponseJSONKeys {
    static let products = "products"
    static let identifier = "id"
    static let totalProducts = "totalProducts"
    static let pageNumber = "pageNumber"
    static let pageSize = "pageSize"
    static let status = "status"
    static let kind = "kind"
    static let etag = "etag"
}

struct SAMProductJSONKeys {
    static let productId = "productId"
    static let productName = "productName"
    static let shortDescription = "shortDescription"
    static let longDescription = "longDescription"
    static let price = "price"
    static let productImage = "productImage"
    static let reviewRating = "reviewRating"
    static let reviewCount = "reviewCount"
    static let inStock = "inStock"
}
