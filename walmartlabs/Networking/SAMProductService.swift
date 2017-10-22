//
//  ProductService.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/21/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit

public typealias ProductServiceCompletionBlock = (_ error: SAMServiceError?, _ response: SAMproductResponse?) -> Void

public class SAMProductService {
    lazy var service: SAMBaseREST = SAMBaseRESTService()
    
    public func fetchProducts(paginationData: String, completionBlock: @escaping ProductServiceCompletionBlock) {
        self.service.sendRequest(seviceEndpoint: .walmartproducts, paginationData: paginationData) { (error, json) in
            guard error == nil, let dict = json else {
                completionBlock(error ?? .genericError, nil)
                return
            }
            let response = SAMproductResponse(dict: dict)
            DispatchQueue.main.async {
                completionBlock(error, response)
            }
        }
    }
}
