//
//  String+HTMLExtension.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/22/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var htmlString: NSAttributedString? {
        guard let data = data(using: String.Encoding.utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
}
