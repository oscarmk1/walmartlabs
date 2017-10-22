//
//  UIView+NibExtension.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/22/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit

extension UIView {
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)!.first as! T
    }
}
