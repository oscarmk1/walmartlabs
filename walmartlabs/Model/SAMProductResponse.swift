//
//  SAMProductResponse.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/22/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

public class SAMproductResponse {
    
    public var identifier: String?
    public var products: [SAMProduct]?
    public var totalProducts: Int?
    public var pageNumber: Int?
    public var pageSize: Int?
    public var status: Int?
    public var kind: String?
    public var etag: String?
    
    init(dict: [String: Any]) {
        identifier = dict[SAMProductResponseJSONKeys.identifier] as? String
        if let productsJSON = dict[SAMProductResponseJSONKeys.products] as? [[String: Any]] {
            let mappedProducts = productsJSON.map { json in
                return SAMProduct(dict: json)
            }
            products = mappedProducts
        }
        totalProducts = dict[SAMProductResponseJSONKeys.totalProducts] as? Int
        pageNumber = dict[SAMProductResponseJSONKeys.pageNumber] as? Int
        pageSize = dict[SAMProductResponseJSONKeys.pageSize] as? Int
        status = dict[SAMProductResponseJSONKeys.status] as? Int
        kind = dict[SAMProductResponseJSONKeys.kind] as? String
        etag = dict[SAMProductResponseJSONKeys.etag] as? String
    }
}
