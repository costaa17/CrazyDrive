//
//  Shape.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/30/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class Shape: SKSpriteNode {
    
    /*Type 1 = Square
      Type 2 = Polygon
      Type 3 = Triangle
      Type 4 = DiTriangle
    */
   
    init(type: Int, shapeC: UIColor) {
        let image: UIImage?//do your setup here to make a UIImage
        
        switch type{
        case 1:
            image = imageManager.squareImage(shapeC) //do your setup here to make a UIImage
        case 2:
            image = imageManager.polygonImage(shapeC) //do your setup here to make a UIImage
        case 3:
            image = imageManager.triangleImage(shapeC) //do your setup here to make a UIImage
        case 4:
            image = imageManager.ditriangleImage(shapeC)
        default:
            image = imageManager.ditriangleImage(shapeC) //do your setup here to make a UIImage
        }
        
        let Texture = SKTexture(image: image!)
        
        super.init(texture: Texture, color: UIColor.blackColor(), size: image!.size)
        
        self.xScale = 3
        self.yScale = 3
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
