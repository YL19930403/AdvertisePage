//
//  UIColor+Category.swift
//  WeiBoSwift
//
//  Created by 余亮 on 16/4/1.
//  Copyright © 2016年 余亮. All rights reserved.
//

import UIKit

extension UIColor {
    class func randomColor() -> UIColor{
        return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber(), alpha: 1.0 )
    }
    
    class func randomNumber() -> CGFloat{
        return CGFloat(arc4random_uniform(256)) / CGFloat(255)
    }
    
    class func RGBColor(R : CGFloat,G : CGFloat, B: CGFloat,A:CGFloat) -> UIColor{
        return UIColor(red: R / 255.0, green: G / 255.0, blue: B / 255.0, alpha: A)
    }
}


extension UIColor{
    static func colorWith(hex: String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        
        if (cString.characters.count != 6) {
            return UIColor.grayColor()
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
}


















