//
//  BaseRESTService.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/21/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit
import Alamofire

public enum SAMServiceError: Error {
    case genericError
    case dataError
    case networkError(error: Error)
}

public typealias SAMServiceCompletionBlock = (_ error: SAMServiceError?, _ json: [String: Any]?) -> Void

public protocol SAMBaseREST {
    func sendRequest(seviceEndpoint: SAMServiceEndpoint, paginationData: String?, completionBlock: @escaping SAMServiceCompletionBlock)
}

class SAMBaseRESTService: SAMBaseREST {
    public func sendRequest(seviceEndpoint: SAMServiceEndpoint, paginationData: String?, completionBlock: @escaping SAMServiceCompletionBlock) {
        var request = SAMServiceConstants.hostURL + SAMServiceConstants.version + seviceEndpoint.rawValue + SAMServiceConstants.apiKey
        if let pagination = paginationData {
            request += pagination
        }
        Alamofire.request(request).validate(statusCode: 200..<300).validate(contentType: ["application/json"]).responseJSON { response in
            switch response.result {
                case .success:
                    guard let dict = response.result.value as? [String: Any] else {
                        completionBlock(.dataError, nil)
                        return
                    }
                    completionBlock(nil, dict)
                case .failure(let error):
                    completionBlock(.networkError(error: error), nil)
            }
        }
    }
}
