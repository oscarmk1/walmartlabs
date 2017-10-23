//
//  UIFont+FontExtension.swift
//  walmartlabs
//
//  Created by Oscar Gomez Novau on 10/23/17.
//  Copyright © 2017 Oscar Gomez Novau. All rights reserved.
//

import UIKit

extension UIFont {
    static func SAMRegular(size: CGFloat) -> UIFont?
    {
        return UIFont(name: "Helvetica", size: size)
    }
    
    static func SAMBold(size: CGFloat) -> UIFont?
    {
        return UIFont(name: "Helvetica-Bold", size: size)
    }
    
    static func SAMLight(size: CGFloat) -> UIFont?
    {
        return UIFont(name: "Helvetica-Light", size: size)
    }
}
