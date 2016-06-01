//
//  Sample.swift
//  CrazyDrive
//
//  Created by Ana Vitoria do Valle Costa on 5/30/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
class Hole: Shape {
    init(type: Int) {
        super.init(type: type, shapeC: SKY_COLOR)
        self.physicsBody?.categoryBitMask = HOLE_CATEGORY
        self.physicsBody?.contactTestBitMask = TRUCK_CATEGORY 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}