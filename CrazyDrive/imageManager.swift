//
//  imageManager.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/30/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import UIKit

class imageManager{
    
    class func squareImage(color: UIColor) -> UIImage {
        let size: CGSize = CGSize(width: 22, height: 22)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //// square Drawing
        let squarePath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 22, height: 22))
        color.setFill()
        squarePath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //clear
        UIGraphicsEndImageContext()
        return image
        
    }
    
    class func polygonImage(color: UIColor) -> UIImage {
        let size: CGSize = CGSize(width: 24, height: 23)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        
        //// Polygon Drawing
        CGContextSaveGState(context)
        CGContextTranslateCTM(context, 24, 22.5)
        CGContextRotateCTM(context, -180 * CGFloat(M_PI) / 180)
        
        let polygonPath = UIBezierPath()
        polygonPath.moveToPoint(CGPointMake(12, 0))
        polygonPath.addLineToPoint(CGPointMake(23.41, 7.95))
        polygonPath.addLineToPoint(CGPointMake(19.05, 20.8))
        polygonPath.addLineToPoint(CGPointMake(4.95, 20.8))
        polygonPath.addLineToPoint(CGPointMake(0.59, 7.95))
        polygonPath.closePath()
        color.setFill()
        polygonPath.fill()
        
        CGContextRestoreGState(context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //clear
        UIGraphicsEndImageContext()
        return image
        
    }
    
    class func triangleImage(color: UIColor) -> UIImage {
        let size: CGSize = CGSize(width: 23, height: 23)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //// triangle Drawing
        let trianglePath = UIBezierPath()
        trianglePath.moveToPoint(CGPointMake(22.5, 0.5))
        trianglePath.addLineToPoint(CGPointMake(11.5, 23.5))
        trianglePath.addLineToPoint(CGPointMake(0.5, 0.5))
        trianglePath.addLineToPoint(CGPointMake(22.5, 0.5))
        trianglePath.addLineToPoint(CGPointMake(22.5, 0.5))
        trianglePath.closePath()
        color.setFill()
        trianglePath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //clear
        UIGraphicsEndImageContext()
        return image
        
    }
    
    class func ditriangleImage(color: UIColor) -> UIImage {
        let size: CGSize = CGSize(width: 21, height: 23)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //// ditriangle Drawing
        let ditrianglePath = UIBezierPath()
        ditrianglePath.moveToPoint(CGPointMake(20.5, 0.5))
        ditrianglePath.addLineToPoint(CGPointMake(14.5, 23.5))
        ditrianglePath.addLineToPoint(CGPointMake(8.5, 5.5))
        ditrianglePath.addLineToPoint(CGPointMake(1.5, 14.5))
        ditrianglePath.addLineToPoint(CGPointMake(1.5, 0.5))
        ditrianglePath.addLineToPoint(CGPointMake(20.5, 0.5))
        ditrianglePath.closePath()
        color.setFill()
        ditrianglePath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //clear
        UIGraphicsEndImageContext()
        return image
    }
    
    class func backgroundImage() -> UIImage {
        let size: CGSize = CGSize(width: 240, height: 120)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //// Sky Drawing
        let rectanglePath = UIBezierPath(rect: CGRectMake(0, 0, 240, 120))
        SKY_COLOR.setFill()
        rectanglePath.fill()
        
        
        //// Ground Drawing
        let rectangle2Path = UIBezierPath(rect: CGRectMake(0, 95, 240, 30))
        GROUND_COLOR.setFill()
        rectangle2Path.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //clear
        UIGraphicsEndImageContext()
        return image
        
    }
    
    class func truckImage() -> UIImage {
        let size: CGSize = CGSize(width: 92, height: 57)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        //// Truck body Drawing
        let rectanglePath = UIBezierPath(rect: CGRectMake(0, 20, 92, 25))
        TRUCK_COLOR.setFill()
        rectanglePath.fill()
        
        
        //// Wheels Drawing
        let ovalPath = UIBezierPath(ovalInRect: CGRectMake(11, 39, 19, 18))
        TIRES_COLOR.setFill()
        ovalPath.fill()
        
        let oval2Path = UIBezierPath(ovalInRect: CGRectMake(60, 39, 19, 18))
        TIRES_COLOR.setFill()
        oval2Path.fill()

        let oval3Path = UIBezierPath(ovalInRect: CGRectMake(16, 42, 9, 11))
        WHEELS_COLOR.setFill()
        oval3Path.fill()

        let oval4Path = UIBezierPath(ovalInRect: CGRectMake(65, 42, 9, 11))
        WHEELS_COLOR.setFill()
        oval4Path.fill()
        
        
        //// Truck top Drawing
        let bezierPath = UIBezierPath()
        bezierPath.moveToPoint(CGPointMake(77.5, 20.5))
        bezierPath.addLineToPoint(CGPointMake(71.5, -0.5))
        bezierPath.addLineToPoint(CGPointMake(45.5, -0.5))
        bezierPath.addLineToPoint(CGPointMake(45.5, 20.5))
        bezierPath.addLineToPoint(CGPointMake(77.5, 20.5))
        bezierPath.closePath()
        TRUCK_COLOR.setFill()
        bezierPath.fill()

        
        //// Window drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(73.5, 19.5))
        bezier2Path.addLineToPoint(CGPointMake(64.5, 4.5))
        bezier2Path.addLineToPoint(CGPointMake(52.5, 4.5))
        bezier2Path.addLineToPoint(CGPointMake(52.5, 19.5))
        bezier2Path.addLineToPoint(CGPointMake(73.5, 19.5))
        bezier2Path.closePath()
        WINDOW_COLOR.setFill()
        bezier2Path.fill()
        UIColor.blackColor().setStroke()
        bezier2Path.lineWidth = 1
        bezier2Path.stroke()
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //clear
        UIGraphicsEndImageContext()
        return image
        
    }
    
    class func imageForHelpSymbol() -> UIImage {
        
        let size: CGSize = CGSize(width: 38, height: 38);
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)

        //// HelpSymbol Drawing
        let helpSymbolRect = CGRectMake(1, 1, 35, 35)
        let helpSymbolPath = UIBezierPath(ovalInRect: helpSymbolRect)
        HELP_SYMBOL_COLOR.setStroke()
        helpSymbolPath.lineWidth = 2.5
        helpSymbolPath.stroke()
        
        let helpSymbolStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        helpSymbolStyle.alignment = .Center
        
        let helpSymbolFontAttributes = [NSFontAttributeName: UIFont(name: "DINAlternate-Bold", size: 30)!, NSForegroundColorAttributeName: HELP_SYMBOL_COLOR, NSParagraphStyleAttributeName: helpSymbolStyle]

        "?".drawInRect(helpSymbolRect, withAttributes: helpSymbolFontAttributes)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
    }



}
